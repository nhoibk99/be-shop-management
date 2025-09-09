package com.shopmanagement.config;

import com.shopmanagement.security.JwtAuthenticationFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
    
    private final JwtAuthenticationFilter jwtAuthFilter;
    private final AuthenticationProvider authenticationProvider;
    
    public SecurityConfig(JwtAuthenticationFilter jwtAuthFilter, AuthenticationProvider authenticationProvider) {
        this.jwtAuthFilter = jwtAuthFilter;
        this.authenticationProvider = authenticationProvider;
    }
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .cors(cors -> cors.configurationSource(corsConfigurationSource()))
            .authorizeHttpRequests(auth -> auth
                // Public endpoints
                .requestMatchers("/auth/**").permitAll()
                
                // Product endpoints - public read access, admin/staff write access
                .requestMatchers("GET", "/products/**").permitAll()
                .requestMatchers("POST", "/products/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("PUT", "/products/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("DELETE", "/products/**").hasRole("ADMIN")
                
                // Category endpoints - public read access, admin write access
                .requestMatchers("GET", "/categories/**").permitAll()
                .requestMatchers("POST", "/categories/**").hasRole("ADMIN")
                .requestMatchers("PUT", "/categories/**").hasRole("ADMIN")
                .requestMatchers("DELETE", "/categories/**").hasRole("ADMIN")
                
                // Order endpoints - authenticated users can create/view their own, admin/staff can manage all
                .requestMatchers("GET", "/orders/**").authenticated()
                .requestMatchers("POST", "/orders/**").authenticated()
                .requestMatchers("PUT", "/orders/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("DELETE", "/orders/**").hasRole("ADMIN")
                
                // User management - admin only
                .requestMatchers("/users/**").hasRole("ADMIN")
                
                // Inventory management - admin/staff only
                .requestMatchers("/inventory/**").hasAnyRole("ADMIN", "STAFF")
                
                // Admin dashboard - admin only
                .requestMatchers("/admin/**").hasRole("ADMIN")
                
                // Review endpoints - public read access, authenticated write access
                .requestMatchers("GET", "/reviews/**").permitAll()
                .requestMatchers("POST", "/reviews/**").authenticated()
                .requestMatchers("PUT", "/reviews/**").authenticated()
                .requestMatchers("DELETE", "/reviews/**").authenticated()
                
                // Any other request needs authentication
                .anyRequest().authenticated()
            )
            .sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            )
            .authenticationProvider(authenticationProvider)
            .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);
        
        return http.build();
    }
    
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOriginPatterns(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
