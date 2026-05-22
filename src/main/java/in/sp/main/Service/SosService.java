package in.sp.main.Service;

import java.time.LocalDateTime;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.EmergencyContact;
import in.sp.main.Entities.SOSContactResponse;
import in.sp.main.Entities.SOSRequest;
import in.sp.main.Entities.TrustedContact;
import in.sp.main.Entities.User;
import in.sp.main.Repository.EmergencyContactRepository;
import in.sp.main.Repository.SOSContactResponseRepository;
import in.sp.main.Repository.SOSRequestRepository;
import in.sp.main.Repository.TrustedContactRepository;
import in.sp.main.Repository.UserRepository;

@Service
public class SosService {
    
    @Autowired
    private SOSRequestRepository sosRequestRepository;
    
    @Autowired
    private SOSContactResponseRepository sosContactResponseRepository;
    
    @Autowired
    private TrustedContactRepository trustedContactRepository;
    
    @Autowired
    private EmergencyContactRepository emergencyContactRepository;
    
    @Autowired
    private EmailService emailService;
    
    @Autowired
    private SMSService smsService;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
    
    @Value("${app.base-url:http://localhost:8080}")
    private String baseUrl;

    /**
     * TWO-TIER SOS TRIGGER FLOW:
     * 
     * TIER 1 (0-30s): Notify Trusted Contacts
     * - Send SMS with accept/reject links
     * - Send email with location
     * - Auto-call primary contact
     * 
     * TIER 2 (30-60s): Escalate if needed
     * - If <2 contacts accepted, notify more
     * - Auto-escalate to emergency services
     * 
     * REAL-TIME TRACKING:
     * - User sees who accepted/rejected
     * - WebSocket updates for live status
     */
    public Map<String, Object> triggerSOS(Long userId, double userLat, double userLon) {
        try {
            Optional<User> userOpt = userRepository.findById(userId);
            User user = userOpt.orElseThrow(() -> new RuntimeException("User not found"));
            String userName = user.getFullName();
            if (userName == null || userName.isEmpty()) userName = user.getEmail();
            if (userName == null || userName.isEmpty()) userName = "User #" + userId;
            String userPhone = user.getPhoneNumber() != null ? user.getPhoneNumber() : "Unknown Number";

            System.out.println("🚨 SOS Triggered by: " + userName + " (ID: " + userId + ")");
            System.out.println("📍 Location: " + userLat + ", " + userLon);

            // Create SOS Request
            SOSRequest sosRequest = new SOSRequest();
            sosRequest.setUser(user);
            sosRequest.setLatitude(userLat);
            sosRequest.setLongitude(userLon);
            sosRequest.setGoogleMapsLink("https://www.google.com/maps?q=" + userLat + "," + userLon);
            sosRequest.setActivatedAt(LocalDateTime.now());
            sosRequest.setStatus(SOSRequest.SOSStatus.ACTIVE);

            // Get trusted contacts and emergency contacts
            List<TrustedContact> trustedContacts = trustedContactRepository.findByUserId(userId);
            List<EmergencyContact> emergencyContacts = emergencyContactRepository.findByUserId(userId);
            
            int totalContacts = trustedContacts.size() + emergencyContacts.size();

            // If no contacts, warn but continue
            if (totalContacts == 0) {
                System.out.println("⚠️ No contacts found for user " + userId);
                System.out.println("💡 Please add emergency/trusted contacts in your profile for SOS to work");
            } else {
                System.out.println("📱 Found " + totalContacts + " contact(s)");
            }

            sosRequest.setTotalContactsNotified(totalContacts);
            sosRequest.setContactsPending(totalContacts);

            // Save SOS request first
            SOSRequest savedRequest = sosRequestRepository.save(sosRequest);
            System.out.println("✅ SOS Request saved with ID: " + savedRequest.getId());

        // === TIER 1: Notify Trusted Contacts ===
        List<SOSContactResponse> contactResponses = new ArrayList<>();
        
        for (TrustedContact contact : trustedContacts) {
            SOSContactResponse response = new SOSContactResponse();
            response.setSosRequest(savedRequest);
            response.setContactName(contact.getName());
            response.setContactPhone(contact.getPhone());
            response.setContactEmail(contact.getEmail());
            response.setRelation(contact.getRelation());
            response.setUniqueToken(UUID.randomUUID().toString());
            response.setNotifiedAt(LocalDateTime.now());
            response.setResponseStatus(SOSContactResponse.ResponseStatus.PENDING);

            // Send notifications based on contact preferences
            String notificationMethods = "";
            
            // Send SMS if enabled
            if (contact.isCanReceiveSMS() && contact.getPhone() != null) {
                boolean smsSent = smsService.sendSOSSMS(
                    contact.getPhone(),
                    userName,
                    sosRequest.getGoogleMapsLink(),
                    response.getUniqueToken(),
                    response.getUniqueToken(),
                    baseUrl
                );
                response.setSMSDelivered(smsSent);
                response.setNotificationSent(smsSent);
                notificationMethods += "SMS ";
            }
            
            // Send Email if enabled
            if (contact.isCanReceiveEmail() && contact.getEmail() != null) {
                try {
                    String acceptLink = baseUrl + "/sos/respond?token=" + response.getUniqueToken() + "&action=accept";
                    String rejectLink = baseUrl + "/sos/respond?token=" + response.getUniqueToken() + "&action=reject";
                    
                    String emailBody = "🚨 EMERGENCY SOS ALERT 🚨\n\n"
                        + userName + " has triggered an emergency SOS!\n\n"
                        + "📍 Live Location: " + sosRequest.getGoogleMapsLink() + "\n\n"
                        + "📞 Contact: " + userPhone + "\n\n"
                        + "⏰ Time: " + LocalDateTime.now() + "\n\n"
                        + "═══════════════════════════════\n"
                        + "Please respond immediately:\n\n"
                        + "✅ ACCEPT HELP: " + acceptLink + "\n\n"
                        + "❌ DECLINE: " + rejectLink + "\n\n"
                        + "═══════════════════════════════\n\n"
                        + "This is an automated emergency alert from the Women Safety App.";
                    
                    emailService.sendEmail(
                        contact.getEmail(),
                        "🚨 EMERGENCY SOS - " + userName + " needs your help!",
                        emailBody
                    );
                    response.setEmailDelivered(true);
                    response.setNotificationSent(true);
                    notificationMethods += "Email ";
                } catch (Exception e) {
                    System.err.println("Failed to email contact: " + contact.getEmail() + " - " + e.getMessage());
                    e.printStackTrace();
                }
            }
            
            response.setNotificationMethod(notificationMethods.trim());
            contactResponses.add(response);
        }

        // Notify Emergency Contacts
        for (EmergencyContact contact : emergencyContacts) {
            SOSContactResponse response = new SOSContactResponse();
            response.setSosRequest(savedRequest);
            response.setContactName(contact.getName());
            response.setContactPhone(contact.getPhone());
            response.setContactEmail(contact.getEmail());
            response.setRelation(contact.getRelation());
            response.setUniqueToken(UUID.randomUUID().toString());
            response.setNotifiedAt(LocalDateTime.now());
            response.setResponseStatus(SOSContactResponse.ResponseStatus.PENDING);

            String notificationMethods = "";
            
            if (contact.getPhone() != null && !contact.getPhone().isEmpty()) {
                boolean smsSent = smsService.sendSOSSMS(
                    contact.getPhone(),
                    userName,
                    sosRequest.getGoogleMapsLink(),
                    response.getUniqueToken(),
                    response.getUniqueToken(),
                    baseUrl
                );
                response.setSMSDelivered(smsSent);
                response.setNotificationSent(smsSent);
                notificationMethods += "SMS ";
            }
            
            if (contact.getEmail() != null && !contact.getEmail().isEmpty()) {
                try {
                    String acceptLink = baseUrl + "/sos/respond?token=" + response.getUniqueToken() + "&action=accept";
                    String rejectLink = baseUrl + "/sos/respond?token=" + response.getUniqueToken() + "&action=reject";
                    
                    String emailBody = "🚨 EMERGENCY SOS ALERT 🚨\n\n"
                        + userName + " has triggered an emergency SOS!\n\n"
                        + "📍 Live Location: " + sosRequest.getGoogleMapsLink() + "\n\n"
                        + "📞 Contact: " + userPhone + "\n\n"
                        + "⏰ Time: " + LocalDateTime.now() + "\n\n"
                        + "═══════════════════════════════\n"
                        + "Please respond immediately:\n\n"
                        + "✅ ACCEPT HELP: " + acceptLink + "\n\n"
                        + "❌ DECLINE: " + rejectLink + "\n\n"
                        + "═══════════════════════════════\n\n"
                        + "This is an automated emergency alert from the Women Safety App.";
                    
                    emailService.sendEmail(
                        contact.getEmail(),
                        "🚨 EMERGENCY SOS - " + userName + " needs your help!",
                        emailBody
                    );
                    response.setEmailDelivered(true);
                    response.setNotificationSent(true);
                    notificationMethods += "Email ";
                } catch (Exception e) {
                    System.err.println("Failed to email emergency contact: " + contact.getEmail() + " - " + e.getMessage());
                    e.printStackTrace();
                }
            }
            
            response.setNotificationMethod(notificationMethods.trim());
            contactResponses.add(response);
        }

        // Save all contact responses
        sosContactResponseRepository.saveAll(contactResponses);
        savedRequest.setContactResponses(contactResponses);

        String autoCallPhone = trustedContacts.stream()
            .filter(TrustedContact::isPrimary)
            .filter(c -> c.isCanReceiveCall() && c.getPhone() != null)
            .map(TrustedContact::getPhone)
            .findFirst()
            .orElse(trustedContacts.stream()
                .filter(c -> c.isCanReceiveCall() && c.getPhone() != null)
                .map(TrustedContact::getPhone)
                .findFirst()
                .orElse(emergencyContacts.stream()
                    .filter(c -> c.getPhone() != null && !c.getPhone().isEmpty())
                    .map(EmergencyContact::getPhone)
                    .findFirst()
                    .orElse("100") // Fallback to police
                )
            );
        
        savedRequest.setAutoCallPhone(autoCallPhone);
        sosRequestRepository.save(savedRequest);

        // === WebSocket notification for real-time tracking ===
        Map<String, Object> wsPayload = new HashMap<>();
        wsPayload.put("type", "SOS_ACTIVATED");
        wsPayload.put("sosId", savedRequest.getId());
        wsPayload.put("contactsNotified", totalContacts);
        wsPayload.put("mapsLink", savedRequest.getGoogleMapsLink());
        wsPayload.put("autoCallPhone", autoCallPhone);
        messagingTemplate.convertAndSend("/topic/sos-updates/user-" + userId, wsPayload);

        // === Push real-time notification to Admin SOS Monitor ===
        Map<String, Object> adminPayload = new HashMap<>();
        adminPayload.put("type", "NEW_SOS_ALERT");
        adminPayload.put("id", "req_" + savedRequest.getId());
        adminPayload.put("userName", userName);
        adminPayload.put("userPhone", userPhone);
        adminPayload.put("lat", savedRequest.getLatitude());
        adminPayload.put("lng", savedRequest.getLongitude());
        adminPayload.put("status", savedRequest.getStatus().toString());
        adminPayload.put("time", savedRequest.getActivatedAt().toString());
        adminPayload.put("mapsLink", savedRequest.getGoogleMapsLink());
        messagingTemplate.convertAndSend("/topic/admin-sos", adminPayload);

        // === Build response ===
        Map<String, Object> response = new HashMap<>();
        response.put("sosId", savedRequest.getId());
        response.put("status", savedRequest.getStatus().toString());
        response.put("contactsNotified", totalContacts);
        response.put("autoCallPhone", autoCallPhone);
        response.put("mapsLink", savedRequest.getGoogleMapsLink());
        response.put("message", "SOS activated! " + totalContacts + " contacts notified.");

        System.out.println("🚨 SOS #" + savedRequest.getId() + " triggered by " + userName);
        System.out.println("📱 Contacts notified: " + totalContacts);
        System.out.println("📞 Auto-call: " + autoCallPhone);

        return response;
        } catch (Exception e) {
            System.err.println("❌ ERROR triggering SOS: " + e.getMessage());
            e.printStackTrace();
            
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to trigger SOS: " + e.getMessage());
            errorResponse.put("contactsNotified", 0);
            errorResponse.put("autoCallPhone", "100");
            return errorResponse;
        }
    }

    /**
     * Handle contact response (accept/reject)
     */
    public Map<String, Object> handleContactResponse(String token, String action, String responseMessage) {
        Optional<SOSContactResponse> responseOpt = sosContactResponseRepository.findByUniqueToken(token);
        
        if (responseOpt.isEmpty()) {
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", "Invalid or expired token");
            return error;
        }

        SOSContactResponse contactResponse = responseOpt.get();
        SOSRequest sosRequest = contactResponse.getSosRequest();

        // Check if SOS is still active
        if (sosRequest.getStatus() != SOSRequest.SOSStatus.ACTIVE) {
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", "This SOS request is no longer active");
            return error;
        }

        // Update contact response
        contactResponse.setResponseStatus(
            "accept".equals(action) ? 
            SOSContactResponse.ResponseStatus.ACCEPTED : 
            SOSContactResponse.ResponseStatus.REJECTED
        );
        contactResponse.setRespondedAt(LocalDateTime.now());
        contactResponse.setResponseMessage(responseMessage);
        sosContactResponseRepository.save(contactResponse);

        // Update SOS request counters
        updateSOSRequestCounters(sosRequest);

        // If accepted, notify user via WebSocket
        if ("accept".equals(action)) {
            Map<String, Object> wsPayload = new HashMap<>();
            wsPayload.put("type", "CONTACT_ACCEPTED");
            wsPayload.put("sosId", sosRequest.getId());
            wsPayload.put("contactName", contactResponse.getContactName());
            wsPayload.put("contactRelation", contactResponse.getRelation());
            wsPayload.put("message", responseMessage);
            messagingTemplate.convertAndSend("/topic/sos-updates/user-" + sosRequest.getUser().getId(), wsPayload);

            // If first acceptance, update SOS status
            if (sosRequest.getContactsAccepted() == 1) {
                sosRequest.setStatus(SOSRequest.SOSStatus.ACCEPTED);
                sosRequestRepository.save(sosRequest);
            }
        }

        Map<String, Object> result = new HashMap<>();
        result.put("success", true);
        result.put("message", "Thank you for your response");
        result.put("contactName", contactResponse.getContactName());
        result.put("action", action);
        
        return result;
    }

    /**
     * Get real-time SOS status for user dashboard
     */
    public Map<String, Object> getSOSStatus(Long sosId) {
        Optional<SOSRequest> sosOpt = sosRequestRepository.findById(sosId);
        
        if (sosOpt.isEmpty()) {
            Map<String, Object> error = new HashMap<>();
            error.put("error", "SOS not found");
            return error;
        }

        SOSRequest sos = sosOpt.get();
        Map<String, Object> status = new HashMap<>();
        status.put("sosId", sos.getId());
        status.put("status", sos.getStatus().toString());
        status.put("activatedAt", sos.getActivatedAt().toString());
        status.put("latitude", sos.getLatitude());
        status.put("longitude", sos.getLongitude());
        status.put("mapsLink", sos.getGoogleMapsLink());
        status.put("totalContacts", sos.getTotalContactsNotified());
        status.put("contactsAccepted", sos.getContactsAccepted());
        status.put("contactsRejected", sos.getContactsRejected());
        status.put("contactsPending", sos.getContactsPending());
        status.put("isEscalated", sos.isEscalated());
        status.put("autoCallPhone", sos.getAutoCallPhone());

        // Add contact responses
        List<Map<String, Object>> contacts = new ArrayList<>();
        for (SOSContactResponse response : sos.getContactResponses()) {
            Map<String, Object> contact = new HashMap<>();
            contact.put("name", response.getContactName());
            contact.put("relation", response.getRelation());
            contact.put("phone", response.getContactPhone());
            contact.put("status", response.getResponseStatus().toString());
            contact.put("notifiedAt", response.getNotifiedAt() != null ? response.getNotifiedAt().toString() : null);
            contact.put("respondedAt", response.getRespondedAt() != null ? response.getRespondedAt().toString() : null);
            contact.put("message", response.getResponseMessage());
            contacts.add(contact);
        }
        status.put("contacts", contacts);

        return status;
    }

    /**
     * Cancel SOS request
     */
    public boolean cancelSOS(Long sosId, Long userId) {
        Optional<SOSRequest> sosOpt = sosRequestRepository.findById(sosId);
        
        if (sosOpt.isPresent()) {
            SOSRequest sos = sosOpt.get();
            
            // Verify ownership
            if (!sos.getUser().getId().equals(userId)) {
                return false;
            }
            
            if (sos.getStatus() == SOSRequest.SOSStatus.ACTIVE) {
                sos.setStatus(SOSRequest.SOSStatus.CANCELLED);
                sosRequestRepository.save(sos);

                // Notify contacts via WebSocket
                Map<String, Object> wsPayload = new HashMap<>();
                wsPayload.put("type", "SOS_CANCELLED");
                wsPayload.put("sosId", sosId);
                messagingTemplate.convertAndSend("/topic/sos-updates/user-" + userId, wsPayload);

                System.out.println("✅ SOS #" + sosId + " cancelled by user");
                return true;
            }
        }
        return false;
    }

    /**
     * Update SOS request counters based on contact responses
     */
    private void updateSOSRequestCounters(SOSRequest sosRequest) {
        long accepted = sosContactResponseRepository.countBySosRequestIdAndResponseStatus(
            sosRequest.getId(), SOSContactResponse.ResponseStatus.ACCEPTED);
        long rejected = sosContactResponseRepository.countBySosRequestIdAndResponseStatus(
            sosRequest.getId(), SOSContactResponse.ResponseStatus.REJECTED);
        long pending = sosContactResponseRepository.countBySosRequestIdAndResponseStatus(
            sosRequest.getId(), SOSContactResponse.ResponseStatus.PENDING);

        sosRequest.setContactsAccepted((int) accepted);
        sosRequest.setContactsRejected((int) rejected);
        sosRequest.setContactsPending((int) pending);
        
        sosRequestRepository.save(sosRequest);
    }

    /**
     * Get user's SOS history
     */
    public List<Map<String, Object>> getUserSOSHistory(Long userId) {
        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isEmpty()) {
            return new ArrayList<>();
        }

        List<SOSRequest> requests = sosRequestRepository.findByUserOrderByActivatedAtDesc(userOpt.get());
        List<Map<String, Object>> history = new ArrayList<>();

        for (SOSRequest request : requests) {
            Map<String, Object> item = new HashMap<>();
            item.put("sosId", request.getId());
            item.put("status", request.getStatus().toString());
            item.put("activatedAt", request.getActivatedAt().toString());
            item.put("contactsNotified", request.getTotalContactsNotified());
            item.put("contactsAccepted", request.getContactsAccepted());
            item.put("mapsLink", request.getGoogleMapsLink());
            history.add(item);
        }

        return history;
    }
}
