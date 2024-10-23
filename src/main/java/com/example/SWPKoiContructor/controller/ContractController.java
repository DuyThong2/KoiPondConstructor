/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dao.ContractDAO;
import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Feedback;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.Term;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.TermService;
import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.FeedbackService;
import com.example.SWPKoiContructor.services.QuoteService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.services.UserService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.format.annotation.DateTimeFormat;
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
    private UserService userService;
    private FeedbackService feedbackService;

    public ContractController(ContractService contractService, TermService termService, CustomerService customerService,
            StaffService staffService, QuoteService quotesService, ContractDAO contractDAO, UserService userService, FeedbackService feedbackService, FileUtility fileUtility) {
        this.contractService = contractService;
        this.termService = termService;
        this.customerService = customerService;
        this.staffService = staffService;
        this.quotesService = quotesService;
        this.contractDAO = contractDAO;
        this.userService = userService;
        this.feedbackService = feedbackService;
        this.fileUtility = fileUtility;
    }

    @GetMapping("/manager/contract")
    public String listContracts(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "dateCreate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate) {

        List<Contract> contracts;
        long totalContracts;

        // Apply filtering based on the name, date range, and status
        if (statusFilter != null || searchName != null || fromDate != null || toDate != null) {
            contracts = contractService.getFilteredContracts(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate);
            totalContracts = contractService.countFilteredContracts(statusFilter, searchName, fromDate, toDate);
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
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);  // Add searchName to model
        model.addAttribute("fromDate", fromDate);  // Add fromDate to model
        model.addAttribute("toDate", toDate);  // Add toDate to model

        return "manager/contract/contractManage";  // JSP page to display the contract list
    }

    @GetMapping("/consultant/contract")
    public String listContracts(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "dateCreate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,
            HttpSession session) {

        // Get the consultant's ID from the session (assuming it's stored there)
        User user = (User) session.getAttribute("user");
        int consultantId = user.getId();

        List<Contract> contracts;
        long totalContracts;

        // Apply filtering based on the status, name, date range, and sort parameters
        contracts = contractService.getContractListOfConsultant(
                consultantId, page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate);

        totalContracts = contractService.countFilteredContractsForConsultant(
                consultantId, statusFilter, searchName, fromDate, toDate);

        int totalPages = (int) Math.ceil((double) totalContracts / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("contracts", contracts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);

        return "consultant/contract/contractManage";  // JSP page to display the contract list
    }

    @GetMapping("/customer/contract")
    public String listContractsByCustomer(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "dateCreate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            HttpSession session) {
        // Fetch paginated contracts using the service
        User user = (User) session.getAttribute("user");
        System.out.println(user.getId());
        List<Contract> contracts = contractService.getContractListOfCustomer(user.getId(), page, size, sortBy, sortDirection);
        contracts.forEach(System.out::println);
        // Fetch the total number of contracts for pagination
        long totalContracts = contractService.countContracts(true, user.getId());
        int totalPages = (int) Math.ceil((double) totalContracts / size);
        System.out.println("total page : " + totalPages);

        // Add attributes to the model for JSP rendering
        model.addAttribute("contracts", contracts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);

        return "customer/contract/contractManage";  // JSP page to display the contract list
    }

    @GetMapping("/manager/contract/detail/{id}")
    public String viewDetailContract(Model model, @PathVariable("id") int id, HttpSession session) {
        Contract contract = contractService.getContractById(id);
        if (contract != null) {
            model.addAttribute("contract", contract);
            if (contract.getContractStatus() == 3) {
                User toUser = contract.getQuote().getStaff();
                User fromUser = contract.getCustomer();
                Feedback fb = feedbackService.getLatestContractFeedback(id, fromUser.getId(), toUser.getId());
                model.addAttribute("feedback", fb);
            }
            if (contract.getContractStatus() == 4) {
                User toUser = contract.getQuote().getStaff();
                User fromUser = (User) session.getAttribute("user");
                Feedback fb = feedbackService.getManagerSelfFeedback(id);
                model.addAttribute("feedback", fb);
            }
            return "manager/contract/contractDetail";
        } else {
            return "redirect:/manager/contract";
        }

    }

    @GetMapping("/consultant/contract/viewDetail/{id}")
    public String viewDetailContractByConsultant(Model model, @PathVariable("id") int id, HttpSession session) {
        Contract contract = contractService.getContractById(id);
        Staff staff = (Staff) session.getAttribute("user");
        if (contract != null && contract.isContractBelongToStaff(staff, contract)) {
            model.addAttribute("contract", contract);
            if (contract.getContractStatus() == 3) {
                User toUser = (User) session.getAttribute("user");
                User fromUser = contract.getCustomer();
                Feedback fb = feedbackService.getLatestContractFeedback(id, fromUser.getId(), toUser.getId());
                model.addAttribute("feedback", fb);
            }
            if (contract.getContractStatus() == 4) {
                User toUser = (User) session.getAttribute("user");
                Feedback fb = feedbackService.getLatestContractFeedbackFromManager(id, toUser.getId());
                model.addAttribute("feedback", fb);
            }
            return "consultant/contract/contractDetail";
        } else {
            return "redirect:/consultant/contract";
        }

    }

    @GetMapping("/customer/contract/viewDetail/{id}")
    public String viewDetailContractByCustomer(Model model, @PathVariable("id") int id, HttpSession session) {
        Contract contract = contractService.getContractById(id);
        Customer customer = (Customer) session.getAttribute("user");
        if (contract != null && contract.isContractBelongToCustomer(customer, contract)) {
            model.addAttribute("contract", contract);
            if (contract.getContractStatus() == 3) {
                User toUser = contract.getQuote().getStaff();
                User fromUser = (User) session.getAttribute("user");
                Feedback fb = feedbackService.getLatestContractFeedback(id, fromUser.getId(), toUser.getId());
                model.addAttribute("feedback", fb);
            }
            return "customer/contract/contractDetail";
        } else {
            return "redirect:/customer/contract";
        }

    }

    @GetMapping("/consultant/contract/create")
    public String createContract(Model model, @RequestParam("quoteId") int quoteId, HttpSession session) {
        Contract contract = new Contract();
        Quotes quote = quotesService.getQuoteById(quoteId);
        Staff staff = (Staff) session.getAttribute("user");
        if (quote != null && quote.getContract() == null && quote.isQuoteBelongToStaff(quote, staff) //                && quote.getQuotesStatus()==5
                ) {

            model.addAttribute("quote", quote);
            model.addAttribute("customer", quote.getCustomer());
            List<Term> terms = termService.getAllTemplateTerm();
            terms.forEach(System.out::println);// Get all available terms for the dropdown
            model.addAttribute("contract", contract);
            model.addAttribute("term", new Term());
            model.addAttribute("terms", terms);

            return "consultant/contract/createContract";
        } else {
            return "redirect:/consultant/contract";
        }

    }

    @PostMapping("/consultant/contract/create")
    public String saveContract(@ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file,
            @RequestParam("termOption") String termOption
    ) {

        // Handle file upload
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        contract.setFileURL(fileURL);
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Handle term based on the selected termOption
        Term savedTerm = null;

        if ("custom".equals(termOption)) {
            // Create a new custom term
            Term newTerm = new Term();
            newTerm.setPercentOnDesign1(contract.getTerm().getPercentOnDesign1());
            newTerm.setPercentOnDesign2(contract.getTerm().getPercentOnDesign2());
            newTerm.setPercentOnDesign3(contract.getTerm().getPercentOnDesign3());
            newTerm.setPercentOnConstruct1(contract.getTerm().getPercentOnConstruct1());
            newTerm.setPercentOnConstruct2(contract.getTerm().getPercentOnConstruct2());
            newTerm.setPayOnStartOfDesign(contract.getTerm().isPayOnStartOfDesign());
            newTerm.setPayOnStartOfConstruction(contract.getTerm().isPayOnStartOfConstruction());
            newTerm.setFollowContract(false);
            newTerm.setDescription("Custom term");

            // Save the custom term and associate it with the contract
            savedTerm = termService.save(newTerm);
            contract.setTerm(savedTerm);

        } else if ("contract".equals(termOption)) {
            // Create a new follow-contract term
            Term newTerm = new Term();
            newTerm.setFollowContract(true);
            newTerm.setDescription("Follow contract default term");

            // Save the follow-contract term and associate it with the contract
            savedTerm = termService.save(newTerm);
            contract.setTerm(savedTerm);

        } else if ("existing".equals(termOption)) {
            // Find the existing term by ID

        }

        // Set the term to the contract if a term was determined
        // Save the contract entity with the term properly handled
        contract = contractService.createContract(contract);

        return "redirect:/consultant/contract/viewDetail/" + contract.getContractId();
    }

    @GetMapping("/consultant/contract/edit")
    public String updateContractByConsultant(@RequestParam("id") int contractId, Model model, HttpSession session) {
        Contract contract = contractService.getContractById(contractId);
        Staff staff = (Staff) session.getAttribute("user");
        if (contract != null && contract.isContractBelongToStaff(staff, contract)) {
            model.addAttribute("contract", contract);
            model.addAttribute("quote", contract.getQuote());
            model.addAttribute("terms", termService.getAllTemplateTerm());
            model.addAttribute("term", contract.getTerm());

            model.addAttribute("customer", contract.getCustomer());
            return "consultant/contract/editContract";
        } else {
            return "redirect:/consultant/contract";
        }

    }

    @PostMapping("/consultant/contract/edit")
    public String saveUpdatedContractByConsultant(
            @ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file,
            @RequestParam("termOption") String termOption) {

        // Handle file upload, only update if a new file is provided
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        if (fileURL != null) {
            contract.setFileURL(fileURL);
        }

        // Handle term based on the selected termOption
        Term savedTerm = null;

        if ("custom".equals(termOption)) {
            // Save custom term details
            Term newTerm = contract.getTerm();
            newTerm.setFollowContract(false);
            newTerm.setIsTemplate(false); // Not a template term
            savedTerm = termService.save(newTerm); // Save the custom term
            contract.setTerm(savedTerm);

        } else if ("contract".equals(termOption)) {
            // Create a new follow-contract term
            Term followContractTerm = new Term();
            followContractTerm.setFollowContract(true);
            followContractTerm.setDescription("Follow contract default term");
            followContractTerm.setIsTemplate(false); // Not a template
            savedTerm = termService.save(followContractTerm);
            contract.setTerm(savedTerm);

        } else if ("existing".equals(termOption) && contract.getTerm() != null) {
            // Load the existing term by ID (template terms)
            Term existingTerm = termService.findTermById(contract.getTerm().getTermId());
            contract.setTerm(existingTerm);
        }

        // Update the contract's status and date
        contract.setContractStatus(1);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity with the updated term
        contract = contractService.createContract(contract);

        return "redirect:/consultant/contract/viewDetail/" + contract.getContractId();
    }

    @GetMapping("/manager/contract/edit")
    public String updateContractByManager(@RequestParam("id") int contractId, Model model) {
        Contract contract = contractService.getContractById(contractId);
        if (contract != null) {
            model.addAttribute("contract", contract);
            model.addAttribute("quote", contract.getQuote());
            model.addAttribute("terms", termService.getAllTemplateTerm());
            model.addAttribute("customer", contract.getCustomer());
            model.addAttribute("term", contract.getTerm());
            return "manager/contract/editContract";
        } else {
            return "redirect:/manager/contract";
        }

    }

    @PostMapping("/manager/contract/edit")
    public String saveUpdatedContractByManager(
            @ModelAttribute("contract") Contract contract,
            @RequestParam("file") MultipartFile file,
            @RequestParam("termOption") String termOption) {

        // Handle file upload, only update if a new file is provided
        String fileURL = fileUtility.handleFileUpload(file, FileUtility.CONTRACT_DIR);
        if (fileURL != null) {
            contract.setFileURL(fileURL);
        }

        // Handle term based on the selected termOption
        Term savedTerm = null;

        if ("custom".equals(termOption)) {
            // Save custom term details
            Term newTerm = contract.getTerm();
            newTerm.setFollowContract(false);
            newTerm.setIsTemplate(false); // Not a template term
            savedTerm = termService.save(newTerm); // Save the custom term
            contract.setTerm(savedTerm);

        } else if ("contract".equals(termOption)) {
            // Create a new follow-contract term
            Term followContractTerm = new Term();
            followContractTerm.setFollowContract(true);
            followContractTerm.setDescription("Follow contract default term");
            followContractTerm.setIsTemplate(false); // Not a template
            savedTerm = termService.save(followContractTerm);
            contract.setTerm(savedTerm);

        } else if ("existing".equals(termOption) && contract.getTerm() != null) {
            // Load the existing term by ID (template terms)
            Term existingTerm = termService.findTermById(contract.getTerm().getTermId());
            contract.setTerm(existingTerm);
        }

        // Update the contract's status and date
        contract.setContractStatus(2);  // Assuming 1 is for 'Pending'
        contract.setDateCreate(new Date());

        // Save the contract entity with the updated term
        contract = contractService.createContract(contract);

        return "redirect:/manager/contract/viewDetail/" + contract.getContractId();
    }

    @PostMapping("/customer/contract/editStatus")
    public String editStatusByCustomer(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/customer/contract/viewDetail/" + contractId;

    }

    @PostMapping("/customer/contract/editStatusAndFeedback")
    public String editStatusFeedbackByCustomer(@RequestParam("id") int contractId,
            @RequestParam("status") int status,
            @RequestParam("declineReason") String feedbackContent,
            @RequestParam("toUserId") int toUserId,
            HttpSession session) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        User fromUser = (User) session.getAttribute("user");
        User toUser = userService.getUserById(toUserId);
        Feedback newFeedback = new Feedback(feedbackContent, new Date(), fromUser, toUser, contract);
        newFeedback = feedbackService.saveFeedback(newFeedback);
        return "redirect:/customer/contract/viewDetail/" + contractId;

    }

    @PostMapping("/manager/contract/editStatus")
    public String editStatusByManager(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/manager/contract/viewDetail/" + contractId;

    }

    @PostMapping("/manager/contract/editStatusAndFeedback")
    public String editStatusFeedbackByManager(@RequestParam("id") int contractId,
            @RequestParam("status") int status,
            @RequestParam("declineReason") String feedbackContent,
            @RequestParam("toUserId") int toUserId,
            HttpSession session) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        User fromUser = (User) session.getAttribute("user");
        User toUser = userService.getUserById(toUserId);
        Feedback newFeedback = new Feedback(feedbackContent, new Date(), fromUser, toUser, contract);
        newFeedback = feedbackService.saveFeedback(newFeedback);
        return "redirect:/manager/contract/viewDetail/" + contractId;

    }

    @PostMapping("/consultant/contract/editStatus")
    public String editStatusByConsultant(@RequestParam("id") int contractId, @RequestParam("status") int status) {
        Contract contract = contractService.changeStatusContract(status, contractId);
        return "redirect:/consultant/contract/viewDetail/" + contractId;

    }

}
