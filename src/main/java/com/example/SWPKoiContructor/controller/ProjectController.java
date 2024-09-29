package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.utils.FileUtility;
import com.example.SWPKoiContructor.utils.Utility;
import java.time.LocalDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class ProjectController {

    private FileUtility fileUtility;
    private ProjectService projectService;
    private ContractService contractService;

    public ProjectController(FileUtility fileUtility, ProjectService projectService, ContractService contractService) {
        this.fileUtility = fileUtility;
        this.projectService = projectService;
        this.contractService = contractService;
    }

    @GetMapping("/manager/projects")

    public String ProjectList(Model model,
    @RequestParam(defaultValue = "1") int page,
    @RequestParam(defaultValue = "5") int size,
    @RequestParam(defaultValue = "status") String sortBy,
    @RequestParam(defaultValue = "asc") String sortType,
                              @RequestParam(required = false) Integer statusFilter,
                              @RequestParam(required = false) Integer stageFilter){
        List<Project> list;
        long projectNum;
        if(stageFilter!=null || statusFilter!=null){
            list = projectService.getPaginationProjectListByStatusAndStage(page,size,sortBy,sortType,statusFilter,stageFilter);
           projectNum =  projectService.countProjectFilter(statusFilter,stageFilter);
        }else{
           list= projectService.getPaginationProjectList(page,size,sortBy,sortType);
           projectNum = projectService.countProject();
        }
        long totalPage= (long) Math.ceil(projectNum/(double)size);
        page = Math.max(page, 1);
        model.addAttribute("currentPage",page);
        model.addAttribute("size",size);
        model.addAttribute("sortBy",sortBy);
        model.addAttribute("sortType",sortType);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("projectList", list);
        model.addAttribute("statusFilter",statusFilter);
        model.addAttribute("stageFilter",stageFilter);
        return "manager/projects/projectManage";
    }

    @GetMapping("/manager/projects/{id}")
    public String ProjectDetail(@PathVariable("id") int id, Model model) {
        Project project = projectService.getProjectById(id);
        if (project != null){
            Customer customer = project.getContract().getCustomer();
        model.addAttribute("customer", customer);
        model.addAttribute("project", project);
        return "manager/projects/projectDetail";
        }else{
            return "redirect:/manager/projects";
        }
        
    }



    @GetMapping("/manager/project/create")
    public String createProjectPage(@RequestParam("id") int contractId, Model model) {
        Contract contract = contractService.getContractById(contractId);
        if (contract != null) {
            Project project = new Project();
            model.addAttribute("contract", contract);
            model.addAttribute("project", project);
            return "manager/projects/createProject";
        } else {
            return "redirect:/manager/contracts";
        }


    }

    @PostMapping("/manager/project/create")
    public String createProject(@ModelAttribute("project") Project project) {

        Contract contract = contractService.getContractById(project.getContract().getContractId());
        if (contract != null) {
            project.setContract(contract);
            LocalDate localDate = LocalDate.now();
            project.setDateStart(Utility.localDateToUtilDate(localDate));
            project.setStatus(1);
            project.setStage(1);
            project.setIsSharedAble(false);
            Project newlyCreatedProject = projectService.createProject(project);
            return "redirect:/manager/projects/" + newlyCreatedProject.getProjectId();
        } else {
            return "redirect:/manager/contracts";
        }

    }




}
