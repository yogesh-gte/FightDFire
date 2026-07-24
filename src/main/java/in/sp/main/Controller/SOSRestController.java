package in.sp.main.Controller;

import in.sp.main.Entities.User;
import in.sp.main.Service.SosService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * REST SOS trigger — delegates to the same SosService path as /sos/trigger.
 * Requires a logged-in session user (no guest / body userId spoofing).
 */
@RestController
@RequestMapping("/api/sos")
public class SOSRestController {

    @Autowired
    private SosService sosService;

    @PostMapping("/trigger")
    public ResponseEntity<Map<String, Object>> triggerSOS(@RequestBody Map<String, String> payload,
                                                          HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            Map<String, Object> err = new HashMap<>();
            err.put("success", false);
            err.put("error", "Login required to trigger SOS.");
            return ResponseEntity.status(401).body(err);
        }

        try {
            double lat = Double.parseDouble(payload.get("latitude"));
            double lng = Double.parseDouble(payload.get("longitude"));
            Map<String, Object> result = new HashMap<>(sosService.triggerSOS(user.getId(), lat, lng));
            if (result.containsKey("error")) {
                result.put("success", false);
                return ResponseEntity.status(500).body(result);
            }
            result.put("success", true);
            return ResponseEntity.ok(result);
        } catch (NumberFormatException | NullPointerException e) {
            Map<String, Object> err = new HashMap<>();
            err.put("success", false);
            err.put("error", "latitude and longitude are required.");
            return ResponseEntity.badRequest().body(err);
        }
    }
}
