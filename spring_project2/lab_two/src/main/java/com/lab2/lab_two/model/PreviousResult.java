package com.lab2.lab_two.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "previous_results")
public class PreviousResult {
    @Id
    @Column(name = "student_id")
    private String studentId;

    @Column(name = "department", nullable = false)
    private String department;

    @Column(name = "level", nullable = false)
    private String level;

    @Column(name = "semester", nullable = false)
    private String semester;

    @Column(name = "course", nullable = false)
    private String course;

    @Column(name = "credit", nullable = false)
    private int credit;

    @Column(name = "grade", nullable = false)
    private String grade;

 
    // Constructors
    public PreviousResult() {
    }

    public PreviousResult(String studentId,String department, String level,String semester, String course, int credit, String grade) {
        this.studentId = studentId;
        this.department = department;
        this.level = level;
        this.semester = semester;
        this.course = course;
        this.credit = credit;
        this.grade = grade;
    }

    // Getters and setters
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

     public String getDepartment() {
        return department;
    }

    public void setDepartment(String department){
        this.department= department;
    }

    public String getLevel(){
        return level;
    }

    public void setLevel(String level){
        this.level = level;
    }

     public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    // Other necessary methods (e.g., toString, equals, hashCode)
    // ...
}
