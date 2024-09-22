package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller

public class ProjectController {

    private FileUtility fileUtility;
    private ProjectService projectService;

    public ProjectController(FileUtility fileUtility, ProjectService projectService) {
        this.fileUtility = fileUtility;
        this.projectService = projectService;
    }

    @GetMapping("/manager/projects")
    public String ProjectList(Model model){
        List<Project> list = projectService.getProjectList();
        model.addAttribute("projectList", list);
        return "manager/projects/projectManage";
    }

    @GetMapping("/manager/projects/{id}")
    public String PrọectDetail(@PathVariable("id") int id, Model model){
        Project project = projectService.getProjectById(id);
        Customer customer = project.getContract().getCustomer();
         model.addAttribute("project",project);
        return "manager/projects/projectDetail";
    }
}
