package com.lab2.lab_two.repository;

import com.lab2.lab_two.model.Registration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegistrationRepository extends JpaRepository<Registration, Long> {
    List<Registration> findBySchoolId(String schoolId);
}
