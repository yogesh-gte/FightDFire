package in.sp.main.Config;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import java.util.Map;

/**
 * Requires a valid JWT_TOKEN cookie before SockJS/WebSocket handshake completes.
 * Stores username + role on the WebSocket session for STOMP handlers.
 */
@Component
public class WsAuthHandshakeInterceptor implements HandshakeInterceptor {

    public static final String ATTR_USERNAME = "wsUsername";
    public static final String ATTR_ROLE = "wsRole";

    private final JwtUtil jwtUtil;

    public WsAuthHandshakeInterceptor(JwtUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
                                   WebSocketHandler wsHandler, Map<String, Object> attributes) {
        if (!(request instanceof ServletServerHttpRequest servletRequest)) {
            return false;
        }
        HttpServletRequest http = servletRequest.getServletRequest();
        String token = null;
        Cookie[] cookies = http.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("JWT_TOKEN".equals(c.getName())) {
                    token = c.getValue();
                    break;
                }
            }
        }
        if (token == null || token.isBlank() || !Boolean.TRUE.equals(jwtUtil.validateToken(token))) {
            return false;
        }
        try {
            attributes.put(ATTR_USERNAME, jwtUtil.extractUsername(token));
            attributes.put(ATTR_ROLE, jwtUtil.extractRole(token));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
                               WebSocketHandler wsHandler, Exception exception) {
        // no-op
    }
}
