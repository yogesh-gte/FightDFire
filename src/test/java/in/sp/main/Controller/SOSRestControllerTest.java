package in.sp.main.Controller;

import in.sp.main.Entities.User;
import in.sp.main.Service.SosService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Map;

import static org.mockito.ArgumentMatchers.anyDouble;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(MockitoExtension.class)
class SOSRestControllerTest {

    private MockMvc mockMvc;

    @Mock
    private SosService sosService;

    @InjectMocks
    private SOSRestController controller;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }

    @Test
    void triggerRequiresLogin() throws Exception {
        mockMvc.perform(post("/api/sos/trigger")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"latitude\":\"12.9\",\"longitude\":\"77.6\"}"))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.success").value(false));
    }

    @Test
    void triggerDelegatesToSosServiceWhenLoggedIn() throws Exception {
        User user = new User();
        user.setId(7L);
        MockHttpSession session = new MockHttpSession();
        session.setAttribute("user", user);

        when(sosService.triggerSOS(eq(7L), anyDouble(), anyDouble()))
                .thenReturn(Map.of("sosId", 99L, "message", "ok"));

        mockMvc.perform(post("/api/sos/trigger")
                        .session(session)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"latitude\":\"12.9\",\"longitude\":\"77.6\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.sosId").value(99));
    }
}
