package com.lab2.lab_two.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.lab2.lab_two.model.PreviousResult;
import com.lab2.lab_two.service.PreviousResultService;

import java.util.List;

@RestController
@RequestMapping("/api/previous-results")
@CrossOrigin(origins = "*")
public class PreviousResultController {
    private final PreviousResultService previousResultService;

    @Autowired
    public PreviousResultController(PreviousResultService previousResultService) {
        this.previousResultService = previousResultService;
    }

    @PostMapping
    public ResponseEntity<PreviousResult> createPreviousResult(@RequestBody PreviousResult previousResult) {
        final PreviousResult createdPreviousResult = previousResultService.createPreviousResult(
                previousResult.getStudentId(),
                previousResult.getDepartment(),
                previousResult.getLevel(),
                previousResult.getSemester(),
                previousResult.getCourse(),
                previousResult.getCredit(),
                previousResult.getGrade()
        );
        return new ResponseEntity<>(createdPreviousResult, HttpStatus.CREATED);
    }

    @GetMapping("/{studentId}")
    public ResponseEntity<PreviousResult> getPreviousResult(@PathVariable("studentId") String studentId) {
        PreviousResult previousResult = previousResultService.getPreviousResult(studentId);
        if (previousResult != null) {
            return new ResponseEntity<>(previousResult, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<PreviousResult>> getPreviousResultsByStudentIdLevelAndSemester(
            @RequestParam("studentId") String studentId,
            @RequestParam("level") String level,
            @RequestParam("semester") String semester
    ) {
        List<PreviousResult> previousResults = previousResultService.getPreviousResultsByStudentIdLevelAndSemester(studentId, level, semester);
        return ResponseEntity.ok(previousResults);
    }

    // Additional methods for updating and deleting previous results can be implemented here
    // ...
}
