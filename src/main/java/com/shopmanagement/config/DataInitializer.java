package com.shopmanagement.config;

import com.shopmanagement.entity.Category;
import com.shopmanagement.entity.Role;
import com.shopmanagement.entity.User;
import com.shopmanagement.repository.CategoryRepository;
import com.shopmanagement.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {
    
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;
    private final PasswordEncoder passwordEncoder;
    
    public DataInitializer(UserRepository userRepository, CategoryRepository categoryRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.categoryRepository = categoryRepository;
        this.passwordEncoder = passwordEncoder;
    }
    
    @Override
    public void run(String... args) throws Exception {
        // Create default admin user if not exists
        if (!userRepository.existsByUsername("admin")) {
            User adminUser = User.builder()
                    .username("admin")
                    .password(passwordEncoder.encode("admin123"))
                    .email("admin@shop.com")
                    .role(Role.ADMIN)
                    .build();
            userRepository.save(adminUser);
        }
        
        // Create default staff user if not exists
        if (!userRepository.existsByUsername("staff")) {
            User staffUser = User.builder()
                    .username("staff")
                    .password(passwordEncoder.encode("staff123"))
                    .email("staff@shop.com")
                    .role(Role.STAFF)
                    .build();
            userRepository.save(staffUser);
        }
        
        // Create default categories if not exist
        if (categoryRepository.count() == 0) {
            Category electronics = Category.builder().name("Electronics").build();
            Category clothing = Category.builder().name("Clothing").build();
            Category books = Category.builder().name("Books").build();
            Category home = Category.builder().name("Home & Garden").build();
            
            categoryRepository.save(electronics);
            categoryRepository.save(clothing);
            categoryRepository.save(books);
            categoryRepository.save(home);
        }
    }
}
