package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.configs.security.SecurityConfig;
import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.StaffService;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;


@Controller
public class HomepageController {

    private ProjectService projectService;

    private BlogService blogService;
    private StaffService staffService;
    private CustomerService customerService;

    public HomepageController(ProjectService projectService, BlogService blogService, StaffService staffService,CustomerService customerService) {
        this.projectService = projectService;
        this.blogService = blogService;
        this.staffService = staffService;
        
        
        
    }

    @GetMapping("")
    public String HomePageShow(Model model, HttpSession session) {
        
        List<Project> projectList = projectService.getProjectListIsSharable();
        List<Staff> staffList = staffService.getTopStaffList();
        List<Blog> allBlogs = blogService.getAllBlogs();
        List<Blog> blogList;
        if (allBlogs.size() >= 3) {
            blogList = new ArrayList<>(allBlogs.subList(0, 3));
        } else {
            blogList = new ArrayList<>(allBlogs); // Get all blogs if there are fewer than 2
        }
        System.out.println("Number of projects: " + projectList.size());
        System.out.println("Number of staff: " + staffList.size());
        System.out.println("Number of blogs: " + blogList.size());
        model.addAttribute("blogList", blogList);
        model.addAttribute("projectList", projectList);
        model.addAttribute("staffList", staffList);
        return "customer/mainPage/homepage";
    }
    
    @GetMapping("/home/services")
    public String servicesShow(Model model){
        return "customer/mainPage/services";
    }

    
}
