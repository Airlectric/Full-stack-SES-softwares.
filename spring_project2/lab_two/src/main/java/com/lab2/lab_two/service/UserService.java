package com.lab2.lab_two.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.lab2.lab_two.model.User;
import com.lab2.lab_two.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User validateUserCredentials(String schoolId, String password) {
        User user = userRepository.findBySchoolId(schoolId);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public User getUser(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }

public User getCurrentUser() {
    ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
    if (requestAttributes != null) {
        HttpServletRequest request = requestAttributes.getRequest();
        HttpSession session = request.getSession(false);
        if (session != null) {
            String schoolId = (String) session.getAttribute("schoolId");
            if (schoolId != null) {
                return userRepository.findBySchoolId(schoolId);
            }
        }
    }
    return null;
}
    
}
