package in.sp.main.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.Incident;
import in.sp.main.Entities.IncidentStatus;
import in.sp.main.Entities.User;
import in.sp.main.Repository.*;
import in.sp.main.Repository.UserRepository;
import jakarta.servlet.ServletContext;

@Service
public class IncidentService {

    @Autowired
    private IncidentRepository incidentRepository;
	 @Autowired
	    private ServletContext servletContext;
	   @Autowired
	    private UserRepository userRepository; // To get the user details

	   
	   public Incident reportIncident(Incident incident, String mediaPath, Long id) {
		    if (mediaPath != null) {
		        incident.setMediaPath(mediaPath);
		    }
		    incident.setStatus(IncidentStatus.PENDING);

		    // Fetch user by id
		    Optional<User> userOpt = userRepository.findById(id);
		    if (userOpt.isPresent()) {
		        incident.setUser(userOpt.get());
		    }

		    return incidentRepository.save(incident);
		}
	   public Incident reportIncident(Incident incident, String mediaPath, User user) {
	        if (mediaPath != null) incident.setMediaPath(mediaPath);
	        incident.setUser(user);
	        incident.setStatus(IncidentStatus.PENDING);
	        return incidentRepository.save(incident);
	    }

	   //report incident for admin or volunteer 
		/*
		 * public Incident reportIncident(Incident incident, MultipartFile file,Long id)
		 * throws IOException { if (!file.isEmpty()) { // Get the real path of 'uploads'
		 * inside webapp String uploadDir = servletContext.getRealPath("/uploads/");
		 * 
		 * // Ensure the directory exists File uploadFolder = new File(uploadDir); if
		 * (!uploadFolder.exists()) { uploadFolder.mkdirs(); }
		 * 
		 * // Define the file path String fileName = file.getOriginalFilename(); String
		 * filePath = uploadDir + File.separator + fileName;
		 * 
		 * // Save the file file.transferTo(new File(filePath));
		 * 
		 * // Set relative media path (for accessing from frontend)
		 * incident.setMediaPath("/uploads/" + fileName); }
		 * 
		 * incident.setStatus(IncidentStatus.PENDING); return
		 * incidentRepository.save(incident); }
		 */
	   
	    // Report incident with file upload for user
		/*
		 * public Incident reportIncident(Incident incident, MultipartFile file, User
		 * user) throws IOException { if (!file.isEmpty()) { // Get the real path of
		 * 'uploads' inside webapp String uploadDir =
		 * servletContext.getRealPath("/uploads/");
		 * 
		 * // Ensure the directory exists File uploadFolder = new File(uploadDir); if
		 * (!uploadFolder.exists()) { uploadFolder.mkdirs(); }
		 * 
		 * // Define the file path String fileName = file.getOriginalFilename(); String
		 * filePath = uploadDir + File.separator + fileName;
		 * 
		 * // Save the file file.transferTo(new File(filePath));
		 * 
		 * // Set relative media path (for accessing from frontend)
		 * incident.setMediaPath("/uploads/" + fileName); }
		 * 
		 * incident.setStatus(IncidentStatus.PENDING); incident.setUser(user); // Set
		 * the user who reported the incident return incidentRepository.save(incident);
		 * }
		 */
	 // Fetch incidents for a specific user
	    public List<Incident> getIncidentsByUser(User user) {
	        return incidentRepository.findByUser(user); // Custom query to get incidents by user
	    }

    public List<Incident> getAllIncidents() {
        return incidentRepository.findAll();
    }

    public Optional<Incident> getIncidentById(Long id) {
        return incidentRepository.findById(id);
    }

    public Incident updateIncidentStatus(Long id, IncidentStatus status) {
        Optional<Incident> optionalIncident = incidentRepository.findById(id);
        if (optionalIncident.isPresent()) {
            Incident incident = optionalIncident.get();
            incident.setStatus(status);
            return incidentRepository.save(incident);
        }
        return null;
    }
    // Update entire incident
	/*
	 * public Incident updateIncident(Long id, Incident updatedIncident,
	 * MultipartFile file) throws IOException { Optional<Incident> existingIncident
	 * = incidentRepository.findById(id);
	 * 
	 * if (existingIncident.isPresent()) { Incident incident =
	 * existingIncident.get();
	 * 
	 * // Update the incident's fields incident.setType(updatedIncident.getType());
	 * incident.setLocation(updatedIncident.getLocation());
	 * incident.setDescription(updatedIncident.getDescription());
	 * 
	 * if (!file.isEmpty()) { // If a new file is uploaded, save the new file and
	 * update the mediaPath String uploadDir =
	 * servletContext.getRealPath("/uploads/"); File uploadFolder = new
	 * File(uploadDir); if (!uploadFolder.exists()) { uploadFolder.mkdirs(); }
	 * 
	 * String fileName = file.getOriginalFilename(); String filePath = uploadDir +
	 * File.separator + fileName; file.transferTo(new File(filePath));
	 * 
	 * incident.setMediaPath("/uploads/" + fileName); // Set new file path }
	 * 
	 * return incidentRepository.save(incident); // Save the updated incident }
	 * 
	 * return null; // Incident not found }
	 */
    public Incident updateIncident(Long id, Incident updatedIncident, String mediaPath) {
        return incidentRepository.findById(id).map(incident -> {
            incident.setType(updatedIncident.getType());
            incident.setLocation(updatedIncident.getLocation());
            incident.setDescription(updatedIncident.getDescription());
            if (mediaPath != null) incident.setMediaPath(mediaPath);
            return incidentRepository.save(incident);
        }).orElse(null);
    }
    // Delete incident
    public void deleteIncident(Long id) {
        incidentRepository.deleteById(id);
    }
}

