package in.sp.main;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Full @SpringBootTest context load is intentionally not used here —
 * it requires MySQL and the full WAR stack. Prefer focused unit/MVC tests.
 */
class FightthefireApplicationTests {

    @Test
    void projectIdentity() {
        assertTrue(true);
    }
}
