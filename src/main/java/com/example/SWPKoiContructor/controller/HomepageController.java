package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.entities.Blog;
import com.example.SWPKoiContructor.entities.PasswordResetToken;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.services.UserService;
import com.example.SWPKoiContructor.services.functionalService.EmailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.validation.Valid;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomepageController {

    private ProjectService projectService;

    private BlogService blogService;
    private StaffService staffService;
    

    public HomepageController(ProjectService projectService, BlogService blogService, StaffService staffService) {
        this.projectService = projectService;
        this.blogService = blogService;
        this.staffService = staffService;
        
        
        
    }

    @GetMapping("")
    public String HomePageShow(Model model) {
        List<Project> projectList = projectService.getProjectListIsSharable();
        List<Staff> staffList = staffService.getTopStaffList();

        List<Blog> allBlogs = blogService.getAllBlogs();
        List<Blog> blogList;
        if (allBlogs.size() >= 3) {
            blogList = new ArrayList<>(allBlogs.subList(0, 3));
        } else {
            blogList = new ArrayList<>(allBlogs); // Get all blogs if there are fewer than 2
        }
        model.addAttribute("blogList", blogList);
        model.addAttribute("projectList", projectList);
        model.addAttribute("staffList", staffList);
        return "customer/homepage";
    }

    
}
