/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.Term;
import com.example.SWPKoiContructor.services.TermService;
import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.QuoteService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Controller
public class ContractController {

    private FileUtility fileUtility;
    private ContractService contractService;
    private TermService termService;
    private CustomerService customerService;
    private StaffService staffService;
    private QuoteService quotesService;

    public ContractController(ContractService contractService, TermService termService, CustomerService customerService, 
            StaffService staffService,QuoteService quotesService) {
        this.contractService = contractService;
        this.termService = termService;
        this.customerService = customerService;
        this.staffService = staffService;
        this.quotesService = quotesService;
        fileUtility = new FileUtility();
    }

    @GetMapping("/manager/contract")
    public String getContractList(Model model) {
        List<Contract> list = contractService.getContractList();
        model.addAttribute("contracts", list);
        return "manager/contract/contractManage";
    }

    @GetMapping("/manager/contract/viewDetail/{id}")
    public String viewDetailContract(Model model, @PathVariable("id") int id) {
        Contract contract = contractService.getContractById(id);
        model.addAttribute("contract", contract);
        return "manager/contract/contractDetail";
    }
    
    @GetMapping("/consultant/contract/viewDetail/{id}")
    public String viewDetailContractByConsultant(Model model, @PathVariable("id") int id) {
        Contract contract = contractService.getContractById(id);
        model.addAttribute("contract", contract);
        return "manager/contract/contractDetail";
    }

    @GetMapping("/consultant/contract")
    public String getContractListOfConsultant(Model model) {
        Staff staff = staffService.getStaffById(2);
        List<Contract> list = contractService.getContractListOfConsultant(staff.getStaffId());
        model.addAttribute("contracts", list);
        return "consultant/contractManage";
    }

    @GetMapping("/consultant/contract/create")
    public String createContract(Model model,@RequestParam("quoteId") int quoteId) {
        Contract contract = new Contract();
        Quotes quote = quotesService.getQuoteById(quoteId);
        model.addAttribute("quote",quote);
        List<Term> terms = termService.getAllTemplateTerm();  // Get all available terms for the dropdown
        model.addAttribute("contract", contract);
        model.addAttribute("terms", terms);

        return "consultant/createContract";
    }

    @PostMapping("/consultant/contract/create")
    public String saveContract(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file){
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity
        contractService.createContract(contract);

        return "redirect:/consultant/contract/viewDetail"+contract.getContractId();  // Redirect to contract listing page after saving
    }

    @GetMapping("/customer/contract")
    public String viewAllContract(Model model, HttpSession session) {
        Customer customer = customerService.getCustomerById(2);
        List<Contract> list = contractService.getContractListOfCustomer(customer.getCustomerId());
        model.addAttribute("contracts", list);

        return "customer/contract/contractManage";
    }

    @GetMapping("/customer/contract/{id}")
    public String viewDetailContractByCustomer(Model model, @PathVariable("id") int id) {
        Contract contract = contractService.getContractById(id);
        model.addAttribute("contract", contract);

        return "customer/contract/contractDetail";
    }

    @PostMapping("/customer/contract/editStatus")
    public String editStatusByCustomer(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/customer/contract/" + contractId;

    }
    
    @PostMapping("/manager/contract/editStatus")
    public String editStatusByManager(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/manager/contract/viewDetail/" + contractId;

    }
    
    @PostMapping("/consultant/contract/editStatus")
    public String editStatusByConsultant(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/consultant/contract/viewDetail/" + contractId;

    }
    
    @GetMapping("/manager/contract/edit")
    public String updateContractByManager(@RequestParam("id") int contractId, Model model){
        Contract contract = contractService.getContractById(contractId);
        model.addAttribute("contract", contract);
        model.addAttribute("quote",contract.getQuote());
        model.addAttribute("terms", termService.getAllTemplateTerm());
        model.addAttribute("customer",contract.getCustomer());
        return "manager/contract/editContract";
    }
    
    @PutMapping("/manager/contract/edit")
    public String saveUpdatedContractByManager(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file){
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity
        contractService.createContract(contract);

        return "redirect:/manager/contract/viewDetail/"+contract.getContractId();  // Redirect to contract listing page after saving
    }
    
    @GetMapping("/consultant/contract/edit")
    public String updateContractByConsultant(@RequestParam("id") int contractId, Model model){
        Contract contract = contractService.getContractById(contractId);
        model.addAttribute("contract", contract);
        model.addAttribute("quote",contract.getQuote());
        model.addAttribute("terms", termService.getAllTemplateTerm());
        model.addAttribute("customer",contract.getCustomer());
        return "manager/contract/editContract";
    }
    
    @PutMapping("/consultant/contract/edit")
    public String saveUpdatedContractByConsultant(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file){
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity
        contractService.createContract(contract);

        return "redirect:/manager/contract/viewDetail/"+contract.getContractId();  // Redirect to contract listing page after saving
    }
    
    
}
