package in.sp.main.Controller;

import in.sp.main.Config.WsAuthHandshakeInterceptor;
import in.sp.main.Entities.MarketplaceMessage;
import in.sp.main.Entities.ProviderBooking;
import in.sp.main.Entities.ServiceProvider;
import in.sp.main.Entities.User;
import in.sp.main.Repository.MarketplaceMessageRepository;
import in.sp.main.Repository.ProviderBookingRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class MarketplaceCommController {

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private MarketplaceMessageRepository messageRepo;

    @Autowired
    private ProviderBookingRepository bookingRepo;

    @MessageMapping("/marketplace-chat/{bookingId}")
    public void handleMessage(@DestinationVariable Long bookingId,
                              @Payload Map<String, Object> message,
                              SimpMessageHeaderAccessor headers) {
        String wsUser = headerUsername(headers);
        if (wsUser == null) {
            return;
        }
        ProviderBooking booking = bookingRepo.findById(bookingId).orElse(null);
        if (booking == null || !isBookingPartyEmail(booking, wsUser)) {
            return;
        }

        String type = (String) message.get("type");
        String role = deriveSenderRole(booking, wsUser);
        message.put("senderRole", role);

        if ("CHAT".equals(type)) {
            MarketplaceMessage msg = new MarketplaceMessage(
                    booking,
                    (String) message.get("content"),
                    role
            );
            messageRepo.save(msg);
        }

        messagingTemplate.convertAndSend("/topic/marketplace-chat/" + bookingId, message);
    }

    @GetMapping("/marketplace/chat-history/{bookingId}")
    @ResponseBody
    public List<MarketplaceMessage> getChatHistory(@PathVariable Long bookingId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        ServiceProvider provider = (ServiceProvider) session.getAttribute("loggedProvider");
        if (user == null && provider == null) {
            return List.of();
        }
        ProviderBooking booking = bookingRepo.findById(bookingId).orElse(null);
        if (booking == null) {
            return List.of();
        }
        boolean allowed = false;
        if (user != null && booking.getUser() != null && booking.getUser().getId().equals(user.getId())) {
            allowed = true;
        }
        if (provider != null && booking.getProvider() != null && booking.getProvider().getId().equals(provider.getId())) {
            allowed = true;
        }
        if (!allowed) {
            return List.of();
        }
        return messageRepo.findByBookingOrderByTimestampAsc(booking);
    }

    private static String headerUsername(SimpMessageHeaderAccessor headers) {
        if (headers.getSessionAttributes() == null) return null;
        Object u = headers.getSessionAttributes().get(WsAuthHandshakeInterceptor.ATTR_USERNAME);
        return u != null ? u.toString() : null;
    }

    private static boolean isBookingPartyEmail(ProviderBooking booking, String email) {
        if (email == null) return false;
        String e = email.trim().toLowerCase();
        if (booking.getUser() != null && booking.getUser().getEmail() != null
                && e.equals(booking.getUser().getEmail().trim().toLowerCase())) {
            return true;
        }
        if (booking.getProvider() != null && booking.getProvider().getEmail() != null
                && e.equals(booking.getProvider().getEmail().trim().toLowerCase())) {
            return true;
        }
        return false;
    }

    private static String deriveSenderRole(ProviderBooking booking, String email) {
        String e = email.trim().toLowerCase();
        if (booking.getProvider() != null && booking.getProvider().getEmail() != null
                && e.equals(booking.getProvider().getEmail().trim().toLowerCase())) {
            return "PROVIDER";
        }
        return "USER";
    }
}
