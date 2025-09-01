package com.shopmanagement.controller;

import com.shopmanagement.dto.LoginRequest;
import com.shopmanagement.dto.RegisterRequest;
import com.shopmanagement.dto.UserDto;
import com.shopmanagement.entity.Role;
import com.shopmanagement.entity.User;
import com.shopmanagement.security.JwtService;
import com.shopmanagement.service.UserService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = "*")
public class AuthController {
    
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final UserService userService;
    
    public AuthController(AuthenticationManager authenticationManager, JwtService jwtService, UserService userService) {
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
        this.userService = userService;
    }
    
    @PostMapping("/register")
    public ResponseEntity<Map<String, Object>> register(@Valid @RequestBody RegisterRequest registerRequest) {
        // Create user with CUSTOMER role by default
        UserDto userDto = UserDto.builder()
                .username(registerRequest.getUsername())
                .password(registerRequest.getPassword())
                .email(registerRequest.getEmail())
                .role(Role.CUSTOMER)
                .build();
        
        User user = userService.createUser(userDto);
        
        // Generate JWT token for the new user
        String token = jwtService.generateToken(user);
        
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("user", userService.convertToDto(user));
        response.put("message", "User registered successfully");
        
        return ResponseEntity.ok(response);
    }
    
    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@Valid @RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword())
        );
        
        User user = (User) authentication.getPrincipal();
        String token = jwtService.generateToken(user);
        
        Map<String, Object> response = new HashMap<>();
        response.put("token", token);
        response.put("user", userService.convertToDto(user));
        response.put("message", "Login successful");
        
        return ResponseEntity.ok(response);
    }
    

}
