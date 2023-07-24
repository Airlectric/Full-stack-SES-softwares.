package com.lab2.lab_two.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab2.lab_two.model.PreviousResult;
import com.lab2.lab_two.repository.PreviousResultRepository;

@Service
public class PreviousResultService {
    private final PreviousResultRepository previousResultRepository;

    @Autowired
    public PreviousResultService(PreviousResultRepository previousResultRepository) {
        this.previousResultRepository = previousResultRepository;
    }

    public PreviousResult createPreviousResult(String studentId, String department, String level, String semester, String course, int credit, String grade) {
        PreviousResult previousResult = new PreviousResult();
        previousResult.setStudentId(studentId);
        previousResult.setDepartment(department);
        previousResult.setLevel(level);
        previousResult.setSemester(semester);
        previousResult.setCourse(course);
        previousResult.setCredit(credit);
        previousResult.setGrade(grade);
        return previousResultRepository.save(previousResult);
    }

    public PreviousResult getPreviousResult(String studentId) {
        return previousResultRepository.findById(studentId).orElse(null);
    }

    public List<PreviousResult> getPreviousResultsByStudentIdLevelAndSemester(String studentId, String level, String semester) {
        return previousResultRepository.findByStudentIdAndLevelAndSemester(studentId, level, semester);
    }
}
