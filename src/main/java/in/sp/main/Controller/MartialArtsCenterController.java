package in.sp.main.Controller;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import in.sp.main.Entities.*;
import in.sp.main.Repository.MartialArtsCenterRepository;
import in.sp.main.Repository.MartialArtsTypeRepository;
import in.sp.main.Repository.MartialArtsBatchRepository;
import in.sp.main.Service.FileUploadService;
import in.sp.main.Service.MartialArtsCenterService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/centres")
public class MartialArtsCenterController {

    @Autowired
    private in.sp.main.Repository.VideoUploadRepository videoRepository;

    @Autowired
    private MartialArtsCenterService centreService;
    @Autowired
    private final ObjectMapper objectMapper;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private FileUploadService fileuploadService;
    @Autowired
    private MartialArtsCenterRepository centreRepository;
    @Autowired
    private MartialArtsTypeRepository typeRepository;
    @Autowired
    private MartialArtsBatchRepository batchRepository;

    @Autowired
    private in.sp.main.Repository.EnrollmentRepository enrollmentRepository;

    @Autowired
    private in.sp.main.Repository.OnlineClassEnrollmentRepository onlineClassEnrollmentRepository;

    @Autowired
    private in.sp.main.Repository.OnlineClassRepository onlineClassRepository;

    @Autowired
    private in.sp.main.Repository.OnlineClassInvitationRepository invitationRepository;
    
    @Autowired
    private in.sp.main.Repository.AttendanceRepository attendanceRepository;

    public MartialArtsCenterController(MartialArtsCenterService centreService, ObjectMapper objectMapper) {
        this.centreService = centreService;
        this.objectMapper = objectMapper;
    }

    @InitBinder
    public void initBinder(org.springframework.web.bind.WebDataBinder binder) {
        binder.setDisallowedFields("galleryPhotos");
    }

    // ---------- REGISTER FORM ----------
    @RequestMapping(value = "/registerCentre", method = RequestMethod.GET)
    public String showRegisterForm(Model model) {
        MartialArtsCenter center = new MartialArtsCenter();
        MartialArtsType type = new MartialArtsType();
        type.getSlots().add(new Slot());
        center.getMartialArtsTypes().add(type);

        model.addAttribute("martialArtsCenter", center);
        model.addAttribute("AvailableDays", Arrays.asList(DayAvailable.values()));
        return "registerCentre";
    }

    // ---------- REGISTER SUBMIT ----------
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCentre(
            @ModelAttribute MartialArtsCenter center,
            @RequestPart("certificate") MultipartFile certificate,
            @RequestParam("profileimage") MultipartFile profilePhoto,
            @RequestParam(value = "galleryPhotos", required = false) MultipartFile[] galleryPhotos,
            @RequestParam("availableDays") List<DayAvailable> availableDays,
            @RequestParam("martialArtsJson") String martialArtsJson,
            RedirectAttributes redirectAttributes) {

        try {
            if (centreRepository.findByEmail(center.getEmail()).isPresent()) {
                redirectAttributes.addFlashAttribute("error", "Email already exists. Please login.");
                return "redirect:/centres/login";
            }

            if (galleryPhotos != null) {
                for (MultipartFile photo : galleryPhotos) {
                    if (!photo.isEmpty()) {
                        String photoUrl = fileuploadService.saveFile(photo);
                        center.getGalleryPhotos().add(photoUrl);
                    }
                }
            }

            ObjectMapper mapper = new ObjectMapper();
            List<MartialArtsType> types = mapper.readValue(
                    martialArtsJson, new TypeReference<List<MartialArtsType>>() {}
            );

            for (MartialArtsType type : types) {
                type.setCentre(center);
                if (type.getSlots() != null) {
                    for (Slot slot : type.getSlots()) {
                        slot.setMartialArtsType(type);
                    }
                }
            }

            if (availableDays != null) {
                center.setAvailableDays(new TreeSet<>(availableDays));
            } else {
                center.setAvailableDays(new TreeSet<>());
            }

            centreService.register(center, certificate, types, profilePhoto);

            redirectAttributes.addFlashAttribute("message",
                    "Center Registered Successfully! Waiting for Admin Approval.");
            return "redirect:/centres/success";

        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "File upload failed: " + e.getMessage());
            return "redirect:/centres/registerCentre";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Registration failed: " + e.getMessage());
            return "redirect:/centres/registerCentre";
        }
    }

    // ---------- SUCCESS PAGE ----------
    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String showSuccessPage() {
        return "registerSucessCentre";
    }

    // ---------- CERTIFICATE VIEW ----------
    @RequestMapping(value = "/certificate/{id}", method = RequestMethod.GET)
    public String getCertificatePath(@PathVariable Long id, Model model) {
        String filePath = centreService.getCertificatePath(id);
        model.addAttribute("certificatePath", filePath);
        return "viewCertificate";
    }

    // ---------- GET ALL TYPES ----------
    @RequestMapping(value = "/types/{centreId}", method = RequestMethod.GET)
    @ResponseBody
    public List<MartialArtsType> getMartialArtsTypes(@PathVariable Long centreId) {
        return centreService.getMartialArtsTypes(centreId);
    }

    // ---------- ALL CENTERS ----------
    @RequestMapping(value = "/allcentres", method = RequestMethod.GET)
    public String getAllCenters(Model model) {
        List<MartialArtsCenter> centers = centreService.getAllCenters();
        model.addAttribute("centers", centers);
        return "listOfCentres";
    }

    // ---------- APPROVED CENTERS ----------
    @RequestMapping(value = "/allacceptedcentres", method = RequestMethod.GET)
    public String getAllAcceptedCenters(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<MartialArtsCenter> centers = centreService.getApprovedCenters();
        List<in.sp.main.Entities.Videoupload> videos = videoRepository.findByIsReel(true);
        
        if (user != null) {
            List<Enrollment> enrollments = enrollmentRepository.findByUser(user);
            Set<Long> enrolledBatchIds = enrollments.stream()
                .filter(e -> e.getBatch() != null)
                .map(e -> e.getBatch().getId())
                .collect(Collectors.toSet());
            model.addAttribute("enrolledBatchIds", enrolledBatchIds);
        }
        
        model.addAttribute("centers", centers);
        model.addAttribute("videos", videos);
        model.addAttribute("user", user);

        // Sorting days for all centers chronologically
        for (MartialArtsCenter c : centers) {
            if (c.getAvailableDays() != null) {
                List<DayAvailable> sortedList = new ArrayList<>(c.getAvailableDays());
                sortedList.sort((d1, d2) -> d1.ordinal() - d2.ordinal());
                c.setAvailableDays(new LinkedHashSet<>(sortedList));
            }
        }

        return "userMartialDashboard";
    }

    // ---------- BY LOCATION ----------
    @RequestMapping(value = "/location/{location}", method = RequestMethod.GET)
    public String getCentersByLocation(@PathVariable String location, Model model) {
        List<MartialArtsCenter> centers = centreService.getCentersByLocation(location);
        model.addAttribute("centers", centers);
        return "centersByLocation";
    }

    // ---------- CENTER DETAILS ----------
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String getCenterDetails(@PathVariable Long id, Model model) {
        MartialArtsCenter center = centreService.getCenterById(id);
        if (center == null) return "errorPage";
        
        List<DayAvailable> sortedDays = new ArrayList<>(center.getAvailableDays());
        sortedDays.sort((d1, d2) -> d1.ordinal() - d2.ordinal());
        
        List<MartialArtsBatch> batches = batchRepository.findByCenterId(id);
        model.addAttribute("center", center);
        model.addAttribute("sortedAvailableDays", sortedDays);
        model.addAttribute("batches", batches);
        return "centreDetails";
    }

    // ---------- DETAILS FOR DASHBOARD ----------
    @RequestMapping(value = "/detailsforCentre/{id}", method = RequestMethod.GET)
    public String getCenterDetailsforCentreDashboard(@PathVariable Long id, Model model) {
        MartialArtsCenter center = centreService.getCenterById(id);
        if (center == null) return "errorPage";
        
        List<DayAvailable> sortedDays = new ArrayList<>(center.getAvailableDays());
        sortedDays.sort((d1, d2) -> d1.ordinal() - d2.ordinal());
        
        List<MartialArtsBatch> batches = batchRepository.findByCenterId(id);
        model.addAttribute("center", center);
        model.addAttribute("sortedAvailableDays", sortedDays);
        model.addAttribute("batches", batches);
        return "centreProfile";
    }

    // ---------- LOGIN PAGE ----------
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        return "centreLogin";
    }

    // ---------- LOGIN SUBMIT ----------
    @RequestMapping(value = "/loginCentre", method = RequestMethod.POST)
    public String loginCentre(@RequestParam String email,
                              @RequestParam String password,
                              Model model, HttpSession session,
                              RedirectAttributes redirectAttributes) {
        MartialArtsCenter center = centreService.getCenterByEmail(email);
        if (center == null || !center.getPassword().equals(password)) {
            redirectAttributes.addFlashAttribute("error", "Invalid credentials!");
            return "redirect:/centres/login";
        }
        if (!center.isApproved()) {
            redirectAttributes.addFlashAttribute("error", "Your center is not yet approved by admin!");
            return "redirect:/centres/login";
        }

        session.setAttribute("loggedCentre", center);
        return "redirect:/centres/dashboard1";
    }

    // ---------- LOGOUT ----------
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/centres/login";
    }

    // ---------- DASHBOARD ----------
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String centerDashboard(HttpSession session, Model model, HttpServletResponse response) {
        MartialArtsCenter center = (MartialArtsCenter) session.getAttribute("loggedCentre");
        if (center == null) return "redirect:/centres/login";

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        model.addAttribute("center", center);
        return "centreDashboard";
    }

    // ---------- ROBUST DASHBOARD ROUTING ----------
    @PostMapping("/process-batch")
    @ResponseBody
    public Map<String, Object> processBatch(@RequestBody MartialArtsBatch batch, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            MartialArtsCenter center = (MartialArtsCenter) session.getAttribute("loggedCentre");
            if (center == null) {
                response.put("status", "error");
                response.put("message", "Session expired. Please login again.");
                return response;
            }
            batch.setCenter(center);
            batchRepository.save(batch);
            response.put("status", "success");
            response.put("message", "Batch created successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "Database error: " + e.getMessage());
        }
        return response;
    }

    @GetMapping("/{tab}")
    public String centerDashboard(@PathVariable String tab,
                                  HttpSession session, Model model, HttpServletResponse response) {
        MartialArtsCenter sessionCenter = (MartialArtsCenter) session.getAttribute("loggedCentre");
        if (sessionCenter == null) return "redirect:/centres/login";
        
        // Refresh center from DB to ensure consistency
        MartialArtsCenter center = centreRepository.findById(sessionCenter.getId()).orElse(sessionCenter);

        // Whitelist of valid dashboard tabs
        Set<String> validTabs = new HashSet<>(Arrays.asList(
            "dashboard", "batches", "live-classes", "students", 
            "bookings", "class-types", "attendance", "reports", "settings",
            "create-batch"
        ));

        // Fallback to dashboard if invalid tab
        if (!validTabs.contains(tab)) {
            if ("dashboard1".equals(tab)) tab = "dashboard"; // Handle legacy
            else return "redirect:/centres/dashboard";
        }
        
        model.addAttribute("currentTab", tab);

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        List<Enrollment> enrollments = centreService.getEnrolledUsersByCenter(center.getId());
        List<MartialArtsBatch> batches = batchRepository.findByCenterId(center.getId());
        
        // Also fetch specific OnlineClass sessions created for this center
        List<OnlineClass> onlineClasses = onlineClassRepository.findByCenter_Id(center.getId());
        
        double totalEarnings = enrollments.stream()
                                         .filter(e -> e.getAmountPaid() != null)
                                         .mapToDouble(Enrollment::getAmountPaid)
                                         .sum();

        model.addAttribute("center", center);
        model.addAttribute("enrollments", enrollments);
        model.addAttribute("batches", batches);
        model.addAttribute("totalEarnings", totalEarnings);
        model.addAttribute("trainingStatuses", TrainingStatus.values());

        // Performance Optimization: Pre-serialize data to avoid extra AJAX calls on load
        try {
            com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
            
            List<Map<String, Object>> batchList = new ArrayList<>();
            for (MartialArtsBatch b : batches) {
                Map<String, Object> bMap = new HashMap<>();
                bMap.put("id", b.getId());
                bMap.put("name", b.getName());
                bMap.put("style", b.getStyle());
                bMap.put("instructor", b.getInstructor());
                bMap.put("timeSlot", b.getTimeSlot());
                
                String days = b.getAvailableDays();
                if (days != null && days.contains(",")) {
                    List<String> dayList = Arrays.asList(days.split(","));
                    dayList.sort((d1, d2) -> {
                        Map<String, Integer> order = Map.of("MON", 1, "TUE", 2, "WED", 3, "THU", 4, "FRI", 5, "SAT", 6, "SUN", 7);
                        return order.getOrDefault(d1.trim().toUpperCase(), 99) - order.getOrDefault(d2.trim().toUpperCase(), 99);
                    });
                    days = String.join(", ", dayList);
                }
                bMap.put("availableDays", days != null ? days : "All Week");
                bMap.put("fee", b.getFee() != null ? b.getFee() : 0.0);
                bMap.put("status", b.getStatus());
                bMap.put("batchType", b.getBatchType());
                bMap.put("meetingLink", b.getMeetingLink());
                bMap.put("isBatch", true);
                batchList.add(bMap);
            }
            
            // Add specific online classes to the same list for the Live tab
            for (OnlineClass oc : onlineClasses) {
                Map<String, Object> ocMap = new HashMap<>();
                ocMap.put("id", oc.getId());
                ocMap.put("name", oc.getTitle());
                ocMap.put("style", "Live Session");
                ocMap.put("timeSlot", oc.getStartTime() + " - " + oc.getEndTime());
                ocMap.put("batchType", "Online");
                ocMap.put("meetingLink", oc.getMeetingLink());
                ocMap.put("isBatch", false);
                ocMap.put("status", oc.getStatus()); // LIVE, UPCOMING, etc
                
                // Pull fee and days from parent batch if it exists
                if (oc.getBatch() != null) {
                    ocMap.put("availableDays", oc.getBatch().getAvailableDays());
                    ocMap.put("fee", oc.getBatch().getFee());
                } else {
                    ocMap.put("availableDays", "One-time");
                    ocMap.put("fee", 0.0);
                }
                batchList.add(ocMap);
            }
            
            model.addAttribute("batchesJson", mapper.writeValueAsString(batchList));

            List<Map<String, Object>> enrollList = new ArrayList<>();
            for (Enrollment e : enrollments) {
                Map<String, Object> eMap = new HashMap<>();
                eMap.put("id", e.getId());
                eMap.put("traineeName", e.getFullName() != null ? e.getFullName() : (e.getUser() != null ? e.getUser().getFullName() : "Unknown"));
                eMap.put("age", e.getAge());
                eMap.put("gender", e.getGender());
                eMap.put("phone", e.getPhoneNumber());
                eMap.put("email", e.getEmail() != null ? e.getEmail() : (e.getUser() != null ? e.getUser().getEmail() : ""));
                eMap.put("martialArtType", e.getMartialArtsType() != null ? e.getMartialArtsType().getName() : "N/A");
                eMap.put("centreName", center.getName());
                eMap.put("batchName", e.getBatch() != null ? e.getBatch().getName() : "N/A");
                eMap.put("mode", e.getBatch() != null ? e.getBatch().getBatchType() : "N/A");
                eMap.put("slot", e.getBatch() != null ? e.getBatch().getTimeSlot() : "N/A");
                eMap.put("enrollmentDate", e.getProposedStartDate() != null ? e.getProposedStartDate().toString() : "");
                eMap.put("enrollmentStatus", e.getStatus() != null ? e.getStatus().toString() : "PENDING");
                eMap.put("paymentStatus", e.getPaymentStatus() != null ? e.getPaymentStatus() : "UNPAID");
                eMap.put("amount", e.getAmountPaid() != null ? e.getAmountPaid() : 0.0);
                
                // Attendance Stats
                List<Attendance> history = attendanceRepository.findByUserId(e.getUser() != null ? e.getUser().getId() : -1L);
                long totalAtt = history.size();
                long presentCount = history.stream().filter(h -> h.getStatus() == in.sp.main.Entities.AttendanceStatus.PRESENT).count();
                eMap.put("attendancePercentage", totalAtt == 0 ? 0 : (int)((double)presentCount/totalAtt * 100));
                eMap.put("progress", e.getProgressPercentage() != null ? e.getProgressPercentage() : 0);
                
                // Last Attended
                attendanceRepository.findFirstByUserIdOrderByAttendanceDateDesc(e.getUser() != null ? e.getUser().getId() : -1L)
                    .ifPresent(a -> eMap.put("lastAttendedDate", a.getAttendanceDate().toString()));
                
                enrollList.add(eMap);
            }
            model.addAttribute("enrollmentsJson", mapper.writeValueAsString(enrollList));

        } catch (Exception e) {
            e.printStackTrace();
            // Fallback to empty JSON but keep model objects so basic counts might work if JSP uses them
            model.addAttribute("batchesJson", "[]");
            model.addAttribute("enrollmentsJson", "[]");
        }
        
        return "centreDashboard";
    }

    // ---------- UPDATE ----------
    @RequestMapping(value = "/update/{centerId}", method = RequestMethod.POST)
    public String updateCenterDetails(@PathVariable Long centerId,
                                      @ModelAttribute MartialArtsCenter updatedCenter,
                                      @RequestParam(value = "file", required = false) MultipartFile file,
                                      @RequestParam(value = "galleryPhotos", required = false) MultipartFile[] galleryPhotos,
                                      @RequestParam(value = "types", required = false) List<Long> typeIds,
                                      RedirectAttributes redirectAttributes) throws IOException {
        centreService.updateCenterDetails(centerId, updatedCenter, file, galleryPhotos, typeIds);
        redirectAttributes.addFlashAttribute("message", "Center details updated successfully!");
        return "redirect:/centres/details/" + centerId;
    }

    // ---------- UPDATE FORM ----------
    @RequestMapping(value = "/updateCentre/{id}", method = RequestMethod.GET)
    public String showUpdateCentreForm(@PathVariable Long id, Model model) {
        MartialArtsCenter center = centreService.getCenterById(id);
        if (center == null) return "errorPage";

        List<MartialArtsType> allTypes = typeRepository.findAll();
        List<Long> selectedTypeIds = center.getMartialArtsTypes()
                                           .stream()
                                           .map(MartialArtsType::getId)
                                           .toList();

        model.addAttribute("center", center);
        model.addAttribute("allTypes", allTypes);
        model.addAttribute("selectedTypeIds", selectedTypeIds);

        return "updateCentre";
    }

    // ---------- ABOUT PAGE ----------
    @RequestMapping(value = "/about/{id}", method = RequestMethod.GET)
    public String showCenterProfile(@PathVariable Long id, Model model) {
        MartialArtsCenter center = centreService.getCenterById(id);
        List<MartialArtsType> types = centreService.getMartialArtsTypes(id);
        if (center == null) return "errorPage";
        
        List<DayAvailable> sortedDays = new ArrayList<>(center.getAvailableDays());
        sortedDays.sort((d1, d2) -> d1.ordinal() - d2.ordinal());
        
        model.addAttribute("center", center);
        model.addAttribute("sortedAvailableDays", sortedDays);
        model.addAttribute("types", types);
        return "aboutCentre";
    }

    // ---------- DELETE ----------
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    public String deleteCenter(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        boolean isDeleted = centreService.deleteCenter(id);
        if (isDeleted) {
            redirectAttributes.addFlashAttribute("message", "Center deleted successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to delete center.");
        }
        return "redirect:/centres/allcentres";
    }

    // ---------- BATCH MANAGEMENT API ----------
    
    @PostMapping("/batches/create")
    @ResponseBody
    public Map<String, Object> createBatch(@RequestBody MartialArtsBatch batch, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            MartialArtsCenter center = (MartialArtsCenter) session.getAttribute("loggedCentre");
            if (center == null) {
                response.put("success", false);
                response.put("message", "User not logged in");
                return response;
            }
            batch.setCenter(center);
            MartialArtsBatch savedBatch = batchRepository.save(batch);
            response.put("success", true);
            response.put("batch", savedBatch);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", e.getMessage());
        }
        return response;
    }

    @GetMapping("/batches/center/{id}")
    @ResponseBody
    public List<MartialArtsBatch> getBatchesByCenter(@PathVariable Long id) {
        return batchRepository.findByCenterId(id);
    }

    @PostMapping("/batches/delete/{id}")
    @ResponseBody
    public Map<String, Object> deleteBatch(@PathVariable Long id) {
        Map<String, Object> response = new HashMap<>();
        try {
            batchRepository.deleteById(id);
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", e.getMessage());
        }
        return response;
    }
}
