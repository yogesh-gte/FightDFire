package in.sp.main.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Tier-2 SOS escalation: ACTIVE alerts older than 30s with &lt;2 accepts become ESCALATED.
 */
@Component
public class SosEscalationJob {

    private static final Logger log = LoggerFactory.getLogger(SosEscalationJob.class);

    private final SosService sosService;

    public SosEscalationJob(SosService sosService) {
        this.sosService = sosService;
    }

    @Scheduled(fixedDelayString = "${sos.escalation.check-ms:15000}")
    public void checkAndEscalate() {
        int n = sosService.escalateStaleActiveSOS(30, 2);
        if (n > 0) {
            log.info("Escalated {} SOS request(s)", n);
        }
    }
}
