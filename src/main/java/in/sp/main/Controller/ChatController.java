package in.sp.main.Controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import in.sp.main.Entities.ChatMessage;
import in.sp.main.Entities.User;
import in.sp.main.Repository.UserRepository;
import in.sp.main.Service.ChatService;

import jakarta.servlet.http.HttpSession;
import org.springframework.messaging.simp.SimpMessagingTemplate;


@Controller
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private UserRepository userRepo;
    

    @Autowired
    private in.sp.main.Service.UserFollowService followService;

    // Show all users to start chat
    @GetMapping("/users")
    public String showUsers(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("user");
        if (currentUser == null) {
            return "redirect:/login";
        }

        // Only mutual followers (friends) are allowed to chat
        List<User> users = followService.getFriends(currentUser.getId());
        model.addAttribute("users", users);
        return "chat_users";
    }

    // Chat window between two users
    @GetMapping("/window/{receiverId}")
    public String openChatWindow(@PathVariable Long receiverId, Model model, HttpSession session) {
        User sender = (User) session.getAttribute("user");
        if (sender == null) return "redirect:/login";

        User receiver = userRepo.findById(receiverId).orElse(null);
        if (receiver == null) return "redirect:/chat/users";

        chatService.markAsRead(receiverId, sender.getId());
        List<ChatMessage> messages = chatService.getChatHistory(sender, receiver);
        model.addAttribute("receiver", receiver);
        model.addAttribute("messages", messages);
        return "chat_window";
    }

    // Send message
   

    @PostMapping("/sendReel")
    @ResponseBody
    public String sendReel(@RequestParam Long receiverId,
                           @RequestParam String videoUrl,
                           HttpSession session) {

        User sender = (User) session.getAttribute("user");
        if (sender == null) return "NOT_LOGGED_IN";

        User receiver = userRepo.findById(receiverId).orElse(null);
        if (receiver == null) return "USER_NOT_FOUND";

        ChatMessage msg = new ChatMessage();
        msg.setSender(sender);
        msg.setReceiver(receiver);
        msg.setVideoUrl(videoUrl);
        msg.setTimestamp(LocalDateTime.now());

        chatService.save(msg);

        // Send via WebSocket
        messagingTemplate.convertAndSend("/topic/messages/" + receiverId, msg);

        return "OK";
    }

}