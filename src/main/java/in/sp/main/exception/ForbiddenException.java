package in.sp.main.exception;

public class ForbiddenException extends AppException {
    public ForbiddenException(String userMessage) {
        super(userMessage, "FORBIDDEN", 403);
    }
}
