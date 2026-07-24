package in.sp.main.Config;

import in.sp.main.Entities.Admin;
import in.sp.main.Service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * Creates the first admin from env when the admins table is empty.
 * Public self-registration is disabled; use this once, then invite via /admin/registerAdmin.
 */
@Component
public class AdminBootstrapRunner implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(AdminBootstrapRunner.class);

    private final AdminService adminService;

    @Value("${admin.bootstrap.email:}")
    private String bootstrapEmail;

    @Value("${admin.bootstrap.password:}")
    private String bootstrapPassword;

    @Value("${admin.bootstrap.name:Administrator}")
    private String bootstrapName;

    public AdminBootstrapRunner(AdminService adminService) {
        this.adminService = adminService;
    }

    @Override
    public void run(String... args) {
        if (adminService.countAdmins() > 0) {
            return;
        }
        if (bootstrapEmail == null || bootstrapEmail.isBlank()
                || bootstrapPassword == null || bootstrapPassword.isBlank()) {
            log.warn("No admins in database and ADMIN_BOOTSTRAP_EMAIL/PASSWORD not set — "
                    + "set those env vars once to create the first admin.");
            return;
        }
        Admin admin = new Admin(bootstrapName, bootstrapEmail.trim(), bootstrapPassword);
        try {
            if (adminService.registerAdmin(admin)) {
                log.info("Bootstrapped first admin account for email={}", bootstrapEmail.trim());
            } else {
                log.warn("Admin bootstrap skipped — email already exists: {}", bootstrapEmail.trim());
            }
        } catch (Exception e) {
            log.error("Admin bootstrap failed (check password meets rules: 6+ chars, number, special): {}",
                    e.getMessage());
        }
    }
}
