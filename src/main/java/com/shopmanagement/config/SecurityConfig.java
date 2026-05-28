package com.shopmanagement.config;

import com.shopmanagement.security.JwtAuthenticationFilter;
import com.shopmanagement.security.oauth2.CustomOAuth2UserService;
import com.shopmanagement.security.oauth2.CustomOidcUserService;
import com.shopmanagement.security.oauth2.OAuth2AuthenticationFailureHandler;
import com.shopmanagement.security.oauth2.OAuth2AuthenticationSuccessHandler;
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
    private final CustomOAuth2UserService customOAuth2UserService;
    private final CustomOidcUserService customOidcUserService;
    private final OAuth2AuthenticationSuccessHandler oauth2SuccessHandler;
    private final OAuth2AuthenticationFailureHandler oauth2FailureHandler;

    public SecurityConfig(JwtAuthenticationFilter jwtAuthFilter,
                          AuthenticationProvider authenticationProvider,
                          CustomOAuth2UserService customOAuth2UserService,
                          CustomOidcUserService customOidcUserService,
                          OAuth2AuthenticationSuccessHandler oauth2SuccessHandler,
                          OAuth2AuthenticationFailureHandler oauth2FailureHandler) {
        this.jwtAuthFilter = jwtAuthFilter;
        this.authenticationProvider = authenticationProvider;
        this.customOAuth2UserService = customOAuth2UserService;
        this.customOidcUserService = customOidcUserService;
        this.oauth2SuccessHandler = oauth2SuccessHandler;
        this.oauth2FailureHandler = oauth2FailureHandler;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .cors(cors -> cors.configurationSource(corsConfigurationSource()))
            .authorizeHttpRequests(auth -> auth
                // Public endpoints
                .requestMatchers("/auth/**", "/oauth2/**", "/login/oauth2/**").permitAll()

                // Product endpoints - public read access, admin/staff write access
                .requestMatchers("GET", "/products", "/products/**").permitAll()
                .requestMatchers("POST", "/products", "/products/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("PUT", "/products", "/products/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("DELETE", "/products", "/products/**").hasRole("ADMIN")

                // Category endpoints - public read access, admin write access
                .requestMatchers("GET", "/categories", "/categories/**").permitAll()
                .requestMatchers("POST", "/categories", "/categories/**").hasRole("ADMIN")
                .requestMatchers("PUT", "/categories", "/categories/**").hasRole("ADMIN")
                .requestMatchers("DELETE", "/categories", "/categories/**").hasRole("ADMIN")

                // Order endpoints - authenticated users can create/view their own, admin/staff can manage all
                .requestMatchers("GET", "/orders/**").authenticated()
                .requestMatchers("POST", "/orders/**").authenticated()
                .requestMatchers("PUT", "/orders/**").hasAnyRole("ADMIN", "STAFF")
                .requestMatchers("DELETE", "/orders/**").hasRole("ADMIN")

                // User self-profile - any authenticated user
                .requestMatchers("/users/me").authenticated()
                // User management - admin only
                .requestMatchers("/users/**").hasRole("ADMIN")

                // Inventory management - admin/staff only
                .requestMatchers("/inventory/**").hasAnyRole("ADMIN", "STAFF")

                // Admin dashboard - admin only
                .requestMatchers("/admin/**").hasRole("ADMIN")

                // Review endpoints - public read access, authenticated write access
                .requestMatchers("GET", "/reviews", "/reviews/**").permitAll()
                .requestMatchers("POST", "/reviews", "/reviews/**").authenticated()
                .requestMatchers("PUT", "/reviews", "/reviews/**").authenticated()
                .requestMatchers("DELETE", "/reviews", "/reviews/**").authenticated()

                // Any other request needs authentication
                .anyRequest().authenticated()
            )
            .sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
            )
            .authenticationProvider(authenticationProvider)
            .oauth2Login(oauth2 -> oauth2
                .authorizationEndpoint(a -> a.baseUri("/oauth2/authorization"))
                .redirectionEndpoint(r -> r.baseUri("/login/oauth2/code/*"))
                .userInfoEndpoint(u -> u
                    .userService(customOAuth2UserService)
                    .oidcUserService(customOidcUserService)
                )
                .successHandler(oauth2SuccessHandler)
                .failureHandler(oauth2FailureHandler)
            )
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
