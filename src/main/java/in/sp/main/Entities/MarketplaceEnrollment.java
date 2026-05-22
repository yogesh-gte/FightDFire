package in.sp.main.Entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class MarketplaceEnrollment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private ProviderClass providerClass;

    private String status; // ENROLLED
    private String paymentStatus; // PAID / PENDING
    private LocalDateTime enrollmentTime;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public ProviderClass getProviderClass() { return providerClass; }
    public void setProviderClass(ProviderClass providerClass) { this.providerClass = providerClass; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
    public LocalDateTime getEnrollmentTime() { return enrollmentTime; }
    public void setEnrollmentTime(LocalDateTime enrollmentTime) { this.enrollmentTime = enrollmentTime; }
}