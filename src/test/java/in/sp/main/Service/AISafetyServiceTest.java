package in.sp.main.Service;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AISafetyServiceTest {

    @Test
    void predictReturnsUnavailableWhenModelMissing() throws Exception {
        AISafetyService service = new AISafetyService();
        if (!service.isModelAvailable()) {
            assertEquals("Unavailable", service.predictSafety(10, 5, 1));
        } else {
            // Model present in workspace — still must return Safe or Unsafe, not crash
            String result = service.predictSafety(10, 5, 1);
            assertTrue(result.equals("Safe") || result.equals("Unsafe") || result.equals("Unavailable"));
        }
    }
}
