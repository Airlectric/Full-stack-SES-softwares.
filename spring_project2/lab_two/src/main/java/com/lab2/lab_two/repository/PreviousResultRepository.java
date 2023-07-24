package com.lab2.lab_two.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lab2.lab_two.model.PreviousResult;

@Repository
public interface PreviousResultRepository extends JpaRepository<PreviousResult, String> {
    List<PreviousResult> findByStudentIdAndLevelAndSemester(String studentId, String level, String semester);
}
