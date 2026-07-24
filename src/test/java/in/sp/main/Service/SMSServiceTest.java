package in.sp.main.Service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.*;

class SMSServiceTest {

    private SMSService smsService;

    @BeforeEach
    void setUp() {
        smsService = new SMSService();
        ReflectionTestUtils.setField(smsService, "smsEnabled", false);
        ReflectionTestUtils.setField(smsService, "smsProvider", "twilio");
    }

    @Test
    void disabledSmsReturnsFalseWithoutSending() {
        assertFalse(smsService.isEnabled());
        assertFalse(smsService.sendSMS("+919999999999", "test"));
    }

    @Test
    void blankPhoneReturnsFalseEvenWhenEnabled() {
        ReflectionTestUtils.setField(smsService, "smsEnabled", true);
        assertFalse(smsService.sendSMS("  ", "hello"));
        assertFalse(smsService.sendSMS(null, "hello"));
    }
}
