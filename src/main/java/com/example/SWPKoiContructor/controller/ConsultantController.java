/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dao.CustomerDAO;
import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.*;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.joda.time.LocalDateTime;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.joda.time.LocalDateTime.now;
import org.springframework.validation.BindingResult;

/**
 *
 * @author HP
 */
@Controller
public class ConsultantController {

    private ConsultantService consultantService;
    private StaffService staffService;
    private CustomerService customerService;
    private PreDesignService preDesignService;
    private NotificationService notificationService;
    private LoyaltyPointService loyaltyPointService;

    public ConsultantController(ConsultantService consultantService, StaffService staffService, CustomerService customerService, PreDesignService preDesignService, NotificationService notificationService, LoyaltyPointService loyaltyPointService) {
        this.consultantService = consultantService;
        this.staffService = staffService;
        this.customerService = customerService;
        this.preDesignService = preDesignService;
        this.notificationService = notificationService;
        this.loyaltyPointService = loyaltyPointService;
    }

    //-------------------------------------  MANAGER SITE -------------------------------------------  
    @GetMapping("/manager/consultant")
    public String getConsultantList(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "consultantDateTime") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        List<Consultant> consultants;
        long totalConsultants;

        if (statusFilter != null) {
            consultants = consultantService.getConsultantListByOrderSortFilter(page, size, sortBy, sortDirection, statusFilter);
            totalConsultants = consultantService.countConsultantByStatus(statusFilter);
        } else {
            consultants = consultantService.getConsultantListOrderByAndSort(page, size, sortBy, sortDirection);
            totalConsultants = consultantService.countConsultant();
        }
        int totalPages = (int) Math.ceil((double) totalConsultants / size);
        if (page > totalPages) {
            page = 0;
        }
        model.addAttribute("consultants", consultants);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);

        return "manager/consultant/consultantManage";
    }

    @GetMapping("/manager/consultant/detail/{id}")
    public String getConsultantById(@PathVariable("id") int consultantId, Model model) {
        Consultant consultant = consultantService.getConsultantById(consultantId);
        model.addAttribute("consultant", consultant);
        if (consultant.getCustomer() != null) {
            model.addAttribute("totalPoint", loyaltyPointService.TotalPoints(consultant.getCustomer().getId()));
        }
        return "manager/consultant/consultantDetail";
    }

//    @GetMapping("/manager/consultant/viewConsultantStaffList/{id}")
//    public String getConsultantStaffList(@PathVariable("id") int id, Model model) {
//        List<Staff> list = staffService.getStaffListByRole("Consulting");
//        model.addAttribute("consultantStaffList", list);
//        model.addAttribute("consultant", consultantService.getConsultantById(id));
//        return "manager/consultant/addConsultantStaff";
//    }
    @GetMapping("/manager/consultant/viewConsultantStaffList")
    public String getConsultantStaffLists(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(required = false) String searchName,
            @RequestParam(name = "consultantId") int consultantId) {
        List<Staff> staffs;
        long totalStaff;

        staffs = staffService.getAllConsultantStaff(page, size, searchName);
        totalStaff = staffService.countAllConsultantStaff(page, size, searchName);

        int totalPages = (int) Math.ceil((double) totalStaff / size);
        if (page > totalPages) {
            page = 0;
        }
        model.addAttribute("staff", staffs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchName", searchName);
        model.addAttribute("consultantId", consultantId);
        return "manager/consultant/addStaff";
    }

    @PostMapping("/manager/consultant/viewConsultantStaffList/editConsultantStaff")
    public String updateConsultantStaff(@RequestParam("id") int id, @RequestParam("staffId") int staffId, Model model) {
        Staff consultantStaff = staffService.getStaffById(staffId);
        Consultant consultant = consultantService.updateConsultantStaff(id, consultantStaff);
        String messageNotification = "You have been assigned to consultant of Customer:" + consultant.getConsultantCustomerName();
        notificationService.assignStaffNotification(consultantStaff.getId(), consultant.getConsultantId(), "consultant", "consultant", messageNotification);
        // Push the notification via WebSocket
        return "redirect:/manager/consultant/detail/" + id;
    }
    
    
    //--------------------------------------------  CONSULTANT SITE ---------------------------------------------

    @GetMapping("/consultant/viewConsultantList")
    public String getConsultantListByStaffId(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "consultantDateTime") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        List<Consultant> consultants;
        User user = (User) session.getAttribute("user");
        long totalConsultants;

        if (statusFilter != null) {
            consultants = consultantService.getConsultantListByStaffIdOrderSortFilter(user.getId(), page, size, sortBy, sortDirection, statusFilter);
            totalConsultants = consultantService.countConsultantByStaffIdAndStatus(user.getId(), statusFilter);
        } else {
            consultants = consultantService.getConsultantListByStaffIdOrderSort(user.getId(), page, size, sortBy, sortDirection);
            totalConsultants = consultantService.countConsultantByStaffId(user.getId());
        }
        int totalPages = (int) Math.ceil((double) totalConsultants / size);
        if (page > totalPages) {
            page = 0;
        }
        model.addAttribute("consultants", consultants);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        return "consultant/consultantManage";
    }

    @GetMapping("/consultant/consultant/detail/{id}")
    public String getConsultantDetail(@PathVariable("id") int consultantId, Model model, HttpSession session) {
        Consultant consultant = consultantService.getConsultantById(consultantId);
        Staff staff = (Staff) session.getAttribute("user");
        if (consultant != null && consultant.getStaff().getId() == staff.getId()) {
            model.addAttribute("consultant", consultant);
            model.addAttribute("customerList", customerService.getCustomerListForChoose());
            model.addAttribute("preDesignList", preDesignService.getActivePreDesignList());
            if (consultant.getCustomer() != null) {
                model.addAttribute("totalPoint", loyaltyPointService.TotalPoints(consultant.getCustomer().getId()));
            }
            return "consultant/consultantDetail";
        }
        return "redirect:/consultant/viewConsultantList";
    }

    @GetMapping("/consultant/viewConsultantDetail/updateStatus")
    public String updateConsultantStatus(@RequestParam("consultantId") int consultantId, @RequestParam("statusId") int statusId, Model model) {
        Consultant consultant = consultantService.updateConsultantStatus(consultantId, statusId);
        return "redirect:/consultant/consultant/detail/" + consultantId;
    }

    @PostMapping("/consultant/addCustomerToConsultant")
    public String addCustomerToConsultant(@RequestParam("consultantId") int consultantId,
            @RequestParam("customerId") int customerId) {
        // Fetch consultant and customer from database
        Customer customer = customerService.getCustomerById(customerId);

        // Associate customer with consultant
        Consultant consultant = consultantService.setCustomer(consultantId, customer);

        return "redirect:/consultant/consultant/detail/" + consultantId;
    }

    @PostMapping("/consultant/addPreDesignToConsultant")
    public String addPreDesignToConsultant(@RequestParam("consultantId") int consultantId,
            @RequestParam("preDesignId") int preDesignId) {
        PreDesign preDesign = preDesignService.getPredesignById(preDesignId);

        Consultant consultant = consultantService.setPreDesign(consultantId, preDesign);
        return "redirect:/consultant/consultant/detail/" + consultantId;
    }
    
    @GetMapping("/consultant/preDesign/{id}")
    public String viewPreDesign(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        PreDesign preDesign = preDesignService.getPreDesignAndContentById(id);
        if (preDesign != null) {
            model.addAttribute("preDesign", preDesign);
            return "consultant/preDesignDetail";
        }
        return "redirect:/error/error-403";
        
    }

    //----------------------------------------------  CUSTOMER SITE ------------------------------------------
    @PostMapping("/save")
    public String saveConsultantInWeb(@NotEmpty @Size(min = 2) @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("content") String content,
            @RequestParam("type") String type,
            @RequestParam(name = "preDesignId", required = false) Integer preDesignId,
            HttpSession session, RedirectAttributes redirectAttributes) {
        if (name == null || name.length() < 2) {
            redirectAttributes.addFlashAttribute("error", "Name must be at least 2 characters long.");
            return "redirect:/";
        } else if (phone == null || phone.trim().isEmpty() || !phone.matches("[0-9]{10}")) {         
            redirectAttributes.addFlashAttribute("error", "Phone number is required or invalid format.");
            return "redirect:/";
        } else if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            redirectAttributes.addFlashAttribute("error", "Please provide a valid email address.");
            return "redirect:/";
        } else if (content == null || content.trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Content is required.");
            return "redirect:/";
        }

        Consultant newConsultant = new Consultant();
        newConsultant.setConsultantCustomerName(name);
        newConsultant.setConsultantPhone(phone);
        newConsultant.setConsultant_email(email);
        newConsultant.setConsultantContent(content);
        newConsultant.setConsultantType(type);
        newConsultant.setConsultantDateTime(Calendar.getInstance());
        newConsultant.setConsultantStatus(1);

        // Save the consultant
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Customer cus = customerService.getCustomerById(user.getId());
            newConsultant.setCustomer(cus);
        }
        if (preDesignId != null) {
            PreDesign preDesign = preDesignService.getPredesignById(preDesignId);
            newConsultant.setPredesign(preDesign);
        }

        newConsultant = consultantService.createConsultant(newConsultant);
        redirectAttributes.addFlashAttribute("success", "Consultant created successfully! ");
        // Call the private method to handle notification
        notificationService.sendConsultantCreationNotification(newConsultant);

        return "redirect:/";
    }

    @GetMapping("/customer/consultant")
    public String listFilteredServiceQuoteCustomer(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "consultantDateTime") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        User customer = (User) session.getAttribute("user");
        List<Consultant> consultants;
        long totalConsultant;

        // Apply filtering based on the name, date range, and status
        consultants = consultantService.getConsultantListOrderByAndSortCustomer(page, size, sortBy, sortDirection, statusFilter, customer);
        totalConsultant = consultantService.countConsultantListOrderByAndSortCustomer(page, size, sortBy, sortDirection, statusFilter, customer);

        int totalPages = (int) Math.ceil((double) totalConsultant / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("consultant", consultants);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);

        return "customer/consultant/consultantManage";  // JSP page to display the contract list
    }

    @GetMapping("/customer/consultant/updateStatus")
    public String updateConsultantStatusCustomer(@RequestParam("consultantId") int consultantId,
            @RequestParam("statusId") int statusId, Model model, HttpSession session) {
        User customer = (User) session.getAttribute("user");
        Consultant check = consultantService.getConsultantById(consultantId);
        if (check != null && check.getCustomer().getId() == customer.getId()) {
            check = consultantService.updateConsultantStatus(consultantId, statusId);
        }
        return "redirect:/customer/consultant";

    }
}
