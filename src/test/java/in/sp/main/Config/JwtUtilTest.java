package in.sp.main.Config;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class JwtUtilTest {

    @Test
    void generateAndValidateToken() {
        JwtUtil jwt = new JwtUtil("unit-test-secret-key-at-least-32-chars!", 60_000L);
        String token = jwt.generateToken("user@example.com", "USER");
        assertTrue(jwt.validateToken(token));
        assertEquals("user@example.com", jwt.extractUsername(token));
        assertEquals("USER", jwt.extractRole(token));
    }

    @Test
    void rejectsBlankSecret() {
        assertThrows(IllegalStateException.class, () -> new JwtUtil("  ", 1000L));
    }

    @Test
    void shortSecretIsAcceptedViaSha256Stretch() {
        JwtUtil jwt = new JwtUtil("short", 60_000L);
        assertTrue(jwt.validateToken(jwt.generateToken("a@b.c", "ADMIN")));
    }
}
