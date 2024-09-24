package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.utils.FileUtility;
import com.example.SWPKoiContructor.utils.Utility;
import java.time.LocalDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class ProjectController {

    private FileUtility fileUtility;
    private ProjectService projectService;

    public ProjectController(FileUtility fileUtility, ProjectService projectService) {
        this.fileUtility = fileUtility;
        this.projectService = projectService;
    }

    @GetMapping("/manager/projects")
    public String ProjectList(Model model) {
        List<Project> list = projectService.getProjectList();
        model.addAttribute("projectList", list);
        return "manager/projects/projectManage";
    }

    @GetMapping("/manager/projects/{id}")
    public String ProjectDetail(@PathVariable("id") int id, Model model) {
        Project project = projectService.getProjectById(id);
        Customer customer = project.getContract().getCustomer();
        model.addAttribute("customer", customer);
        model.addAttribute("project", project);
        return "manager/projects/projectDetail";
    }

    @PostMapping("/manager/project/projectCreate")
    public String createProjectPage(@RequestParam("contractId") int contractId, Model model) {
        Project project = new Project();
        model.addAttribute("project", project);
        return "manager/project/createProject";

    }

    @PostMapping("/manager/project/create")
    public String createProject(@ModelAttribute("project") Project project) {
        LocalDate localDate = LocalDate.now();
        project.setDateStart(Utility.localDateToUtilDate(localDate));
        project.setStage(1);
        project.setIsSharedAble(false);
        projectService.createProject(project);
        return "manager/project/viewDetail/" + project.getProjectId();
    }
}
