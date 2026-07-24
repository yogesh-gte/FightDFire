package in.sp.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/** Informational scheme guides only — this app does not process funding applications. */
@Controller
@RequestMapping("/funding")
public class FundingController {

    @GetMapping
    public String fundingHome(Model model) {
        model.addAttribute("infoOnly", true);
        return "funding/funding-home";
    }

    @GetMapping("/details/{schemeId}")
    public String fundingDetails(@PathVariable String schemeId, Model model) {
        model.addAttribute("schemeId", schemeId);
        model.addAttribute("infoOnly", true);
        return "funding/funding-details";
    }

    @GetMapping("/application")
    public String fundingApplication(Model model) {
        model.addAttribute("infoOnly", true);
        return "funding/funding-application";
    }
}
