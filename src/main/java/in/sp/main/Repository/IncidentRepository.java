package in.sp.main.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sp.main.Entities.Incident;
import in.sp.main.Entities.User;

@Repository
public interface IncidentRepository extends JpaRepository<Incident, Long> {
	
	 List<Incident> findByUser(User user);
}

