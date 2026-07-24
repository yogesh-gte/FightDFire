package in.sp.main.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Autowired
    private WsAuthHandshakeInterceptor wsAuthHandshakeInterceptor;

    @Autowired
    private StompAuthChannelInterceptor stompAuthChannelInterceptor;

    @Value("${app.base-url:http://localhost:8084}")
    private String appBaseUrl;

    @Value("${app.ws.allowed-origin-patterns:}")
    private String extraOriginPatterns;

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        String[] origins = buildAllowedOrigins();
        registry.addEndpoint("/ws-chat")
                .setAllowedOriginPatterns(origins)
                .addInterceptors(wsAuthHandshakeInterceptor)
                .withSockJS();
        registry.addEndpoint("/ws-sos")
                .setAllowedOriginPatterns(origins)
                .addInterceptors(wsAuthHandshakeInterceptor)
                .withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app");
        registry.enableSimpleBroker("/topic");
    }

    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(stompAuthChannelInterceptor);
    }

    private String[] buildAllowedOrigins() {
        java.util.LinkedHashSet<String> set = new java.util.LinkedHashSet<>();
        set.add("http://localhost:8084");
        set.add("http://127.0.0.1:8084");
        if (appBaseUrl != null && !appBaseUrl.isBlank()) {
            set.add(trimSlash(appBaseUrl.trim()));
        }
        if (extraOriginPatterns != null && !extraOriginPatterns.isBlank()) {
            for (String p : extraOriginPatterns.split(",")) {
                if (!p.isBlank()) set.add(p.trim());
            }
        }
        return set.toArray(new String[0]);
    }

    private static String trimSlash(String url) {
        return url.endsWith("/") ? url.substring(0, url.length() - 1) : url;
    }
}
