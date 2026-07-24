package in.sp.main.Config;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * Single place for password hashing and verification across all actor types.
 * New passwords are always BCrypt. Legacy plaintext still verifies once, then
 * callers should persist {@link #encode(String)} to upgrade the stored hash.
 */
@Component
public class PasswordAuthHelper {

    private final PasswordEncoder passwordEncoder;

    public PasswordAuthHelper(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public String encode(String rawPassword) {
        if (rawPassword == null) {
            throw new IllegalArgumentException("Password required");
        }
        return passwordEncoder.encode(rawPassword);
    }

    /** Encode only if value is not already a BCrypt hash (safe for profile updates). */
    public String encodeIfPlain(String password) {
        if (password == null || password.isBlank()) {
            return password;
        }
        if (isBcrypt(password)) {
            return password;
        }
        return passwordEncoder.encode(password);
    }

    public boolean matches(String rawPassword, String storedPassword) {
        if (rawPassword == null || storedPassword == null || storedPassword.isBlank()) {
            return false;
        }
        if (isBcrypt(storedPassword)) {
            return passwordEncoder.matches(rawPassword, storedPassword);
        }
        // Legacy plaintext — accept once so we can upgrade on login.
        return storedPassword.equals(rawPassword);
    }

    public boolean needsUpgrade(String storedPassword) {
        return storedPassword != null && !storedPassword.isBlank() && !isBcrypt(storedPassword);
    }

    public static boolean isBcrypt(String value) {
        return value != null
                && (value.startsWith("$2a$") || value.startsWith("$2b$") || value.startsWith("$2y$"));
    }
}
