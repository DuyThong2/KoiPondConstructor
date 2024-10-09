package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
public class ManageUsersController {

    private CustomerService customerService;
    private StaffService staffService;
    private ProjectService projectService;
    private LoyaltyPointService loyaltyPointService;
    private DesignService designService;
    private ConstructionService constructionService;
    private ConsultantService consultantService;
    private PasswordEncoder passwordEncoder;

    public ManageUsersController(CustomerService customerService, StaffService staffService, ProjectService projectService, LoyaltyPointService loyaltyPointService, DesignService designService,
            ConstructionService constructionService, ConsultantService consultantService, PasswordEncoder passwordEncoder) {
        this.customerService = customerService;
        this.staffService = staffService;
        this.projectService = projectService;
        this.loyaltyPointService = loyaltyPointService;
        this.designService = designService;
        this.constructionService = constructionService;
        this.consultantService = consultantService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/manager/manageCustomer")
    public String manageCustomer(Model model,
            @RequestParam(required = false) String searchEmail,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Boolean status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size) {
        // Lấy danh sách Customer theo bộ lọc
        List<Customer> customers = customerService.getFilterListOfCustomer(name, searchEmail, status, page, size);

        long totalListOfCustomer = customerService.countFilterCustomer(name, searchEmail, status);
        int totalPages = (int) Math.ceil((double) totalListOfCustomer / size);

        model.addAttribute("customers", customers);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("searchEmail", searchEmail);
        model.addAttribute("status", status);

        return "/manager/manageUsers/manageCustomer";
    }

    @GetMapping("/manager/manageCustomer/detail/{customerId}")
    public String customerDetail(Model model, @PathVariable("customerId") int customerId,
                                 RedirectAttributes redirectAttributes) {

        Customer customer = customerService.getCustomerById(customerId);
        if (customer == null) {
            redirectAttributes.addFlashAttribute("message", "You do not have permission to access this project.");
            return "redirect:/error/error-403";
        }
        int totalProject = (int) projectService.countCustomerProjectsById(customerId);
        int totalLoyaltyPoint = (int) loyaltyPointService.TotalPoints(customerId);
        List<Project> projects = projectService.getCustomerProjectsById(customerId);

        model.addAttribute("customer", customer);
        model.addAttribute("totalProject", totalProject);
        model.addAttribute("totalLoyaltyPoint", totalLoyaltyPoint);
        model.addAttribute("projects", projects);

        return "/manager/manageUsers/customerDetail";
    }

    @GetMapping("/manager/manageStaff")
    public String manageStaff(Model model,
            @RequestParam(required = false) String searchEmail,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String department,
            @RequestParam(required = false) Boolean status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "6") int size) {

        List<Staff> staffs = staffService.getFilterListOfStaff(name, searchEmail, department, status, page, size);

        long totalListOfCustomer = staffService.countFilterStaff(name, searchEmail, department, status);
        int totalPages = (int) Math.ceil((double) totalListOfCustomer / size);

        model.addAttribute("staffs", staffs);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("searchEmail", searchEmail);
        model.addAttribute("department", department);
        model.addAttribute("status", status);

        return "/manager/manageUsers/manageStaff";
    }

    @PostMapping("/manager/manageStaff/add")
    public String addStaff(@ModelAttribute Staff staff, RedirectAttributes redirectAttributes) {
        String fullEmail = staff.getEmail() + "@gmail.com";

        // Check if email already exists
        if (staffService.findStaffByEmail(fullEmail) != null) {
            // If email exists, add an error message
            redirectAttributes.addFlashAttribute("message", "Email already exists. Please use a different email.");
            return "redirect:/manager/manageStaff";
        }

        staff.setEmail(fullEmail);
        staff.setEnabled(true);
        staff.setPassword(passwordEncoder.encode(staff.getPassword()));

        String authority = staff.getDepartment();
        if (authority.equalsIgnoreCase("Design")) {
            authority = "ROLE_DESIGNER";
        }
        if (authority.equalsIgnoreCase("Consulting")) {
            authority = "ROLE_CONSULTANT";
        }
        if (authority.equalsIgnoreCase("Construction")) {
            authority = "ROLE_CONSTRUCTOR";
        }
        if (authority.equalsIgnoreCase("Management")) {
            authority = "ROLE_MANAGER";
        }

        Authority newAuthority = new Authority(staff, authority);
        staff.AddAuthorities(newAuthority);
        staffService.createStaff(staff);
        // Add success message
        redirectAttributes.addFlashAttribute("message", "Staff added successfully!");
        return "redirect:/manager/manageStaff";  // Redirect back to the manage staff page
    }

    @PostMapping("/manager/manageUser/block/{userId}")
    public String blockOrUnblockUsers(@PathVariable("userId") int userId,
                                      HttpSession session, RedirectAttributes redirectAttributes) {

        //check department is management  is accessed for update
        User user = (User) session.getAttribute("user");
        if (user == null)
            return "redirect:/login";

        Customer customer = customerService.getCustomerById(userId);
        if (customer != null) {
            if (customer.isEnabled()) {
                customer.setEnabled(false);
                redirectAttributes.addFlashAttribute("message", "User successfully blocked!");
            } else {
                customer.setEnabled(true);
                redirectAttributes.addFlashAttribute("message", "User successfully unblocked!");
            }
            customerService.updateCustomer(customer);
            return "redirect:/manager/manageCustomer";
        }

        Staff staff = staffService.getStaffById(userId);
        if (staff.isEnabled()) {
            staff.setEnabled(false);
            redirectAttributes.addFlashAttribute("message", "User successfully blocked!");
        } else {
            staff.setEnabled(true);
            redirectAttributes.addFlashAttribute("message", "User successfully unblocked!");
        }
        staffService.updateStaff(staff);
        return "redirect:/manager/manageStaff";
    }

    @GetMapping("/manager/manageStaff/detail/{staffId}")
    public String staffDetail(Model model, @PathVariable("staffId") int staffId,
                              RedirectAttributes redirectAttributes) {

        Staff staff = staffService.getStaffById(staffId);
        if (staff == null) {
            redirectAttributes.addFlashAttribute("message", "Staff không tồn tại.");
            return "redirect:/error/error-403";
        }

        List<Design> designs = null;
        List<Construction> constructions = null;
        List<Consultant> consultants = null;
        if ("Design".equals(staff.getDepartment())) {
            designs = designService.getProjectsByStaffId(staffId);
        } else if ("Construction".equals(staff.getDepartment())) {
            constructions = constructionService.getConstructionByStaffId(staffId);
        }else if ("Consulting".equals(staff.getDepartment())) {
            consultants = consultantService.getConsultantListByStaffId(staffId);
        }

        model.addAttribute("staff", staff);
        model.addAttribute("designs", designs);
        model.addAttribute("constructions", constructions);
        model.addAttribute("consultants", consultants);

        return "/manager/manageUsers/staffDetail";
    }



}


