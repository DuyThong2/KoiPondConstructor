package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller

public class ProjectController {

    private FileUtility fileUtility;
    private ProjectService projectService;

    public ProjectController(FileUtility fileUtility, ProjectService projectService) {
        this.fileUtility = fileUtility;
        this.projectService = projectService;
    }

    @GetMapping("/manager/project")
    public String ProjectList(Model model){
        List<Project> list = projectService.getProjectList();
        model.addAttribute("projectList", list);
        return "manager/project/projectManage";
    }
}
