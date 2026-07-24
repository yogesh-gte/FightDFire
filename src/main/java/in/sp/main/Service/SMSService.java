package in.sp.main.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * Sends emergency SMS via Twilio or Msg91 when {@code sms.enabled=true}.
 * When disabled, returns false — callers should rely on EmailService separately.
 */
@Service
public class SMSService {

    private static final Logger logger = LoggerFactory.getLogger(SMSService.class);

    @Value("${sms.provider:twilio}")
    private String smsProvider;

    @Value("${sms.twilio.account-sid:}")
    private String twilioAccountSid;

    @Value("${sms.twilio.auth-token:}")
    private String twilioAuthToken;

    @Value("${sms.twilio.phone-number:}")
    private String twilioPhoneNumber;

    @Value("${sms.msg91.auth-key:}")
    private String msg91AuthKey;

    @Value("${sms.msg91.sender-id:}")
    private String msg91SenderId;

    @Value("${sms.enabled:false}")
    private boolean smsEnabled;

    public boolean isEnabled() {
        return smsEnabled;
    }

    public boolean sendSMS(String phoneNumber, String message) {
        if (!smsEnabled) {
            logger.info("SMS disabled (sms.enabled=false) — skipping SMS to {}", maskPhone(phoneNumber));
            return false;
        }
        if (phoneNumber == null || phoneNumber.isBlank()) {
            return false;
        }

        try {
            logger.info("Sending SMS via {} to {}", smsProvider, maskPhone(phoneNumber));
            return switch (smsProvider.toLowerCase().trim()) {
                case "twilio" -> sendViaTwilio(normalizePhone(phoneNumber), message);
                case "msg91" -> sendViaMsg91(normalizePhone(phoneNumber), message);
                default -> {
                    logger.error("Unknown sms.provider='{}'. Use 'twilio' or 'msg91'.", smsProvider);
                    yield false;
                }
            };
        } catch (Exception e) {
            logger.error("Failed to send SMS to {}: {}", maskPhone(phoneNumber), e.getMessage());
            return false;
        }
    }

    public boolean sendSOSSMS(String phoneNumber, String userName, String mapsLink,
                              String acceptToken, String rejectToken, String baseUrl) {
        String message = String.format(
                "EMERGENCY SOS: %s needs help! Location: %s Accept: %s/sos/respond?token=%s&action=accept Decline: %s/sos/respond?token=%s&action=reject",
                userName, mapsLink, baseUrl, acceptToken, baseUrl, rejectToken
        );
        return sendSMS(phoneNumber, message);
    }

    private boolean sendViaTwilio(String phoneNumber, String message) {
        if (isBlank(twilioAccountSid) || isBlank(twilioAuthToken) || isBlank(twilioPhoneNumber)) {
            logger.error("Twilio credentials not configured (TWILIO_ACCOUNT_SID / AUTH_TOKEN / PHONE_NUMBER)");
            return false;
        }

        try {
            String url = "https://api.twilio.com/2010-04-01/Accounts/" + twilioAccountSid + "/Messages.json";
            String formData = "From=" + java.net.URLEncoder.encode(twilioPhoneNumber, StandardCharsets.UTF_8)
                    + "&To=" + java.net.URLEncoder.encode(phoneNumber, StandardCharsets.UTF_8)
                    + "&Body=" + java.net.URLEncoder.encode(message, StandardCharsets.UTF_8);

            HttpURLConnection connection = (HttpURLConnection) URI.create(url).toURL().openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(15000);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            String auth = twilioAccountSid + ":" + twilioAuthToken;
            connection.setRequestProperty("Authorization",
                    "Basic " + Base64.getEncoder().encodeToString(auth.getBytes(StandardCharsets.UTF_8)));

            try (OutputStream os = connection.getOutputStream()) {
                os.write(formData.getBytes(StandardCharsets.UTF_8));
            }

            int responseCode = connection.getResponseCode();
            String body = readBody(connection, responseCode >= 200 && responseCode < 300);
            if (responseCode == 200 || responseCode == 201) {
                logger.info("Twilio SMS accepted for {}", maskPhone(phoneNumber));
                return true;
            }
            logger.error("Twilio SMS failed code {}: {}", responseCode, truncate(body, 300));
            return false;
        } catch (Exception e) {
            logger.error("Twilio SMS exception: {}", e.getMessage());
            return false;
        }
    }

    /**
     * Msg91 SendSMS API (transactional). Requires MSG91_AUTH_KEY and MSG91_SENDER_ID.
     */
    private boolean sendViaMsg91(String phoneNumber, String message) {
        if (isBlank(msg91AuthKey) || isBlank(msg91SenderId)) {
            logger.error("Msg91 credentials not configured (MSG91_AUTH_KEY / MSG91_SENDER_ID)");
            return false;
        }

        try {
            String mobiles = phoneNumber.replace("+", "").replaceAll("\\s+", "");
            String url = "https://api.msg91.com/api/sendhttp.php"
                    + "?authkey=" + java.net.URLEncoder.encode(msg91AuthKey, StandardCharsets.UTF_8)
                    + "&mobiles=" + java.net.URLEncoder.encode(mobiles, StandardCharsets.UTF_8)
                    + "&message=" + java.net.URLEncoder.encode(message, StandardCharsets.UTF_8)
                    + "&sender=" + java.net.URLEncoder.encode(msg91SenderId, StandardCharsets.UTF_8)
                    + "&route=4"
                    + "&country=91";

            HttpURLConnection connection = (HttpURLConnection) URI.create(url).toURL().openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(15000);

            int responseCode = connection.getResponseCode();
            String body = readBody(connection, responseCode >= 200 && responseCode < 300).trim();
            // Msg91 returns a request id string on success; error often starts with error text
            if (responseCode == 200 && !body.isEmpty()
                    && !body.toLowerCase().contains("error")
                    && !body.toLowerCase().startsWith("{\"type\":\"error\"")) {
                logger.info("Msg91 SMS accepted for {} (ref={})", maskPhone(phoneNumber), truncate(body, 40));
                return true;
            }
            logger.error("Msg91 SMS failed code {}: {}", responseCode, truncate(body, 300));
            return false;
        } catch (Exception e) {
            logger.error("Msg91 SMS exception: {}", e.getMessage());
            return false;
        }
    }

    private static String normalizePhone(String phone) {
        String p = phone.trim().replaceAll("[\\s\\-()]", "");
        if (p.matches("\\d{10}")) {
            return "+91" + p;
        }
        if (p.startsWith("91") && p.length() == 12) {
            return "+" + p;
        }
        return p.startsWith("+") ? p : "+" + p;
    }

    private static String maskPhone(String phone) {
        if (phone == null || phone.length() < 4) return "****";
        return "****" + phone.substring(phone.length() - 4);
    }

    private static boolean isBlank(String s) {
        return s == null || s.isBlank();
    }

    private static String truncate(String s, int max) {
        if (s == null) return "";
        return s.length() <= max ? s : s.substring(0, max) + "...";
    }

    private static String readBody(HttpURLConnection connection, boolean success) {
        try {
            var stream = success ? connection.getInputStream() : connection.getErrorStream();
            if (stream == null) return "";
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
                return sb.toString();
            }
        } catch (Exception e) {
            return "";
        }
    }
}
