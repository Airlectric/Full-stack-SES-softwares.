package com.lab2.lab_two.repository;

import com.lab2.lab_two.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Integer> {
    List<Project> findByDepartmentAndLevel(String department, String level);
}
