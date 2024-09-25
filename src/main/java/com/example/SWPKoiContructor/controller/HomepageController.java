package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Blog;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomepageController {
    private FileUtility fileUtility;
    private ProjectService projectService;

    private BlogService blogService;
    private StaffService staffService;


    @Autowired
    public HomepageController(ProjectService projectService, FileUtility fileUtility,StaffService staffService,BlogService blogService) {
        this.projectService = projectService;
        this.fileUtility = fileUtility;
        this.staffService= staffService;
        this.blogService = blogService;
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


}
