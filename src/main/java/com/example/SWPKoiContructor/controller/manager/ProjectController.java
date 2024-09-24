package com.example.SWPKoiContructor.controller.manager;

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
            project.setStage(1);
            project.setIsSharedAble(false);
            projectService.createProject(project);
            return "redirect:/manager/projects/" + project.getProjectId();
        } else {
            return "redirect:/manager/contracts";
        }

    }
}
