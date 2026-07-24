package in.sp.main.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.CrimeData;
import in.sp.main.Repository.CrimeDataRepository;
import in.sp.main.Service.AISafetyService;

@Controller
@RequestMapping("/safety")
public class SafetyCheckController {

    @Autowired
    private CrimeDataRepository crimeDataRepository;

    @Autowired
    private AISafetyService aiSafetyService;

    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public String checkSafety(@RequestParam double latitude, @RequestParam double longitude, Model model) {
        // Fetch crime data for the nearest location
        Optional<CrimeData> crimeData = crimeDataRepository.findNearestLocation(latitude, longitude);

        if (crimeData.isPresent()) {
            try {
                if (!aiSafetyService.isModelAvailable()) {
                    model.addAttribute("safety_status", "Unavailable");
                    model.addAttribute("safety_message",
                            "AI safety model is not configured on this server. Add crime_data.arff / safety_model.model to enable predictions.");
                } else {
                    String safetyStatus = aiSafetyService.predictSafety(
                        crimeData.get().getCrimeCount(),
                        crimeData.get().getNightTimeCrime(),
                        crimeData.get().getPoliceStations()
                    );
                    model.addAttribute("safety_status", safetyStatus);
                }
                model.addAttribute("latitude", latitude);
                model.addAttribute("longitude", longitude);
            } catch (Exception e) {
                model.addAttribute("safety_status", "Unavailable");
                model.addAttribute("safety_message", "AI prediction failed: " + e.getMessage());
            }
        } else {
            model.addAttribute("safety_status", "Crime Data Not Found");
        }

        return "safetyCheck";
    }
}
