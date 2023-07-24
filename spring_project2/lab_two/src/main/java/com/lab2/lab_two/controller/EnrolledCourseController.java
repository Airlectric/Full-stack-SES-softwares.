package com.lab2.lab_two.controller;

import com.lab2.lab_two.model.EnrolledCourse;
import com.lab2.lab_two.service.EnrolledCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/enrolled-courses")
@CrossOrigin(origins = "*")
public class EnrolledCourseController {
    private final EnrolledCourseService enrolledCourseService;

    @Autowired
    public EnrolledCourseController(EnrolledCourseService enrolledCourseService) {
        this.enrolledCourseService = enrolledCourseService;
    }

    @PostMapping
    public ResponseEntity<EnrolledCourse> createEnrolledCourse(@RequestBody EnrolledCourse enrolledCourse) {
        final EnrolledCourse createdEnrolledCourse = enrolledCourseService.createEnrolledCourse(enrolledCourse.getStudentId(),
                enrolledCourse.getDepartment(), enrolledCourse.getLevel(), enrolledCourse.getName(), enrolledCourse.getCredit());
        return new ResponseEntity<>(createdEnrolledCourse, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<EnrolledCourse> getEnrolledCourse(@PathVariable("id") int id) {
        EnrolledCourse enrolledCourse = enrolledCourseService.getEnrolledCourse(id);
        if (enrolledCourse != null) {
            return new ResponseEntity<>(enrolledCourse, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<EnrolledCourse>> getEnrolledCoursesByDepartmentAndLevel(
            @RequestParam("department") String department, @RequestParam("level") String level) {
        List<EnrolledCourse> enrolledCourses = enrolledCourseService.getEnrolledCoursesByDepartmentAndLevel(department, level);
        return ResponseEntity.ok(enrolledCourses);
    }

    // Additional methods for updating and deleting enrolled courses can be implemented here
    // ...
}
