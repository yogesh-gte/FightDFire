package in.sp.main.exception;

/**
 * Base application exception — always safe to surface to error.jsp.
 * Prefer subclasses for HTTP semantics.
 */
public class AppException extends RuntimeException {

    private final int status;
    private final String errorCode;
    private final String userMessage;

    public AppException(String userMessage) {
        this(userMessage, "APP_ERROR", 500, null);
    }

    public AppException(String userMessage, Throwable cause) {
        this(userMessage, "APP_ERROR", 500, cause);
    }

    public AppException(String userMessage, String errorCode, int status) {
        this(userMessage, errorCode, status, null);
    }

    public AppException(String userMessage, String errorCode, int status, Throwable cause) {
        super(userMessage, cause);
        this.userMessage = userMessage != null ? userMessage : "Something went wrong.";
        this.errorCode = errorCode != null ? errorCode : "APP_ERROR";
        this.status = status > 0 ? status : 500;
    }

    public int getStatus() {
        return status;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getUserMessage() {
        return userMessage;
    }
}
