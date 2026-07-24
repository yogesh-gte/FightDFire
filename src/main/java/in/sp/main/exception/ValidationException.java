package in.sp.main.exception;

public class ValidationException extends AppException {
    public ValidationException(String userMessage) {
        super(userMessage, "VALIDATION_ERROR", 400);
    }
}
