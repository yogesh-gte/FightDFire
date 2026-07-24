package in.sp.main.Controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import in.sp.main.Entities.PanicLog;
import in.sp.main.Entities.User;
import in.sp.main.Repository.PanicLogRepository;
import in.sp.main.Service.SosService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/panic")
public class PanicController {

    @Autowired
    private PanicLogRepository panicLogRepository;

    @Autowired
    private SosService sosService;

    @RequestMapping(method = RequestMethod.GET)
    public String showPanicPage(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login?redirect=/panic";
        }
        return "panic";
    }

    @RequestMapping(value = "/timer", method = RequestMethod.GET)
    public String showPanicTimer(@RequestParam(value = "time", required = false, defaultValue = "10") int time,
                                 HttpSession session,
                                 Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login?redirect=/panic/timer";
        }
        model.addAttribute("time", time);
        return "panic-timer";
    }

    /**
     * Panic button → full SosService trigger (SMS/email/volunteers) + PanicLog for admin history.
     */
    @RequestMapping(value = "/activate", method = RequestMethod.POST)
    public String activatePanicButton(@RequestParam("latitude") double latitude,
                                      @RequestParam("longitude") double longitude,
                                      HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            model.addAttribute("error", "User not logged in!");
            return "redirect:/login?redirect=/panic";
        }

        Map<String, Object> sosResult = sosService.triggerSOS(user.getId(), latitude, longitude);
        savePanicLog(user.getId(), latitude, longitude, sosResult);

        model.addAttribute("message",
                "Panic alert sent! " + sosResult.getOrDefault("message", "Contacts and volunteers notified."));
        model.addAttribute("sosId", sosResult.get("sosId"));
        model.addAttribute("autoCallPhone", sosResult.get("autoCallPhone"));
        return "panic-button";
    }

    @RequestMapping(value = "/send-location", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> sendLocation(
            @RequestParam("latitude") double latitude,
            @RequestParam("longitude") double longitude,
            HttpSession session) {

        Map<String, Object> response = new HashMap<>();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.put("success", false);
            response.put("message", "User not logged in!");
            return ResponseEntity.status(401).body(response);
        }

        Map<String, Object> sosResult = sosService.triggerSOS(user.getId(), latitude, longitude);
        savePanicLog(user.getId(), latitude, longitude, sosResult);

        if (sosResult.containsKey("error")) {
            response.put("success", false);
            response.put("message", sosResult.get("error"));
            return ResponseEntity.status(500).body(response);
        }

        response.put("success", true);
        response.put("message", sosResult.get("message"));
        response.put("sosId", sosResult.get("sosId"));
        response.put("contactsNotified", sosResult.get("contactsNotified"));
        response.put("volunteersAlerted", sosResult.get("volunteersAlerted"));
        response.put("autoCallPhone", sosResult.get("autoCallPhone"));
        response.put("smsEnabled", sosResult.get("smsEnabled"));
        return ResponseEntity.ok(response);
    }

    private void savePanicLog(Long userId, double latitude, double longitude, Map<String, Object> sosResult) {
        PanicLog panicLog = new PanicLog();
        panicLog.setUserId(userId);
        panicLog.setTimestamp(LocalDateTime.now());
        panicLog.setLocation(latitude + ", " + longitude);
        Object notified = sosResult.get("contactsNotified");
        panicLog.setNotifiedContacts(notified != null ? "sosId=" + sosResult.get("sosId") + "; contacts=" + notified : "sos");
        panicLogRepository.save(panicLog);
    }
}
