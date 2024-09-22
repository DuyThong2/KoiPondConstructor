/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dao.ContractDAO;
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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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
    private ContractDAO contractDAO;

    public ContractController(ContractService contractService, TermService termService, CustomerService customerService,
            StaffService staffService, QuoteService quotesService, ContractDAO contractDAO) {
        this.contractService = contractService;
        this.termService = termService;
        this.customerService = customerService;
        this.staffService = staffService;
        this.quotesService = quotesService;
        this.contractDAO = contractDAO;
        fileUtility = new FileUtility();
    }

    @GetMapping("/manager/contract")
    public String listContracts(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "dateCreate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        List<Contract> contracts;
        long totalContracts;

        // Check if status filter is applied
        if (statusFilter != null) {
            contracts = contractDAO.getContractListByStatusAndPaging(page, size, sortBy, sortDirection, statusFilter);
            totalContracts = contractDAO.countContractsByStatus(statusFilter);
        } else {
            contracts = contractService.getContractListBaseOnSortAndPaging(page, size, sortBy, sortDirection);
            totalContracts = contractService.countContracts();
        }

        int totalPages = (int) Math.ceil((double) totalContracts / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("contracts", contracts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);  // Add status filter to model to keep track of the current filter

        return "manager/contract/contractManage";  // JSP page to display the contract list
    }

    @GetMapping("/consultant/contract")
    public String listContractsByConsultant(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "dateCreate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection) {
        // Fetch paginated contracts using the service
        int consultantId = 2;
        List<Contract> contracts = contractService.getContractListOfConsultant(2, page, size, sortBy, sortDirection);

        // Fetch the total number of contracts for pagination
        int totalContracts = contractService.countContracts(false, consultantId);
        int totalPages = (int) Math.ceil((double) totalContracts / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("contracts", contracts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);

        return "consultant/contract/contractManage";  // JSP page to display the contract list
    }

    @GetMapping("/customer/contract")
    public String listContractsByCustomer(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "dateCreate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection) {
        // Fetch paginated contracts using the service
        int customerId = 2;
        List<Contract> contracts = contractService.getContractListOfCustomer(customerId, page, size, sortBy, sortDirection);

        // Fetch the total number of contracts for pagination
        long totalContracts = contractService.countContracts(true, customerId);
        int totalPages = (int) Math.ceil((double) totalContracts / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("contracts", contracts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);

        return "customer/contract/contractManage";  // JSP page to display the contract list
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
        return "consultant/contract/contractDetail";
    }

    @GetMapping("/customer/contract/viewDetail/{id}")
    public String viewDetailContractByCustomer(Model model, @PathVariable("id") int id) {
        Contract contract = contractService.getContractById(id);
        model.addAttribute("contract", contract);

        return "customer/contract/contractDetail";
    }

    @GetMapping("/consultant/contract/create")
    public String createContract(Model model, @RequestParam("quoteId") int quoteId) {
        Contract contract = new Contract();
        Quotes quote = quotesService.getQuoteById(quoteId);
        model.addAttribute("quote", quote);
        model.addAttribute("customer", quote.getCustomer());
        List<Term> terms = termService.getAllTemplateTerm();  // Get all available terms for the dropdown
        model.addAttribute("contract", contract);
        model.addAttribute("terms", terms);

        return "consultant/contract/createContract";
    }

    @PostMapping("/consultant/contract/create")
    public String saveContract(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file) {
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        System.out.println(contract.getQuote());
        System.out.println(contract.getCustomer());
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity
        contract = contractService.createContract(contract);

        return "redirect:/consultant/contract/viewDetail/" + contract.getContractId();  // Redirect to contract listing page after saving
    }

    @GetMapping("/consultant/contract/edit")
    public String updateContractByConsultant(@RequestParam("id") int contractId, Model model) {
        Contract contract = contractService.getContractById(contractId);
        model.addAttribute("contract", contract);
        model.addAttribute("quote", contract.getQuote());
        model.addAttribute("terms", termService.getAllTemplateTerm());
        model.addAttribute("customer", contract.getCustomer());
        return "consultant/contract/editContract";
    }

    @PutMapping("/consultant/contract/edit")
    public String saveUpdatedContractByConsultant(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file) {
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity
        contract = contractService.createContract(contract);

        return "redirect:/consultant/contract/viewDetail/" + contract.getContractId();  // Redirect to contract listing page after saving
    }

    @GetMapping("/manager/contract/edit")
    public String updateContractByManager(@RequestParam("id") int contractId, Model model) {
        Contract contract = contractService.getContractById(contractId);
        model.addAttribute("contract", contract);
        model.addAttribute("quote", contract.getQuote());
        model.addAttribute("terms", termService.getAllTemplateTerm());
        model.addAttribute("customer", contract.getCustomer());
        return "manager/contract/editContract";
    }

    @PutMapping("/manager/contract/edit")
    public String saveUpdatedContractByManager(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file) {
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity
        contract = contractService.createContract(contract);

        return "redirect:/manager/contract/viewDetail/" + contract.getContractId();  // Redirect to contract listing page after saving
    }

    @PostMapping("/customer/contract/editStatus")
    public String editStatusByCustomer(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/customer/contract/viewDetail/" + contractId;

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

}