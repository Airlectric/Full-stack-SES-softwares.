package com.lab2.lab_two.controller;

import com.lab2.lab_two.model.Project;
import com.lab2.lab_two.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/projects")
@CrossOrigin(origins = "*")
public class ProjectController {
    private final ProjectService projectService;

    @Autowired
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @PostMapping
    public ResponseEntity<Project> createProject(@RequestBody Project project) {
        final Project createdProject = projectService.createProject(project.getDepartment(), project.getLevel(), project.getTitle(), project.getDeadline());
        return new ResponseEntity<>(createdProject, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Project> getProject(@PathVariable("id") int id) {
        Project project = projectService.getProject(id);
        if (project != null) {
            return new ResponseEntity<>(project, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping
    public ResponseEntity<List<Project>> getProjectsByDepartmentAndLevel(@RequestParam("department") String department, @RequestParam("level") String level) {
        List<Project> projects = projectService.getProjectsByDepartmentAndLevel(department, level);
        return ResponseEntity.ok(projects);
    }

    // Additional methods for updating and deleting projects can be implemented here
    // ...
}
