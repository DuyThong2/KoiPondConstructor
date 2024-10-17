package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.PreDesignService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.ServiceService;
import com.example.SWPKoiContructor.services.StaffService;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomepageController {

    @Value("${spring.application.name}")
    private String contextPath;

    private ProjectService projectService;
    private PreDesignService preDesignService;
    private BlogService blogService;
    private StaffService staffService;
    private CustomerService customerService;
    private ServiceService serviceService;

    public HomepageController(ProjectService projectService, PreDesignService preDesignService, BlogService blogService, StaffService staffService, CustomerService customerService, ServiceService serviceService) {
        this.projectService = projectService;
        this.preDesignService = preDesignService;
        this.blogService = blogService;
        this.staffService = staffService;
        this.customerService = customerService;
        this.serviceService = serviceService;
    }

    @GetMapping("")
    public String homePageShow(Model model) {

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
    public String servicesShow(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        int pageSize = 6; // Number of services per page

        // Fetch services for the current page
        List<Service> services = serviceService.getPaginationServiceListByStatus(page,pageSize,null,null,true);
        model.addAttribute("services", services);
        model.addAttribute("currentPage", page);

        // Get the total number of active services using a count method
        long totalServices = serviceService.countServiceFilter(Boolean.TRUE);

        // Calculate the total number of pages
        int totalPages = (int) Math.ceil((double) totalServices / pageSize);
        model.addAttribute("totalPages", totalPages);

        // Check if there are more services for the next page
        boolean hasMoreServices = page < totalPages;
        model.addAttribute("hasMoreServices", hasMoreServices);

        return "customer/mainPage/services";
    }

    @GetMapping("/home/services/{id}")
    public String servicesShowDetail(Model model, @PathVariable("id") int id) {
        Service service = serviceService.getServiceWithContentById(id);
        if (service != null && service.isServiceStatus()) {
            model.addAttribute("service", service);
            return "customer/mainPage/serviceDetail";
        } else {
            return "redirect:/"+ contextPath +"/home/services";
        }

    }

    @GetMapping("/home/preDesign")
    public String getPreDesignList(@RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "6") int size,
            Model model) {
        List<PreDesign> preDesignList = preDesignService.getPreDesignListForHomePage(page, size);
        long totalPreDesign = preDesignService.countPreDesignListOfHomePage();

        model.addAttribute("preDesignList", preDesignList);
        model.addAttribute("currentPage", page + 1); // Incrementing for display purposes (page index starts from 0)
        model.addAttribute("totalPages", (int) Math.ceil((double) totalPreDesign / size));
        model.addAttribute("hasMoreServices", (page + 1) * size < totalPreDesign);

        return "customer/mainPage/preDesign";
    }

    @GetMapping("/home/preDesign/{id}")
    public String getPreDesignDetail(Model model, @PathVariable("id") int id) {
//        Project project = projectService.getProjectWithContent(id);
        PreDesign preDesign = preDesignService.getPreDesignAndContentById(id);
        if (preDesign != null && preDesign.isPreDesignStatus() && preDesign.getContent() != null) {

            model.addAttribute("preDesign", preDesign);
            return "customer/mainPage/preDesignDetail";
        } else {
            return "redirect:/"+ contextPath +"/home/preDesign";
        }

    }

    @GetMapping("/home/projects")
    public String getSharedProjects(@RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "6") int size,
            Model model) {
        // Retrieve the paginated list of projects
        List<Project> projects = projectService.findPaginatedProjectsForShowing(page,size);
        long totalProjects = projectService.countSharedProjects();
        System.out.println(totalProjects);

        model.addAttribute("projects", projects);
        model.addAttribute("currentPage", page); // Incrementing for display purposes (page index starts from 0)
        model.addAttribute("totalPages", (int) Math.ceil((double) totalProjects / size));
        model.addAttribute("hasMoreServices", (page) * size < totalProjects);

        return "customer/mainPage/projects";  // JSP page name
    }

    @GetMapping("/home/projects/{id}")
    public String getProjectDetail(Model model, @PathVariable("id") int id) {
        Project project = projectService.getProjectWithContent(id);
        if (project != null && project.isIsSharedAble() && project.getContent() != null) {

            model.addAttribute("project", project);
            return "customer/mainPage/projectDetail";
        } else {
            return "redirect:/"+ contextPath +"/home/projects";
        }

    }

    @GetMapping("/home/blogs")
    public String getBlogPosts(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "3") int size,
            Model model) {

        // Convert page number to 0-based for internal use
        int adjustedPage = page - 1;

        // Parse LocalDate from request parameters
        // Fetch paginated blogs based on criteria
        List<Blog> blogs = blogService.getBlogsByCriteria(null, 1, null, null, adjustedPage, size);

        // Fetch total count for pagination
        long totalBlogs = blogService.countBlogsByCriteria(null, 1, null, null);

        // Calculate total pages and whether there are more blogs for pagination
        int totalPages = (int) Math.ceil((double) totalBlogs / size);
        boolean hasMoreBlogs = page < totalPages;
        System.out.println(hasMoreBlogs);

        // Add attributes to the model for the view
        model.addAttribute("blogs", blogs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("hasMoreServices", hasMoreBlogs);

        return "customer/mainPage/blogs";  // Return the view name that will display the blogs
    }

    @GetMapping("/home/blogs/{id}")
    public String getBlogPosts(Model model, @PathVariable("id") int id) {
        Blog blog = blogService.getBlogWithContentById(id);
        if (blog != null) {
            model.addAttribute("blog", blog);
            return "customer/mainPage/blogDetail";
        }
        return "redirect:/"+ contextPath +"/home/blogs";

    }

    @GetMapping("/home/packages")
    public String getPackets(Model model) {

        return "customer/mainPage/pricingPackage";

    }

}
