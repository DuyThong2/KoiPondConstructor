package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.utils.FileUtility;
import com.example.SWPKoiContructor.utils.Utility;
import java.time.LocalDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("/manager/project")
    public String ProjectList(Model model){
        List<Project> list = projectService.getProjectList();
        model.addAttribute("projectList", list);
        return "manager/project/projectManage";
    }
    
    @PostMapping("/manager/project/projectCreate")
    public String createProjectPage(@RequestParam("contractId") int contractId, Model model){
        Project project = new Project();
        model.addAttribute("project",project);
        return "manager/project/createProject";
        
        
    }
    
    @PostMapping("/manager/project/create")
    public String createProject(@ModelAttribute("project") Project project){
        LocalDate localDate = LocalDate.now();
        project.setDateStart(Utility.localDateToUtilDate(localDate));
        project.setStage(1);
        project.setIsSharedAble(false);
        projectService.createProject(project);
        return "manager/project/viewDetail/"+project.getProjectId();
    }
}
