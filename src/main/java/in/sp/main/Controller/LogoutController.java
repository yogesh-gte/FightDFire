package in.sp.main.Controller;

import in.sp.main.exception.AppException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/logout")
public class LogoutController {

    @RequestMapping(method = RequestMethod.GET)
    public String logout(HttpSession session, jakarta.servlet.http.HttpServletResponse response) {
        try {
            if (session != null) {
                session.invalidate();
            }

            jakarta.servlet.http.Cookie cookie = new jakarta.servlet.http.Cookie("JWT_TOKEN", null);
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            cookie.setMaxAge(0);
            response.addCookie(cookie);

            return "redirect:/login?logout=true";
        } catch (IllegalStateException alreadyInvalid) {
            // Session already invalidated — still clear cookie and continue
            try {
                jakarta.servlet.http.Cookie cookie = new jakarta.servlet.http.Cookie("JWT_TOKEN", null);
                cookie.setPath("/");
                cookie.setHttpOnly(true);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            } catch (Exception ignored) {
                // fall through
            }
            return "redirect:/login?logout=true";
        } catch (Exception e) {
            throw new AppException("Logout failed. Please close the browser tab and sign in again.",
                    "AUTH_LOGOUT_FAILED", 500, e);
        }
    }
}
