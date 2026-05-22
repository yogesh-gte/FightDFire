package in.sp.main.Service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.Admin;
import in.sp.main.Entities.MartialArtsCenter;
import in.sp.main.Entities.PasswordResetToken;
import in.sp.main.Entities.User;
import in.sp.main.Entities.UserType;
import in.sp.main.Repository.AdminRepository;
import in.sp.main.Repository.MartialArtsCenterRepository;
import in.sp.main.Repository.PasswordResetTokenRepository;
import in.sp.main.Repository.UserRepository;

@Service
public class PasswordResetService {

    @Autowired private UserRepository userRepository;
    @Autowired private AdminRepository adminRepository;
    @Autowired private MartialArtsCenterRepository centreRepository;
    @Autowired private PasswordResetTokenRepository tokenRepository;
    @Autowired private JavaMailSender mailSender;
    @Autowired private PasswordEncoder passwordEncoder;

    private static final int EXPIRATION_TIME = 15;

    public String createPasswordResetToken(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        Optional<Admin> admin = adminRepository.findByEmail(email);
        Optional<MartialArtsCenter> centre = centreRepository.findByEmail(email);

        UserType userType = null;
        if (user.isPresent()) userType = UserType.USER;
        else if (admin.isPresent()) userType = UserType.ADMIN;
        else if (centre.isPresent()) userType = UserType.CENTRE;
        else return "Email not found";

        String token = UUID.randomUUID().toString();
        PasswordResetToken resetToken = new PasswordResetToken(email, token, userType, EXPIRATION_TIME);
        tokenRepository.save(resetToken);

        sendResetEmail(email, token, userType);
        return "Reset email sent successfully";
    }

    private void sendResetEmail(String email, String token, UserType userType) {
        String resetUrl = "http://localhost:8081/auth/reset-password?token=" + token + "&type=" + userType;
        String messageBody = "Click to reset your password: " + resetUrl;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("Password Reset Request");
        message.setText(messageBody);
        mailSender.send(message);
    }

    public String resetPassword(String token, String newPassword) {
        Optional<PasswordResetToken> tokenOpt = tokenRepository.findByToken(token);
        if (tokenOpt.isEmpty() || tokenOpt.get().isExpired()) {
            return "Invalid or expired token";
        }

        PasswordResetToken resetToken = tokenOpt.get();
        String email = resetToken.getEmail();
        UserType userType = resetToken.getUserType();
        String encodedPassword = newPassword;

        switch (userType) {
            case USER:
                userRepository.findByEmail(email).ifPresent(user -> {
                    user.setPassword(encodedPassword);
                    userRepository.save(user);
                });
                break;
            case ADMIN:
                adminRepository.findByEmail(email).ifPresent(admin -> {
                    admin.setPassword(encodedPassword);
                    adminRepository.save(admin);
                });
                break;
            case CENTRE:
                centreRepository.findByEmail(email).ifPresent(centre -> {
                    centre.setPassword(encodedPassword);
                    centreRepository.save(centre);
                });
                break;
        }

        tokenRepository.delete(resetToken);
        return "Password reset successful";
    }
}