package in.sp.main.Service;

import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.sp.main.Config.PasswordAuthHelper;
import in.sp.main.Entities.Admin;
import in.sp.main.Repository.AdminRepository;
import in.sp.main.exception.ValidationException;

@Service
public class AdminService {

    private static final Pattern PLAIN_PASSWORD_RULE = Pattern.compile(
            "^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,}$");

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private PasswordAuthHelper passwordAuth;

    public long countAdmins() {
        return adminRepository.count();
    }

    public boolean registerAdmin(Admin admin) {
        Optional<Admin> existing = adminRepository.findByEmail(admin.getEmail());
        if (existing.isEmpty()) {
            validatePlainPassword(admin.getPassword());
            admin.setPassword(passwordAuth.encode(admin.getPassword()));
            adminRepository.save(admin);
            return true;
        }
        return false;
    }

    @Transactional
    public Admin loginAdmin(String email, String password) {
        String norm = email == null ? "" : email.trim();
        Optional<Admin> opt = adminRepository.findByEmailIgnoreCase(norm);
        if (opt.isEmpty()) return null;
        Admin admin = opt.get();
        if (!passwordAuth.matches(password, admin.getPassword())) {
            return null;
        }
        if (passwordAuth.needsUpgrade(admin.getPassword())) {
            try {
                admin.setPassword(passwordAuth.encode(password));
                adminRepository.saveAndFlush(admin);
            } catch (Exception upgradeEx) {
                // Don't block sign-in if legacy→BCrypt upgrade fails (e.g. old validation/column issues)
                org.slf4j.LoggerFactory.getLogger(AdminService.class)
                        .warn("Admin password upgrade failed for email={} — allowing login anyway: {}",
                                admin.getEmail(), upgradeEx.toString());
                // Reload so we don't leave a half-dirty entity in the persistence context
                return adminRepository.findById(admin.getId()).orElse(admin);
            }
        }
        return admin;
    }

    public Admin updateAdmin(int id, Admin updatedAdmin) {
        return adminRepository.findById(id).map(admin -> {
            admin.setName(updatedAdmin.getName());
            admin.setEmail(updatedAdmin.getEmail());
            if (updatedAdmin.getPassword() != null && !updatedAdmin.getPassword().isBlank()) {
                String raw = updatedAdmin.getPassword();
                if (!PasswordAuthHelper.isBcrypt(raw)) {
                    validatePlainPassword(raw);
                }
                admin.setPassword(passwordAuth.encodeIfPlain(raw));
            }
            if (updatedAdmin.getProfilePhoto() != null) {
                admin.setProfilePhoto(updatedAdmin.getProfilePhoto());
            }
            return adminRepository.save(admin);
        }).orElseThrow(() -> new RuntimeException("Admin not found with id: " + id));
    }

    public void deleteAdmin(int id) {
        if (adminRepository.existsById(id)) {
            adminRepository.deleteById(id);
        } else {
            throw new RuntimeException("Admin not found with id: " + id);
        }
    }

    public List<Admin> findAllAdmins() {
        return adminRepository.findAll();
    }

    public Optional<Admin> findById(int id) {
        return adminRepository.findById(id);
    }

    private void validatePlainPassword(String password) {
        if (password == null || !PLAIN_PASSWORD_RULE.matcher(password).matches()) {
            throw new ValidationException(
                    "Password must be at least 6 characters and include a number and a special character (!@#$%^&*).");
        }
    }
}
