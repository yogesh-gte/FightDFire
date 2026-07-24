package in.sp.main.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import in.sp.main.Service.PasswordResetService;
import in.sp.main.exception.AppException;
import in.sp.main.exception.ValidationException;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private PasswordResetService passwordResetService;

    @RequestMapping(value = "/forgot-password", method = GET)
    public String showForgotPasswordPage() {
        return "forgotPassword";
    }

    @RequestMapping(value = "/forgot-password", method = POST)
    public String forgotPassword(@RequestParam(value = "email", required = false) String email, Model model) {
        try {
            if (email == null || email.isBlank()) {
                throw new ValidationException("Email is required to reset your password.");
            }
            String response = passwordResetService.createPasswordResetToken(email.trim());
            model.addAttribute("message", response);
            return "forgotPassword";
        } catch (AppException e) {
            throw e;
        } catch (Exception e) {
            throw new AppException("Could not start password reset. Please try again later.",
                    "AUTH_FORGOT_PASSWORD", 500, e);
        }
    }

    @RequestMapping(value = "/reset-password", method = GET)
    public String showResetPasswordPage(@RequestParam(value = "token", required = false) String token,
                                        @RequestParam(value = "type", required = false) String type,
                                        Model model) {
        try {
            if (token == null || token.isBlank()) {
                throw new ValidationException("Reset token is missing or invalid.");
            }
            model.addAttribute("token", token);
            model.addAttribute("userType", type != null ? type : "USER");
            return "resetPassword";
        } catch (AppException e) {
            throw e;
        } catch (Exception e) {
            throw new AppException("Could not open the password reset page.",
                    "AUTH_RESET_PAGE", 500, e);
        }
    }

    @RequestMapping(value = "/reset-password", method = POST)
    public String resetPassword(@RequestParam(value = "token", required = false) String token,
                                @RequestParam(value = "newPassword", required = false) String newPassword,
                                Model model) {
        try {
            if (token == null || token.isBlank()) {
                throw new ValidationException("Reset token is missing.");
            }
            if (newPassword == null || newPassword.isBlank()) {
                throw new ValidationException("New password is required.");
            }
            String response = passwordResetService.resetPassword(token, newPassword);
            model.addAttribute("message", response);
            return "login";
        } catch (AppException e) {
            throw e;
        } catch (Exception e) {
            throw new AppException("Could not reset your password. Please request a new link.",
                    "AUTH_RESET_FAILED", 500, e);
        }
    }
}
