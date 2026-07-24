package in.sp.main.exception;

/**
 * Shared model keys + helpers for error.jsp and JSON error responses.
 */
public final class ErrorModel {

    public static final String STATUS = "status";
    public static final String ERROR_CODE = "errorCode";
    public static final String TITLE = "title";
    public static final String MESSAGE = "message";
    public static final String EXCEPTION_TYPE = "exceptionType";
    public static final String EXCEPTION_MESSAGE = "exceptionMessage";
    public static final String PATH = "path";
    public static final String TIMESTAMP = "timestamp";
    public static final String SHOW_DETAILS = "showDetails";
    public static final String CAUSE_CHAIN = "causeChain";

    private ErrorModel() {}

    public static String titleForStatus(int status) {
        return switch (status) {
            case 400 -> "Bad request";
            case 401 -> "Sign in required";
            case 403 -> "Access denied";
            case 404 -> "Page not found";
            case 405 -> "Method not allowed";
            case 409 -> "Conflict";
            case 413 -> "Request too large";
            case 429 -> "Too many requests";
            case 503 -> "Service unavailable";
            default -> status >= 500 ? "Something went wrong" : "Request could not be completed";
        };
    }

    public static String friendlyForStatus(int status) {
        return switch (status) {
            case 400 -> "The request was invalid. Please check your input and try again.";
            case 401 -> "Please sign in to continue.";
            case 403 -> "You do not have permission to view this page.";
            case 404 -> "We could not find the page or resource you asked for.";
            case 405 -> "That action is not supported for this URL.";
            case 413 -> "The upload or request body is too large.";
            case 503 -> "A required service is temporarily unavailable. Please try again shortly.";
            default -> status >= 500
                    ? "An unexpected error occurred. Your session is safe — please try again or return home."
                    : "We could not complete that request.";
        };
    }
}
