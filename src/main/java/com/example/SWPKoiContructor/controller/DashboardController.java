package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.QuoteService;
import com.example.SWPKoiContructor.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    private QuoteService quoteService;
    private ProjectService projectService;
    private ContractService contractService;
    private StaffService staffService;

    public DashboardController(QuoteService quoteService, ProjectService projectService, ContractService contractService, StaffService staffService) {
        this.quoteService = quoteService;
        this.projectService = projectService;
        this.contractService = contractService;
        this.staffService = staffService;
    }
    
    
     @GetMapping("/manager/dashboard")
    public String DashboardShow(Model model) {
        int quotesPeding =(int) quoteService.countQuotesPeding();
        int projectComplete = (int) projectService.countProjectComplete();
        int projectProcessing = (int) projectService.countProjectProcessing();
        int staffInWork = (int) staffService.countStaff();
        
        model.addAttribute("quotesPeding", quotesPeding);
        model.addAttribute("projectProcessing", projectProcessing);
        model.addAttribute("projectComplete", projectComplete);
        model.addAttribute("staffInWork", staffInWork);
        return "manager/dashboard";
        
    }
    
}
