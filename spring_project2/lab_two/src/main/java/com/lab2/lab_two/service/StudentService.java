package com.lab2.lab_two.service;

import com.lab2.lab_two.model.Student;
import com.lab2.lab_two.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    private final StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public Student createStudent(Student student) {
        return studentRepository.save(student);
    }

    public Student getStudent(String schoolId) {
        return studentRepository.findById(schoolId).orElse(null);
    }

    public List<Student> getAllStudents(String schoolId) {
        return studentRepository.findBySchoolId(schoolId);
    }

    public Student updateStudent(String schoolId, Student updatedStudent) {
        Student existingStudent = studentRepository.findById(schoolId).orElse(null);
        if (existingStudent != null) {
            existingStudent.setName(updatedStudent.getName());
            existingStudent.setBio(updatedStudent.getBio());
            existingStudent.setEmail(updatedStudent.getEmail());
            existingStudent.setDateOfBirth(updatedStudent.getDateOfBirth());
            existingStudent.setDepartment(updatedStudent.getDepartment());
            existingStudent.setLevel(updatedStudent.getLevel());
            existingStudent.setSemester(updatedStudent.getSemester());

            return studentRepository.save(existingStudent);
        } else {
            return null;
        }
    }

    public boolean deleteStudent(String schoolId) {
        if (studentRepository.existsById(schoolId)) {
            studentRepository.deleteById(schoolId);
            return true;
        } else {
            return false;
        }
    }
}
