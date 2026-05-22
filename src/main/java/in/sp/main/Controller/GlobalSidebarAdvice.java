package in.sp.main.Controller;

import in.sp.main.Entities.VerificationStatus;
import in.sp.main.Repository.*;
import in.sp.main.Service.MartialArtsCenterService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalSidebarAdvice {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private MartialArtsCenterService centreService;
    
    @Autowired
    private DoctorRepository doctorRepository;
    
    @Autowired
    private ServiceProviderRepository serviceProviderRepository;
    
    @Autowired
    private SalonRepository salonRepository;
    
    @Autowired
    private StylistRepository stylistRepository;

    @Autowired
    private ContactMessageRepository contactMessageRepository;

    @ModelAttribute
    public void addSidebarCounts(Model model, HttpSession session) {
        if (session.getAttribute("admin") != null) {
            try {
                long pendingUsers = userRepository.findByVerificationStatus(VerificationStatus.PENDING).size();
                long pendingCentres = centreService.getCentresByApprovalStatus(false).size();
                long pendingDoctors = doctorRepository.findByVerificationStatus(VerificationStatus.PENDING).size();
                long pendingSellers = serviceProviderRepository.findByVerificationStatus(VerificationStatus.PENDING).size();
                long pendingSalons = salonRepository.findByApproved(false).size();
                long pendingStylists = stylistRepository.findByApproved(false).size();
                long unreadContactMessages = contactMessageRepository.countByReadByAdminFalse();
                
                model.addAttribute("side_pendingUsers", pendingUsers);
                model.addAttribute("side_pendingCentres", pendingCentres);
                model.addAttribute("side_pendingDoctors", pendingDoctors);
                model.addAttribute("side_pendingSellers", pendingSellers);
                model.addAttribute("side_pendingSalons", pendingSalons);
                model.addAttribute("side_pendingStylists", pendingStylists);
                model.addAttribute("side_unreadContactMessages", unreadContactMessages);
            } catch (Exception e) {
                // Fail gracefully
            }
        }
    }
}
