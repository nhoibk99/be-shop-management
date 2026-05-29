package com.shopmanagement.service;

import com.shopmanagement.dto.UserDto;
import com.shopmanagement.entity.AuthProvider;
import com.shopmanagement.entity.Role;
import com.shopmanagement.entity.User;
import com.shopmanagement.repository.UserRepository;
import com.shopmanagement.security.oauth2.OAuth2UserInfo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
    }

    public User createUser(UserDto userDto) {
        User user = User.builder()
                .username(userDto.getUsername())
                .password(passwordEncoder.encode(userDto.getPassword()))
                .email(userDto.getEmail())
                .role(userDto.getRole() != null ? userDto.getRole() : Role.CUSTOMER)
                .provider(AuthProvider.LOCAL)
                .build();

        return userRepository.save(user);
    }

    public UserDto updateUser(Long id, UserDto userDto) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));

        user.setUsername(userDto.getUsername());
        if (userDto.getPassword() != null && !userDto.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        }
        user.setEmail(userDto.getEmail());
        if (userDto.getRole() != null) {
            user.setRole(userDto.getRole());
        }

        User savedUser = userRepository.save(user);
        return convertToDto(savedUser);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public List<UserDto> getAllUsers() {
        return userRepository.findAll().stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    public UserDto getUserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return convertToDto(user);
    }

    @Transactional
    public User findOrCreateOAuth2User(AuthProvider provider, OAuth2UserInfo info) {
        return userRepository.findByProviderAndProviderId(provider, info.getId())
                .map(u -> updateProfile(u, info))
                .or(() -> userRepository.findByEmail(info.getEmail())
                        .map(existing -> linkAccount(existing, provider, info)))
                .orElseGet(() -> createOAuth2User(provider, info));
    }

    private User updateProfile(User u, OAuth2UserInfo info) {
        u.setAvatarUrl(info.getImageUrl());
        return userRepository.save(u);
    }

    private User linkAccount(User u, AuthProvider provider, OAuth2UserInfo info) {
        u.setProvider(provider);
        u.setProviderId(info.getId());
        u.setAvatarUrl(info.getImageUrl());
        return userRepository.save(u);
    }

    private User createOAuth2User(AuthProvider provider, OAuth2UserInfo info) {
        String username = generateUniqueUsername(info.getEmail());
        User u = User.builder()
                .username(username)
                .email(info.getEmail())
                .password(null)
                .role(Role.CUSTOMER)
                .provider(provider)
                .providerId(info.getId())
                .avatarUrl(info.getImageUrl())
                .build();
        return userRepository.save(u);
    }

    private String generateUniqueUsername(String email) {
        String base = email.split("@")[0];
        String candidate = base;
        int suffix = 1;
        while (userRepository.existsByUsername(candidate)) {
            candidate = base + "_" + suffix++;
        }
        return candidate;
    }

    public UserDto convertToDto(User user) {
        return UserDto.builder()
                .id(user.getId())
                .username(user.getUsername())
                .email(user.getEmail())
                .role(user.getRole())
                .provider(user.getProvider())
                .avatarUrl(user.getAvatarUrl())
                .createdAt(user.getCreatedAt())
                .build(); // password intentionally excluded from responses
    }

    @Transactional
    public UserDto updateUserRole(Long id, Role newRole) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found"));
        user.setRole(newRole);
        return convertToDto(userRepository.save(user));
    }
}
