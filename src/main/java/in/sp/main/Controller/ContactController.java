package in.sp.main.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import in.sp.main.Entities.*;
import in.sp.main.Repository.UserRepository;
import in.sp.main.Service.ChatService;
import jakarta.servlet.http.HttpSession;

import static org.springframework.web.bind.annotation.RequestMethod.*;

import java.time.LocalDateTime;

@Controller
public class ContactController {

	

    @Autowired
    private ChatService chatService;
    
    @Autowired
    private UserRepository userRepo;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @Autowired
    private JavaMailSender mailSender;

    @org.springframework.beans.factory.annotation.Value("${spring.mail.username}")
    private String adminEmail;

    @GetMapping("/contact")
    public String showContactPage(Model model) {
        model.addAttribute("pageTitle", "Contact Us");
        return "index/contact";
    }

    @PostMapping("/sendMessage")
    public String sendMessage(@RequestParam String name,
                              @RequestParam String email,
                              @RequestParam String subject,
                              @RequestParam String message,
                              Model model) {
        try {
            // Server-side email validation
            if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                model.addAttribute("error", "Invalid email format.");
                return "index/contact";
            }

            SimpleMailMessage mail = new SimpleMailMessage();
            mail.setTo(adminEmail);
            mail.setSubject(subject);
            mail.setText("From: " + name + "\nEmail: " + email + "\n\nMessage:\n" + message);
            mailSender.send(mail);
            model.addAttribute("success", "Your message has been sent!");
        } catch (Exception e) {
            model.addAttribute("error", "Failed to send message. Try again later.");
        }
        return "index"; 
    }
    @MessageMapping("/chat.send")
    public void send(@Payload ChatMessage chatMessage) {

        System.out.println("Received chat message from " + chatMessage.getSender().getId() + " to " + chatMessage.getReceiver().getId());

        in.sp.main.Entities.User sender = userRepo.findById(chatMessage.getSender().getId()).orElse(null);
        in.sp.main.Entities.User receiver = userRepo.findById(chatMessage.getReceiver().getId()).orElse(null);

        if (sender != null && receiver != null) {
            chatMessage.setSender(sender);
            chatMessage.setReceiver(receiver);
            chatMessage.setTimestamp(LocalDateTime.now());
            chatMessage.setReadStatus(false);
            
            chatService.save(chatMessage);
            
            // Build lightweight DTO payload to bypass LazyInitializationException and recursion errors
            java.util.Map<String, Object> payload = new java.util.HashMap<>();
            payload.put("id", chatMessage.getId());
            payload.put("message", chatMessage.getMessage());
            payload.put("videoUrl", chatMessage.getVideoUrl());
            payload.put("timestamp", chatMessage.getTimestamp().toString());
            
            java.util.Map<String, Object> senderMap = new java.util.HashMap<>();
            senderMap.put("id", sender.getId());
            senderMap.put("fullName", sender.getFullName());
            payload.put("sender", senderMap);

            java.util.Map<String, Object> receiverMap = new java.util.HashMap<>();
            receiverMap.put("id", receiver.getId());
            receiverMap.put("fullName", receiver.getFullName());
            payload.put("receiver", receiverMap);

            // 👉 SEND TO RECEIVER
            messagingTemplate.convertAndSend(
                "/topic/messages/" + receiver.getId(),
                payload
            );

            // 👉 SEND BACK TO SENDER
            messagingTemplate.convertAndSend(
                "/topic/messages/" + sender.getId(),
                payload
            );
        } else {
            System.out.println("Sender or Receiver not found.");
        }
    }

}
