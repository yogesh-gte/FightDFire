package in.sp.main.Config;

import in.sp.main.Entities.User;
import jakarta.servlet.http.HttpSession;

/**
 * Shared session ownership checks for IDOR hardening.
 */
public final class SessionAuthHelper {

    private SessionAuthHelper() {}

    public static User requireUser(HttpSession session) {
        if (session == null) return null;
        Object u = session.getAttribute("user");
        return (u instanceof User) ? (User) u : null;
    }

    public static boolean isOwner(HttpSession session, Long userId) {
        User user = requireUser(session);
        return user != null && userId != null && user.getId().equals(userId);
    }

    /** True if session has an admin attribute. */
    public static boolean isAdmin(HttpSession session) {
        return session != null && session.getAttribute("admin") != null;
    }
}
