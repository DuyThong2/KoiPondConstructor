package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.*;
import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    private FileUtility fileUtility;
    private ProjectService projectService;
    private StaffService staffService;
    private CustomerService customerService;
    private ServiceDetailService serviceDetailService;
    private LoyaltyPointService loyaltyPointService;
    private UserService userService;
    private PasswordEncoder passwordEncoder;
    private DesignService designService;

    public UserController(FileUtility fileUtility, DesignService designService, ProjectService projectService, StaffService staffService, CustomerService customerService, ServiceDetailService serviceDetailService, LoyaltyPointService loyaltyPointService, UserService userService, PasswordEncoder passwordEncoder) {
        this.fileUtility = fileUtility;
        this.projectService = projectService;
        this.staffService = staffService;
        this.customerService = customerService;
        this.serviceDetailService = serviceDetailService;
        this.loyaltyPointService = loyaltyPointService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.designService = designService;
    }

    //========================================Customer Profile============================================//
    @GetMapping("/customer/profile")
    public String customerProfile(Model model,  HttpSession session) {
        Customer customer = (Customer) session.getAttribute("user");
        if(customer == null)
            return "redirect:/login";

        long totalProject = projectService.countCustomerProjectsById(customer.getId());
        long totalPoint = loyaltyPointService.TotalPoints(customer.getId());
        long totalService = serviceDetailService.countServiceDetailsByCustomerId(customer.getId());
        model.addAttribute("totalService", totalService);
        model.addAttribute("totalProject", totalProject);
        model.addAttribute("totalPoint", totalPoint);
        model.addAttribute("customer", customer);
        return "customer/profile";
    }

    @PostMapping("/image/uploads")
    public String uploadUserImage(@RequestParam("id") int id,
                                  @RequestParam("file") MultipartFile file,
                                  RedirectAttributes redirectAttributes, HttpSession session) {
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Choose a file to upload!");
            return "redirect:/customer/profile";
        }

        Customer customer = customerService.getCustomerById(id);
        if (customer == null) {
            redirectAttributes.addFlashAttribute("message", "Customer not found!");
            return "redirect:/customer/profile";
        }

        try {
            String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.USER_DIR);
            if (uploadedFilePath == null) {
                redirectAttributes.addFlashAttribute("message", "Failed to upload file.");
                return "redirect:/customer/profile";
            }

            customer.setImgURL(uploadedFilePath);
            customerService.updateCustomer(customer);
            //update session to upload new image
            session.setAttribute("user", customer);
            redirectAttributes.addFlashAttribute("message", "File uploaded successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "An error occurred while uploading the file.");
        }

        return "redirect:/customer/profile";
    }


    @PostMapping("/profile/update")
    public String updateCustomer(@RequestParam("id") int id,
                                 @RequestParam("name") String name,
                                 @RequestParam("phone") String phone,
                                  RedirectAttributes redirectAttributes, HttpSession session) {

        Customer customer = customerService.getCustomerById(id);
        if (customer == null) {
            redirectAttributes.addFlashAttribute("message", "Customer not found!");
            return "redirect:/login";
        }
            customer.setName(name);
            customer.setPhone(phone);
            customerService.updateCustomer(customer);
            //update session to upload new image
            session.setAttribute("user", customer);
            redirectAttributes.addFlashAttribute("message", "Update successfully!");
        return "redirect:/customer/profile";
    }

    @PostMapping("/profile/changePassword")
    public String changePasswordByCustomer(@RequestParam("id") int id,
                                           @RequestParam("currentPassword") String currentPassword,
                                           @RequestParam("newPassword") String newPassword,
                                           @RequestParam("confirmPassword") String confirmPassword,
                                           RedirectAttributes redirectAttributes) {

        Customer customer = customerService.getCustomerById(id);
        if (customer == null) {
            redirectAttributes.addFlashAttribute("message", "You must be login!");
            return "redirect:/login";
        }
        if(!passwordEncoder.matches(currentPassword, customer.getPassword()) || !newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("message", "Passwords do not match or do not correct!");
            return "redirect:/customer/profile";
        }

        customer.setPassword(passwordEncoder.encode(newPassword));
        customerService.updateCustomer(customer);
        //clear session
        SecurityContextHolder.clearContext();
        redirectAttributes.addFlashAttribute("message", "Password changed successfully! Let's Login Again!");
        return "redirect:/login";
    }

    //========================================End Of Customer Profile============================================//


    //========================================Staff Profile============================================//

    @GetMapping("/designer/profile")
    public String designerProfile(Model model,  HttpSession session) {
        Staff staff = (Staff) session.getAttribute("user");
        if(staff == null)
            return "redirect:/login";

        long totalDesign = designService.countDesignsByStaff(staff.getId());
        long totalDesignInProcess = designService.countDesignsProcessingByStaffId(staff.getId());
        long totalDesignComplete= designService.countDesignsCompleteByStaffId(staff.getId());

        model.addAttribute("totalDesign", totalDesign);
        model.addAttribute("totalDesignInProcess", totalDesignInProcess);
        model.addAttribute("totalDesignComplete", totalDesignComplete);
        model.addAttribute("staff", staff);
        return "designer/profile";
    }

    @PostMapping("/imageStaff/uploads")
    public String uploadStaffImage(@RequestParam("id") int id,
                                  @RequestParam("file") MultipartFile file,
                                  RedirectAttributes redirectAttributes, HttpSession session) {
        Staff staff = staffService.getStaffById(id);
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Choose a file to upload!");
            if(staff.getDepartment().equalsIgnoreCase("Design"))
                return "redirect:/designer/profile";
            if(staff.getDepartment().equalsIgnoreCase("Consulting"))
                return "redirect:/projects/profile";
            if(staff.getDepartment().equalsIgnoreCase("Construction"))
                return "redirect:/staff/profile";
        }

        if (staff == null)
            return "redirect:/login";

        try {
            String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.USER_DIR);
            if (uploadedFilePath == null) {
                redirectAttributes.addFlashAttribute("message", "Failed to upload file.");
                if(staff.getDepartment().equalsIgnoreCase("Design"))
                    return "redirect:/designer/profile";
                if(staff.getDepartment().equalsIgnoreCase("Consulting"))
                    return "redirect:/projects/profile";
                if(staff.getDepartment().equalsIgnoreCase("Construction"))
                    return "redirect:/staff/profile";
            }

            staff.setImgURL(uploadedFilePath);
            staffService.updateStaff(staff);

            // update session to upload new image
            session.setAttribute("user", staff);
            redirectAttributes.addFlashAttribute("message", "File uploaded successfully!");

            if(staff.getDepartment().equalsIgnoreCase("Design"))
                return "redirect:/designer/profile";
            if(staff.getDepartment().equalsIgnoreCase("Consulting"))
                return "redirect:/projects/profile";
            if(staff.getDepartment().equalsIgnoreCase("Construction"))
                return "redirect:/staff/profile";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "An error occurred while uploading the file.");
        }

        return "redirect:/login";
    }

    @PostMapping("/profileStaff/changePassword")
    public String changePasswordByStaff(@RequestParam("id") int id,
                                           @RequestParam("currentPassword") String currentPassword,
                                           @RequestParam("newPassword") String newPassword,
                                           @RequestParam("confirmPassword") String confirmPassword,
                                           RedirectAttributes redirectAttributes) {

        Staff staff = staffService.getStaffById(id);
        if (staff == null) {
            redirectAttributes.addFlashAttribute("message", "You must be login!");
            return "redirect:/login";
        }
        if(!passwordEncoder.matches(currentPassword, staff.getPassword()) || !newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("message", "Passwords do not match or do not correct!");
            if(staff.getDepartment().equalsIgnoreCase("Design"))
                return "redirect:/designer/profile";
            if(staff.getDepartment().equalsIgnoreCase("Consulting"))
                return "redirect:/projects/profile";
            if(staff.getDepartment().equalsIgnoreCase("Construction"))
                return "redirect:/staff/profile";
        }

        staff.setPassword(passwordEncoder.encode(newPassword));
        staffService.updateStaff(staff);
        //clear session
        SecurityContextHolder.clearContext();
        redirectAttributes.addFlashAttribute("message", "Password changed successfully! Let's Login Again!");
        return "redirect:/login";
    }

    @PostMapping("/profileStaff/update")
    public String updateStaff(@RequestParam("id") int id,
                                 @RequestParam("name") String name,
                                 @RequestParam("phone") String phone,
                                 RedirectAttributes redirectAttributes, HttpSession session) {

        Staff staff = staffService.getStaffById(id);
        if (staff == null) {
            redirectAttributes.addFlashAttribute("message", "Customer not found!");
            return "redirect:/login";
        }
        staff.setName(name);
        staff.setPhone(phone);
        staffService.updateStaff(staff);
        //update session to upload new image
        session.setAttribute("user", staff);
        redirectAttributes.addFlashAttribute("message", "Update successfully!");
        if(staff.getDepartment().equalsIgnoreCase("Design"))
            return "redirect:/designer/profile";
        if(staff.getDepartment().equalsIgnoreCase("Consulting"))
            return "redirect:/projects/profile";

        return "redirect:/staff/profile";
    }


    @GetMapping("/constructor/profile")
    public String constructorProfile(Model model,  HttpSession session) {
        Staff staff = (Staff) session.getAttribute("user");
        if(staff == null)
            return "redirect:/login";

        long totalDesign = designService.countDesignsByStaff(staff.getId());
        long totalDesignInProcess = designService.countDesignsProcessingByStaffId(staff.getId());
        long totalDesignComplete= designService.countDesignsCompleteByStaffId(staff.getId());

        model.addAttribute("totalDesign", totalDesign);
        model.addAttribute("totalDesignInProcess", totalDesignInProcess);
        model.addAttribute("totalDesignComplete", totalDesignComplete);
        model.addAttribute("staff", staff);
        return "designer/profile";
    }
}
