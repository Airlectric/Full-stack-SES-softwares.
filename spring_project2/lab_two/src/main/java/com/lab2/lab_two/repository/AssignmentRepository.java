package com.lab2.lab_two.repository;

import com.lab2.lab_two.model.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssignmentRepository extends JpaRepository<Assignment, Integer> {
    List<Assignment> findByDepartmentAndLevel(String department, String level);
}
