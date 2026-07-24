package in.sp.main.Config;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

class PasswordAuthHelperTest {

    private PasswordAuthHelper helper;

    @BeforeEach
    void setUp() {
        helper = new PasswordAuthHelper(new BCryptPasswordEncoder());
    }

    @Test
    void encodeProducesBcryptHash() {
        String hash = helper.encode("Secret1!");
        assertTrue(PasswordAuthHelper.isBcrypt(hash));
        assertNotEquals("Secret1!", hash);
    }

    @Test
    void matchesBcryptPassword() {
        String hash = helper.encode("Secret1!");
        assertTrue(helper.matches("Secret1!", hash));
        assertFalse(helper.matches("wrong", hash));
    }

    @Test
    void matchesLegacyPlaintextAndNeedsUpgrade() {
        assertTrue(helper.matches("oldplain", "oldplain"));
        assertTrue(helper.needsUpgrade("oldplain"));
        assertFalse(helper.needsUpgrade(helper.encode("oldplain")));
    }

    @Test
    void encodeIfPlainSkipsAlreadyHashed() {
        String hash = helper.encode("Secret1!");
        assertEquals(hash, helper.encodeIfPlain(hash));
    }
}
