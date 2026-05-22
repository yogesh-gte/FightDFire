package in.sp.main.Controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import in.sp.main.Entities.User;
import in.sp.main.Service.SosService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/sos")
public class SosActivationController {

    @Autowired
    private SosService sosService;

    /**
     * Serve the SOS Dashboard page
     */
    @GetMapping("/dashboard")
    public String showSosDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("userId", user.getId());
        model.addAttribute("user", user);
        return "sos-dashboard";
    }

    /**
     * REST API: Trigger SOS emergency
     * Called by frontend after countdown expires
     */
    @PostMapping("/trigger")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> triggerSos(
            @RequestParam("latitude") double latitude,
            @RequestParam("longitude") double longitude,
            HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            Map<String, Object> error = new HashMap<>();
            error.put("error", "User not logged in");
            return ResponseEntity.status(401).body(error);
        }

        Map<String, Object> result = sosService.triggerSOS(user.getId(), latitude, longitude);
        return ResponseEntity.ok(result);
    }
}
