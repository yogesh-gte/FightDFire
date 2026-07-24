package in.sp.main.exception;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AppExceptionTest {

    @Test
    void appExceptionCarriesCodeAndStatus() {
        AppException ex = new AppException("Nope", "AUTH_LOGIN_FAILED", 500);
        assertEquals(500, ex.getStatus());
        assertEquals("AUTH_LOGIN_FAILED", ex.getErrorCode());
        assertEquals("Nope", ex.getUserMessage());
    }

    @Test
    void subclassesUseExpectedStatus() {
        assertEquals(401, new UnauthorizedException("login").getStatus());
        assertEquals(403, new ForbiddenException("denied").getStatus());
        assertEquals(404, new NotFoundException("missing").getStatus());
        assertEquals(400, new ValidationException("bad").getStatus());
    }

    @Test
    void titleHelperCoversCommonCodes() {
        assertEquals("Page not found", ErrorModel.titleForStatus(404));
        assertEquals("Something went wrong", ErrorModel.titleForStatus(500));
    }
}
