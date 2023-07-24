package com.lab2.lab_two.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "students")
public class Student {
    @Id
    @Column(name = "schoolId", nullable = false, unique = true)
    private String schoolId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "bio", nullable = false)
    private String bio;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "date_of_birth", nullable = false)
    private Date dateOfBirth;

    @Column(name = "department", nullable = false)
    private String department;

    @Column(name = "level", nullable = false)
    private String level;

    @Column(name = "semester", nullable = false)
    private String semester;

    // Constructors
    public Student() {
    }

    public Student(String schoolId,String name, String bio, String email, Date dateOfBirth, String department, String level,
                   String semester) {
        this.schoolId = schoolId;
        this.name = name;
        this.bio = bio;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.department = department;
        this.level = level;
        this.semester = semester;
    }

    // Getters and setters
    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    // Other necessary methods (e.g., toString, equals, hashCode)
    // ...
}

