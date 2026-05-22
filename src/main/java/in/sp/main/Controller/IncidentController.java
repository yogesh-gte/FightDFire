package in.sp.main.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.Incident;
import in.sp.main.Entities.IncidentStatus;
import in.sp.main.Entities.User;
import in.sp.main.Service.*;
import in.sp.main.Service.UserService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/incidents")
public class IncidentController {

    @Autowired
    private IncidentService incidentService;
    @Autowired
    private FileUploadService fileUploadService;

    @Autowired
    private UserService userService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private in.sp.main.Repository.DangerPointRepository dangerPointRepository;
    
    private static final String MEDIA_DIRECTORY = "/secured_media/";

    @RequestMapping(value = "/report", method = RequestMethod.GET)
    public String showReportForm(Model model) {
        model.addAttribute("incident", new Incident());
        return "reportIncident";
    }
    
    @RequestMapping(value = "/report", method = RequestMethod.POST)
    public String reportIncident(@ModelAttribute Incident incident,
                                 @RequestParam(value = "file", required = false) MultipartFile file,
                                 @RequestParam(required = false) Double latitude,
                                 @RequestParam(required = false) Double longitude,
                                 HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if session expired
        }

        try {
            String mediaPath = null;
            if (file != null && !file.isEmpty()) {
                mediaPath = fileUploadService.saveFile(file);
            }

            incident.setUser(user);
            // Purpose: store GPS coordinates for admin heatmap.
            if (latitude != null)  incident.setLatitude(latitude);
            if (longitude != null) incident.setLongitude(longitude);
            incidentService.reportIncident(incident, mediaPath, user);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/incidents/listForUser";
    }
    
    @RequestMapping(value = "/report1", method = RequestMethod.GET)
    public String showReportForm1(Model model) {
        model.addAttribute("incident", new Incident());
        return "reportIncident1";
    }
    
    @RequestMapping(value = "/report1", method = RequestMethod.POST)
    public String reportIncident1(@ModelAttribute Incident incident,
                                 @RequestParam(value = "file", required = false) MultipartFile file,
                                 @RequestParam(required = false) Double latitude,
                                 @RequestParam(required = false) Double longitude,
                                 HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if session expired
        }

        try {
            String mediaPath = null;
            if (file != null && !file.isEmpty()) {
                mediaPath = fileUploadService.saveFile(file);
            }

            incident.setUser(user);
            if (latitude != null)  incident.setLatitude(latitude);
            if (longitude != null) incident.setLongitude(longitude);
            incidentService.reportIncident(incident, mediaPath, user);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/incidents/listForUser1";
    }


	/*
	 * @RequestMapping(value = "/report", method = RequestMethod.POST) public String
	 * reportIncident(@ModelAttribute Incident incident,
	 * 
	 * @RequestParam("file") MultipartFile file, HttpSession session) { try {
	 * Volunteer volunteer = (Volunteer) session.getAttribute("volunteer"); User
	 * user = (User) session.getAttribute("user");
	 * 
	 * if (volunteer != null) { Long id = volunteer.getId();
	 * incident.setVolunteer(volunteer); incidentService.reportIncident(incident,
	 * file, id); } else if (user != null) { Long id = user.getId();
	 * incident.setUser(user); incidentService.reportIncident(incident, file, id); }
	 * } catch (IOException e) { e.printStackTrace(); } return
	 * "redirect:/incidents/userReportedIncidents"; }
	 */
    

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String viewIncidents(Model model) {
        List<Incident> incidents = incidentService.getAllIncidents();
        model.addAttribute("incidents", incidents);
        return "incidentList";
    }

    @RequestMapping(value = "/listForUser", method = RequestMethod.GET)
    public String viewIncidentsForUser(Model model) {
        List<Incident> incidents = incidentService.getAllIncidents();
        model.addAttribute("incidents", incidents);
        return "incidentListForUser";
    }

    // Lightweight endpoint for near real-time refresh checks
    @GetMapping("/listForUser.meta")
    @ResponseBody
    public java.util.Map<String, Object> incidentsListMeta() {
        List<Incident> incidents = incidentService.getAllIncidents();

        StringBuilder sb = new StringBuilder();
        for (Incident i : incidents) {
            sb.append(i.getId()).append('|');
            if (i.getStatus() != null) sb.append(i.getStatus().name());
            sb.append(';');
        }

        java.util.Map<String, Object> res = new java.util.HashMap<>();
        res.put("count", incidents.size());
        res.put("signature", sb.toString());
        return res;
    }
    @RequestMapping(value = "/listForUser1", method = RequestMethod.GET)
    public String viewIncidentsForUser1(Model model) {
        List<Incident> incidents = incidentService.getAllIncidents();
        model.addAttribute("incidents", incidents);
        return "incidentListForUser1";
    }
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String updateIncidentStatus(@PathVariable Long id,
                                       @RequestParam("status") String status) {
        incidentService.updateIncidentStatus(id, IncidentStatus.valueOf(status));
        return "redirect:/incidents/list";
    }

	/*
	 * @RequestMapping(value = "/media/{fileName}", method = RequestMethod.GET)
	 * public void getMedia(@PathVariable String fileName, HttpServletResponse
	 * response) throws IOException { Path filePath =
	 * Paths.get(MEDIA_DIRECTORY).resolve(fileName).normalize(); File file =
	 * filePath.toFile();
	 * 
	 * if (!file.exists()) { response.sendError(HttpServletResponse.SC_NOT_FOUND);
	 * return; }
	 * 
	 * String mimeType = Files.probeContentType(filePath); if (mimeType == null) {
	 * mimeType = "video/mp4"; }
	 * 
	 * response.setContentType(mimeType); response.setHeader("Accept-Ranges",
	 * "bytes"); response.setHeader("Content-Disposition", "inline; filename=\"" +
	 * fileName + "\"");
	 * 
	 * Files.copy(filePath, response.getOutputStream());
	 * response.getOutputStream().flush(); }
	 */
    
    @RequestMapping(value = "/media/{fileName}", method = RequestMethod.GET)
    public void getMedia(@PathVariable String fileName, HttpServletResponse response) throws IOException {
        // Get the real path to uploads directory (now using permanent directory)
        String uploadDir = System.getProperty("user.dir") + File.separator + "uploads";
        Path filePath = Paths.get(uploadDir).resolve(fileName).normalize();
        File file = filePath.toFile();

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Determine MIME type
        String mimeType = Files.probeContentType(filePath);
        if (mimeType == null) {
            mimeType = "application/octet-stream"; // fallback
        }

        // Set response headers
        response.setContentType(mimeType);
        response.setHeader("Accept-Ranges", "bytes");
        response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");

        // Stream file to client
        Files.copy(filePath, response.getOutputStream());
        response.getOutputStream().flush();
    }

    @RequestMapping(value = "/userReportedIncidents", method = RequestMethod.GET)
    public String showUserIncidents(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("user");

        if (currentUser != null) {
            List<Incident> incidents = incidentService.getIncidentsByUser(currentUser);
            model.addAttribute("incidents", incidents);
        }

        return "userIncidents";
    }

    @RequestMapping(value = "/incidentUpdate/{id}", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Optional<Incident> incident = incidentService.getIncidentById(id);
        if (incident.isPresent()) {
            model.addAttribute("incident", incident.get());
            return "editIncident";
        }
        return "redirect:/incidents/userReportedIncidents";
    }
    @RequestMapping(value = "/incidentUpdate/{id}", method = RequestMethod.POST)
    public String updateIncident(@PathVariable Long id,
                                 @ModelAttribute Incident updatedIncident,
                                 @RequestParam("file") MultipartFile file) {
        try {
            String mediaPath = fileUploadService.saveFile(file);
            incidentService.updateIncident(id, updatedIncident, mediaPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/incidents/userReportedIncidents";
    }

	/*
	 * @RequestMapping(value = "/incidentUpdate/{id}", method = RequestMethod.POST)
	 * public String updateIncident(@PathVariable Long id,
	 * 
	 * @ModelAttribute Incident updatedIncident,
	 * 
	 * @RequestParam("file") MultipartFile file) { try {
	 * incidentService.updateIncident(id, updatedIncident, file); } catch
	 * (IOException e) { e.printStackTrace(); } return
	 * "redirect:/incidents/userReportedIncidents"; }
	 */

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteIncident(@PathVariable Long id) {
        incidentService.deleteIncident(id);
        return "redirect:/incidents/userReportedIncidents";
    }

    @GetMapping(value = "/heatmap.json", produces = "application/json")
    @ResponseBody
    public List<java.util.Map<String, Object>> heatmapData() {
        List<java.util.Map<String, Object>> result = new java.util.ArrayList<>();
        for (Incident incident : incidentService.getAllIncidents()) {
            if (incident.getLatitude() != null && incident.getLongitude() != null) {
                java.util.Map<String, Object> point = new java.util.HashMap<>();
                point.put("id",          incident.getId());
                point.put("lat",         incident.getLatitude());
                point.put("lng",         incident.getLongitude());
                point.put("type",        incident.getType());
                point.put("location",    incident.getLocation());
                point.put("description", incident.getDescription());
                point.put("status",      incident.getStatus() != null ? incident.getStatus().name() : "PENDING");
                point.put("reportedAt",  incident.getReportedAt() != null ? incident.getReportedAt().toString() : "");
                point.put("source",      "INCIDENT");
                result.add(point);
            }
        }

        // Include Verified Danger Points (Community Safety Markers)
        for (in.sp.main.Entities.DangerPoint dp : dangerPointRepository.findByVerified(true)) {
            java.util.Map<String, Object> point = new java.util.HashMap<>();
            point.put("id",          dp.getId());
            point.put("lat",         dp.getLatitude());
            point.put("lng",         dp.getLongitude());
            point.put("type",        dp.getCategory() != null ? dp.getCategory().toUpperCase() : "DANGER_POINT");
            point.put("location",    dp.getLocationName() != null ? dp.getLocationName() : "Verified Danger Point");
            point.put("description", dp.getNote());
            point.put("status",      "VERIFIED");
            point.put("reportedAt",  dp.getCreatedAt() != null ? dp.getCreatedAt().toString() : "");
            point.put("source",      "DANGER_POINT");
            result.add(point);
        }
        return result;
    }
}
