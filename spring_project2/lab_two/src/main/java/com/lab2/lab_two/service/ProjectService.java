package com.lab2.lab_two.service;

import com.lab2.lab_two.model.Project;
import com.lab2.lab_two.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProjectService {
    private final ProjectRepository projectRepository;

    @Autowired
    public ProjectService(ProjectRepository projectRepository) {
        this.projectRepository = projectRepository;
    }

    public Project createProject(String department, String level, String title, Date deadline) {
        Project project = new Project();
        project.setDepartment(department);
        project.setLevel(level);
        project.setTitle(title);
        project.setDeadline(deadline);
        return projectRepository.save(project);
    }

    public Project getProject(int id) {
        return projectRepository.findById(id).orElse(null);
    }

    public List<Project> getProjectsByDepartmentAndLevel(String department, String level) {
        return projectRepository.findByDepartmentAndLevel(department, level);
    }

    // Additional methods for updating and deleting projects can be implemented here
    // ...
}
