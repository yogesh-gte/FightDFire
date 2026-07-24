package in.sp.main.Controller;

import in.sp.main.exception.ErrorModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Handles container / filter / 404 errors that never reach a controller
 * (so {@link GlobalExceptionHandler} alone is not enough).
 */
@Controller
public class AppErrorController implements ErrorController {

    private static final Logger log = LoggerFactory.getLogger(AppErrorController.class);

    @Value("${app.error.show-details:true}")
    private boolean showDetails;

    @RequestMapping("/error")
    public Object handleError(HttpServletRequest request, Model model) {
        Integer statusCode = (Integer) request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Throwable ex = (Throwable) request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
        String path = (String) request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);
        String servletMessage = (String) request.getAttribute(RequestDispatcher.ERROR_MESSAGE);

        int status = statusCode != null ? statusCode : 500;
        String errorCode = status == 404 ? "NOT_FOUND" : (status >= 500 ? "INTERNAL_ERROR" : "REQUEST_ERROR");
        String title = ErrorModel.titleForStatus(status);
        String message = ErrorModel.friendlyForStatus(status);

        if (ex instanceof in.sp.main.exception.AppException appEx) {
            status = appEx.getStatus();
            errorCode = appEx.getErrorCode();
            title = ErrorModel.titleForStatus(status);
            message = appEx.getUserMessage();
        } else if (servletMessage != null && !servletMessage.isBlank() && status < 500) {
            message = servletMessage;
        }

        if (status >= 500) {
            log.error("Error page status={} path={} ex={}", status, path,
                    ex != null ? ex.toString() : servletMessage, ex);
        } else {
            log.warn("Error page status={} path={}", status, path);
        }

        Map<String, Object> body = GlobalExceptionHandler.toModelMap(
                request, status, errorCode, title, message, ex, showDetails);
        if (path != null) {
            body.put(ErrorModel.PATH, path);
        }

        if (GlobalExceptionHandler.wantsJson(request)) {
            return ResponseEntity.status(status).contentType(MediaType.APPLICATION_JSON).body(body);
        }

        body.forEach(model::addAttribute);
        // Ensure JSP always has safe defaults
        if (!model.containsAttribute(ErrorModel.STATUS)) {
            model.addAttribute(ErrorModel.STATUS, status);
        }
        return "error";
    }
}
