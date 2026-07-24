package in.sp.main.exception;

public class UnauthorizedException extends AppException {
    public UnauthorizedException(String userMessage) {
        super(userMessage, "UNAUTHORIZED", 401);
    }
}
