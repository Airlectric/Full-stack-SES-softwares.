package com.lab2.lab_two.repository;

import com.lab2.lab_two.model.EnrolledCourse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnrolledCourseRepository extends JpaRepository<EnrolledCourse, Integer> {
    List<EnrolledCourse> findByDepartmentAndLevel(String department, String level);
}
