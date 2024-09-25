package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.entities.Blog;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomepageController {
   
    private ProjectService projectService;

    private BlogService blogService;
    private StaffService staffService;
    private CustomerService customerService;

    public HomepageController(ProjectService projectService, BlogService blogService, StaffService staffService, CustomerService customerService) {
        this.projectService = projectService;
        this.blogService = blogService;
        this.staffService = staffService;
        this.customerService = customerService;
    }

    
    @GetMapping("")
    public String HomePageShow(Model model){
        List<Project> projectList = projectService.getProjectListIsSharable();
        List<Staff> staffList = staffService.getTopStaffList();

        List<Blog> allBlogs = blogService.getAllBlogs();
        List<Blog> blogList;
        if (allBlogs.size() >= 3) {
            blogList = new ArrayList<>(allBlogs.subList(0, 3));
        } else {
            blogList = new ArrayList<>(allBlogs); // Get all blogs if there are fewer than 2
        }
        model.addAttribute("blogList",blogList);
        model.addAttribute("projectList",projectList);
        model.addAttribute("staffList", staffList);
        return "customer/homepage";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

//    @GetMapping("/showRegistrationForm")
//    public String showMyLoginPage(Model theModel) {
//        theModel.addAttribute("webUser", new WebUser());
//        return "register/registration-form";
//    }

    @GetMapping("/login")
    public String login() {
        return "login";  // returns login.jsp
    }

    @GetMapping("/error/error-403")
    public String error403() {
        return "error/error-403";
    }
    
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("customerDTO", new CustomerDTO());
        return "registerCustomer";  // Return the registration view (register.jsp or other)
    }

    @PostMapping("/register")
    public String registerCustomer(@ModelAttribute("customerDTO") @Valid CustomerDTO customerDTO,
                                   BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "registerCustomer";  // Return to form if there are errors
        }

        customerService.registerCustomer(customerDTO);
        model.addAttribute("message", "Registration successful!");
        return "redirect:/login";  // Redirect to success page after registration
    }


}
