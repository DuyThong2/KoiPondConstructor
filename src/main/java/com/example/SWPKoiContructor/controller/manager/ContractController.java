/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Term;
import com.example.SWPKoiContructor.services.TermService;
import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */

@Controller
@RequestMapping("/manager/contract")
public class ContractController {
    
    
    private FileUtility fileUtility;
    private ContractService contractService;
    private TermService termService;

    public ContractController(ContractService contractService, TermService termService) {
        this.contractService = contractService;
        this.termService = termService;
        fileUtility = new FileUtility();
    }

    
    
    
    
    
    @GetMapping("")
    public String getContractList(Model model){
        List<Contract> list = contractService.getContractList();
        model.addAttribute("contracts",list);
        return "manager/contract/contractManage";
    }
    
    @GetMapping("/viewDetail/{id}")
    public String viewDetailContract(Model model, @PathVariable("id") int id){
        Contract contract = contractService.getContractById(id);
        model.addAttribute("contract",contract);
        return "manager/contract/contractDetail";
    }
    
    
    @GetMapping("/create")
    public String createContract(Model model){
        Contract contract = new Contract();
        List<Term> terms = termService.getAllTemplateTerm();  // Get all available terms for the dropdown
        model.addAttribute("contract", contract);
        model.addAttribute("terms", terms);
        
        return "manager/contract/createContract";
    }
    
    @PostMapping("/create")
    public String saveContract(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file) {
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);
        contract.setDateCreate(new Date());
        contractService.createContract(contract);  // Save the contract entity
        return "redirect:/manager/contract";  // Redirect to a contract listing page after saving
    }
}
