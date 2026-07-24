package in.sp.main.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.User;
import in.sp.main.Entities.VerificationStatus;
import in.sp.main.Service.UserService;
import in.sp.main.exception.AppException;
import jakarta.servlet.http.HttpSession;
import in.sp.main.Config.PasswordAuthHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/login")
public class LoginController {
    private static final Logger log = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordAuthHelper passwordAuth;

    @Autowired
    private in.sp.main.Config.JwtUtil jwtUtil;

    @GetMapping
    public String showLoginPage(@RequestParam(value = "redirect", required = false) String redirect,
                                HttpSession session) {
        try {
            if (redirect != null && !redirect.isEmpty()) {
                session.setAttribute("redirectAfterLogin", redirect);
            }
            return "login";
        } catch (Exception e) {
            throw new AppException("Could not open the login page.", "AUTH_LOGIN_PAGE", 500, e);
        }
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String homePage() {
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String homePage1() {
        return "indexDemo";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String login(@RequestParam(value = "email", required = false) String email,
                        @RequestParam(value = "password", required = false) String password,
                        Model model,
                        HttpSession session,
                        jakarta.servlet.http.HttpServletResponse response) {
        try {
            String normEmail = (email == null) ? "" : email.trim().toLowerCase();
            String rawPassword = (password == null) ? "" : password;

            if (normEmail.isEmpty() || rawPassword.isEmpty()) {
                model.addAttribute("error", "Email and password are required.");
                return "login";
            }

            User user = userService.findByUsername(normEmail);

            boolean ok = false;
            if (user != null && user.getPassword() != null) {
                ok = passwordAuth.matches(rawPassword, user.getPassword());
            }

            if (!ok) {
                if (user == null) {
                    log.warn("Login failed: user not found for email={}", normEmail);
                } else {
                    String stored = user.getPassword();
                    String prefix = (stored == null) ? "null" : stored.substring(0, Math.min(7, stored.length()));
                    log.warn("Login failed: password mismatch for email={} storedPrefix={}", normEmail, prefix);
                }
                model.addAttribute("error", "Invalid credentials. Please try again.");
                return "login";
            }

            if (passwordAuth.needsUpgrade(user.getPassword())) {
                user.setPassword(passwordAuth.encode(rawPassword));
                userService.createUser(user);
            }

            VerificationStatus status = user.getVerificationStatus();
            if (status == null || status == VerificationStatus.PENDING) {
                model.addAttribute("error", "Your account is pending verification by Admin. Please check back later.");
                return "login";
            }
            if (status == VerificationStatus.REJECTED) {
                model.addAttribute("error", "Your account has been rejected by admin.");
                return "login";
            }
            if (user.isBanned()) {
                model.addAttribute("error", "Your account has been banned due to policy violations.");
                return "login";
            }

            session.setAttribute("user", user);

            String token = jwtUtil.generateToken(user.getEmail(), "USER");
            jakarta.servlet.http.Cookie cookie = new jakarta.servlet.http.Cookie("JWT_TOKEN", token);
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            cookie.setMaxAge(365 * 24 * 60 * 60);
            response.addCookie(cookie);

            String redirect = (String) session.getAttribute("redirectAfterLogin");
            if (redirect != null && !redirect.isBlank()) {
                session.removeAttribute("redirectAfterLogin");
                if (redirect.startsWith("/")) {
                    return "redirect:" + redirect;
                }
                return "redirect:/" + redirect;
            }
            return "redirect:/users/dashboard";
        } catch (AppException e) {
            throw e;
        } catch (Exception e) {
            throw new AppException("Sign-in failed due to a server error. Please try again.",
                    "AUTH_LOGIN_FAILED", 500, e);
        }
    }
}
