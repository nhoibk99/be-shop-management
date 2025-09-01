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
                .requestMatchers("/api/v1/auth/**").permitAll()
                
                // Product endpoints - public read access, admin/staff write access
                .requestMatchers("GET", "/api/v1/products/**").permitAll()
                .requestMatchers("POST", "/api/v1/products/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("PUT", "/api/v1/products/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("DELETE", "/api/v1/products/**").hasRole("ADMIN")
                
                // Category endpoints - public read access, admin write access
                .requestMatchers("GET", "/api/v1/categories/**").permitAll()
                .requestMatchers("POST", "/api/v1/categories/**").hasRole("ADMIN")
                .requestMatchers("PUT", "/api/v1/categories/**").hasRole("ADMIN")
                .requestMatchers("DELETE", "/api/v1/categories/**").hasRole("ADMIN")
                
                // Order endpoints - authenticated users can create/view their own, admin/staff can manage all
                .requestMatchers("GET", "/api/v1/orders/**").authenticated()
                .requestMatchers("POST", "/api/v1/orders/**").authenticated()
                .requestMatchers("PUT", "/api/v1/orders/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("DELETE", "/api/v1/orders/**").hasRole("ADMIN")
                
                // User management - admin only
                .requestMatchers("/api/v1/users/**").hasRole("ADMIN")
                
                // Inventory management - admin/staff only
                .requestMatchers("/api/v1/inventory/**").hasAnyRole("ADMIN", "STAFF")
                
                // Admin dashboard - admin only
                .requestMatchers("/api/v1/admin/**").hasRole("ADMIN")
                
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
