package in.sp.main.Controller;

import in.sp.main.exception.AppException;
import in.sp.main.exception.ErrorModel;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.time.Instant;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Catches controller exceptions and routes browser requests to error.jsp
 * (API / XHR get JSON). Nothing should bubble as an unhandled crash page.
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @Value("${app.error.show-details:true}")
    private boolean showDetails;

    @ExceptionHandler(AppException.class)
    public Object handleAppException(AppException ex, HttpServletRequest request) {
        log.warn("AppException [{}] {}: {}", ex.getErrorCode(), request.getRequestURI(), ex.getUserMessage());
        return buildResponse(request, ex.getStatus(), ex.getErrorCode(),
                ErrorModel.titleForStatus(ex.getStatus()), ex.getUserMessage(), ex);
    }

    @ExceptionHandler({
            NoHandlerFoundException.class,
            NoResourceFoundException.class
    })
    public Object handleNotFound(Exception ex, HttpServletRequest request) {
        return buildResponse(request, 404, "NOT_FOUND",
                ErrorModel.titleForStatus(404), ErrorModel.friendlyForStatus(404), ex);
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public Object handleMethodNotAllowed(HttpRequestMethodNotSupportedException ex, HttpServletRequest request) {
        return buildResponse(request, 405, "METHOD_NOT_ALLOWED",
                ErrorModel.titleForStatus(405), ErrorModel.friendlyForStatus(405), ex);
    }

    @ExceptionHandler({
            MissingServletRequestParameterException.class,
            MethodArgumentTypeMismatchException.class,
            MethodArgumentNotValidException.class,
            BindException.class,
            IllegalArgumentException.class
    })
    public Object handleBadRequest(Exception ex, HttpServletRequest request) {
        String msg = ex.getMessage() != null ? ex.getMessage() : ErrorModel.friendlyForStatus(400);
        return buildResponse(request, 400, "VALIDATION_ERROR",
                ErrorModel.titleForStatus(400), msg, ex);
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public Object handleTooLarge(MaxUploadSizeExceededException ex, HttpServletRequest request) {
        return buildResponse(request, 413, "PAYLOAD_TOO_LARGE",
                ErrorModel.titleForStatus(413), ErrorModel.friendlyForStatus(413), ex);
    }

    @ExceptionHandler(Exception.class)
    public Object handleAny(Exception ex, HttpServletRequest request) {
        ResponseStatus rs = AnnotationUtils.findAnnotation(ex.getClass(), ResponseStatus.class);
        int status = rs != null ? rs.value().value() : 500;
        String code = status >= 500 ? "INTERNAL_ERROR" : "REQUEST_ERROR";
        String message = status >= 500
                ? ErrorModel.friendlyForStatus(500)
                : (ex.getMessage() != null ? ex.getMessage() : ErrorModel.friendlyForStatus(status));

        if (status >= 500) {
            log.error("Unhandled exception on {}: {}", request.getRequestURI(), ex.toString(), ex);
        } else {
            log.warn("Request error on {}: {}", request.getRequestURI(), ex.toString());
        }
        return buildResponse(request, status, code, ErrorModel.titleForStatus(status), message, ex);
    }

    private Object buildResponse(HttpServletRequest request, int status, String errorCode,
                                 String title, String message, Throwable ex) {
        Map<String, Object> body = toModelMap(request, status, errorCode, title, message, ex);
        if (wantsJson(request)) {
            return ResponseEntity.status(status).contentType(MediaType.APPLICATION_JSON).body(body);
        }
        ModelAndView mav = new ModelAndView("error");
        HttpStatus httpStatus = HttpStatus.resolve(status);
        mav.setStatus(httpStatus != null ? httpStatus : HttpStatus.INTERNAL_SERVER_ERROR);
        body.forEach(mav::addObject);
        return mav;
    }

    static Map<String, Object> toModelMap(HttpServletRequest request, int status, String errorCode,
                                          String title, String message, Throwable ex,
                                          boolean showDetails) {
        Map<String, Object> map = new LinkedHashMap<>();
        map.put(ErrorModel.STATUS, status);
        map.put(ErrorModel.ERROR_CODE, errorCode);
        map.put(ErrorModel.TITLE, title);
        map.put(ErrorModel.MESSAGE, message);
        map.put(ErrorModel.PATH, request != null ? request.getRequestURI() : null);
        map.put(ErrorModel.TIMESTAMP, Instant.now().toString());
        map.put(ErrorModel.SHOW_DETAILS, showDetails);

        if (ex != null) {
            map.put(ErrorModel.EXCEPTION_TYPE, ex.getClass().getName());
            map.put(ErrorModel.EXCEPTION_MESSAGE, ex.getMessage());
            if (showDetails) {
                map.put(ErrorModel.CAUSE_CHAIN, causeChain(ex));
            }
        }
        return map;
    }

    private Map<String, Object> toModelMap(HttpServletRequest request, int status, String errorCode,
                                           String title, String message, Throwable ex) {
        return toModelMap(request, status, errorCode, title, message, ex, showDetails);
    }

    private static List<String> causeChain(Throwable ex) {
        List<String> chain = new ArrayList<>();
        Throwable cur = ex;
        int depth = 0;
        while (cur != null && depth < 8) {
            String line = cur.getClass().getSimpleName();
            if (cur.getMessage() != null && !cur.getMessage().isBlank()) {
                line += ": " + cur.getMessage();
            }
            chain.add(line);
            cur = cur.getCause();
            depth++;
        }
        return chain;
    }

    /** Dev-only stack string — kept off the JSP by default; available if needed later. */
    @SuppressWarnings("unused")
    private static String stackTrace(Throwable ex) {
        StringWriter sw = new StringWriter();
        ex.printStackTrace(new PrintWriter(sw));
        return sw.toString();
    }

    static boolean wantsJson(HttpServletRequest request) {
        if (request == null) {
            return false;
        }
        String uri = request.getRequestURI();
        String ctx = request.getContextPath() == null ? "" : request.getContextPath();
        String path = uri != null && uri.startsWith(ctx) ? uri.substring(ctx.length()) : uri;
        if (path != null && (path.startsWith("/api/") || path.startsWith("/ws"))) {
            return true;
        }
        String xhr = request.getHeader("X-Requested-With");
        if ("XMLHttpRequest".equalsIgnoreCase(xhr)) {
            return true;
        }
        String accept = request.getHeader("Accept");
        if (accept != null && accept.contains(MediaType.APPLICATION_JSON_VALUE)
                && !accept.contains("text/html")) {
            return true;
        }
        return false;
    }
}
