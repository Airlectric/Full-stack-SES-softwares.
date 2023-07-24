package com.lab2.lab_two.repository;

import com.lab2.lab_two.model.Student;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StudentRepository extends CrudRepository<Student, String> {
    List<Student> findBySchoolId(String schoolId);
}
