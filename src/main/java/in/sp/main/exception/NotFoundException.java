package in.sp.main.exception;

public class NotFoundException extends AppException {
    public NotFoundException(String userMessage) {
        super(userMessage, "NOT_FOUND", 404);
    }
}
