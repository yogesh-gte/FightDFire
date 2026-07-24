package in.sp.main.Config;

import in.sp.main.Entities.User;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpSession;

import static org.junit.jupiter.api.Assertions.*;

class SessionAuthHelperTest {

    @Test
    void requireUserReturnsNullWhenMissing() {
        assertNull(SessionAuthHelper.requireUser(new MockHttpSession()));
        assertNull(SessionAuthHelper.requireUser(null));
    }

    @Test
    void isOwnerMatchesSessionUserId() {
        MockHttpSession session = new MockHttpSession();
        User user = new User();
        user.setId(42L);
        session.setAttribute("user", user);

        assertTrue(SessionAuthHelper.isOwner(session, 42L));
        assertFalse(SessionAuthHelper.isOwner(session, 99L));
        assertFalse(SessionAuthHelper.isOwner(session, null));
    }

    @Test
    void isAdminDetectsAdminSession() {
        MockHttpSession session = new MockHttpSession();
        assertFalse(SessionAuthHelper.isAdmin(session));
        session.setAttribute("admin", new Object());
        assertTrue(SessionAuthHelper.isAdmin(session));
    }
}
