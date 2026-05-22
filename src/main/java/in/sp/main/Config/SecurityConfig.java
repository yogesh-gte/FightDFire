package in.sp.main.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    /**
     * Paths that must stay public (session-based login is handled in controllers, not Spring Security).
     */
    private static final String[] PUBLIC_URLS = {
            "/",
            "/index.html",
            "/heatmap",
            "/login",
            "/login/**",
            "/auth/**",
            "/users/register",
            "/users/register/**",
            "/admin/loginAdmin",
            "/admin/registerAdmin",
            "/centres/**",
            "/doctors/login",
            "/doctors/register",
            "/doctors/register/**",
            "/salons/login",
            "/salons/register",
            "/salons/register/**",
            "/stylists/login",
            "/stylists/register",
            "/stylists/register/**",
            "/marketplace/provider/login",
            "/marketplace/provider/register",
            "/marketplace/provider/register/**",
            "/assets/**",
            "/css/**",
            "/js/**",
            "/images/**",
            "/uploads/**",
            "/ws-chat/**",
            "/ws-sos/**",
            "/error"
    };

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .securityMatcher("/**")
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(PUBLIC_URLS).permitAll()
                .anyRequest().permitAll())
            // Prevent Spring Security from redirecting unauthenticated users to /login
            .formLogin(AbstractHttpConfigurer::disable)
            .httpBasic(AbstractHttpConfigurer::disable)
            .logout(AbstractHttpConfigurer::disable)
            .csrf(AbstractHttpConfigurer::disable);
        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
