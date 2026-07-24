package in.sp.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/** Informational loan guides only — this app does not process loan applications. */
@Controller
@RequestMapping("/loan")
public class LoanController {

    @GetMapping
    public String loanHome(Model model) {
        model.addAttribute("infoOnly", true);
        return "loan/loan-home";
    }

    @GetMapping("/details/{loanId}")
    public String loanDetails(@PathVariable String loanId, Model model) {
        model.addAttribute("loanId", loanId);
        model.addAttribute("infoOnly", true);
        return "loan/loan-details";
    }

    @GetMapping("/application")
    public String loanApplication(Model model) {
        model.addAttribute("infoOnly", true);
        return "loan/loan-application";
    }
}
