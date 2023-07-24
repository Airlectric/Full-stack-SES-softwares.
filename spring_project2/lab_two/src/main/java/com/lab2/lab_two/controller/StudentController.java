package com.lab2.lab_two.controller;

import com.lab2.lab_two.model.Student;
import com.lab2.lab_two.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/students")
@CrossOrigin(origins = "*")
public class StudentController {
    private final StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @PostMapping
    public ResponseEntity<Student> createStudent(@RequestBody Student student) {
        Student createdStudent = studentService.createStudent(student);
        return new ResponseEntity<>(createdStudent, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Student>> getStudents(@RequestParam String schoolId) {
        List<Student> students = studentService.getAllStudents(schoolId);
        return ResponseEntity.ok(students);
    }

    @GetMapping("/{schoolId}")
    public ResponseEntity<Student> getStudent(@PathVariable String schoolId) {
        Student student = studentService.getStudent(schoolId);
        if (student != null) {
            return new ResponseEntity<>(student, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{schoolId}")
    public ResponseEntity<Student> updateStudent(@PathVariable("schoolId") String schoolId, @RequestBody Student student) {
        Student updatedStudent = studentService.updateStudent(schoolId, student);
        if (updatedStudent != null) {
            return new ResponseEntity<>(updatedStudent, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{schoolId}")
    public ResponseEntity<Void> deleteStudent(@PathVariable("schoolId") String schoolId) {
        boolean deleted = studentService.deleteStudent(schoolId);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
