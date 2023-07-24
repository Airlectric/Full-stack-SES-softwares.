package com.lab2.lab_two.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lab2.lab_two.model.LoginResponseDTO;
import com.lab2.lab_two.model.RegisterRequest;
import com.lab2.lab_two.model.User;
import com.lab2.lab_two.model.UserUpdateRequest;
import com.lab2.lab_two.service.UserService;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public ResponseEntity<?> loginUser(@RequestBody LoginRequest loginRequest) {
        try {
            User user = userService.validateUserCredentials(loginRequest.getSchoolId(), loginRequest.getPassword());

            if (user != null) {
                // Authentication successful
                String authToken = generateAuthToken();

                // Create the LoginResponseDTO and set the authToken and user information
                LoginResponseDTO responseDTO = new LoginResponseDTO();
                responseDTO.setAuthToken(authToken);
                responseDTO.setUser(user.toDTO());

                return ResponseEntity.ok().body(responseDTO);
            } else {
                // Authentication failed
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
            }
        } catch (Exception e) {
            // Handle any exception that may occur during the login process
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred");
        }
    }

    @GetMapping("/me")
    public ResponseEntity<?> getCurrentUser() {
        try {
            // Get the currently authenticated user
            User currentUser = userService.getCurrentUser();
            
            if (currentUser != null) {
                // Return the user data
                return ResponseEntity.ok().body(currentUser);
            } else {
                // No authenticated user found
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("No authenticated user found");
            }
        } catch (Exception e) {
            // Handle any exception that may occur during user retrieval
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while retrieving user");
        }
    }

    private String generateAuthToken() {
        return UUID.randomUUID().toString();
    }

    // Other methods for user registration, retrieval, and management can be added here
    // ...

    // Example method for user registration
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody RegisterRequest registerRequest) {
        try {
            // Perform user registration logic
            // ...
            
            return ResponseEntity.ok().body("User registered successfully!");
        } catch (Exception e) {
            // Handle any exception that may occur during the registration process
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred during user registration");
        }
    }

    // Example method for user retrieval
    @GetMapping("/{userId}")
    public ResponseEntity<?> getUser(@PathVariable Long userId) {
        try {
            // Retrieve user by ID
            User user = userService.getUser(userId);
            
            if (user != null) {
                return ResponseEntity.ok().body(user);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            // Handle any exception that may occur during user retrieval
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while retrieving user");
        }
    }

    // Example method for user management
    @PutMapping("/{userId}")
    public ResponseEntity<?> updateUser(@PathVariable Long userId, @RequestBody UserUpdateRequest updateRequest) {
        try {
            // Perform user update logic
            // ...
            
            return ResponseEntity.ok().body("User updated successfully!");
        } catch (Exception e) {
            // Handle any exception that may occur during user update
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred during user update");
        }
    }
}


