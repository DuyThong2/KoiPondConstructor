package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Blog;
import com.example.SWPKoiContructor.entities.Content;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
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

@Controller
public class BlogController {

    private BlogService blogService;
    private FileUtility fileUtility;

    public BlogController(BlogService blogService, FileUtility fileUtility) {
        this.blogService = blogService;
        this.fileUtility = fileUtility;
    }

    

    @GetMapping("/staff/blogs")
    public String staffBlogs(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Integer status,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateFrom,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateTo,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model,
            HttpSession session
    ) {
        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null){
            return "redirect:/login";
        }
        List<Blog> blogs = blogService.getBlogsByCriteria(name, status, dateFrom, dateTo, page, size);
        if (!"Management".equalsIgnoreCase(staff.getDepartment())){
            blogs = blogs.stream()
                .filter(blog -> blog.isBlogBelongToAuthor(staff))
                .collect(Collectors.toList());
        }
        
        long totalBlogs = blogs.size();

        // Add attributes to the model
        model.addAttribute("blogs", blogs);
        model.addAttribute("totalBlogs", totalBlogs);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", size);
        model.addAttribute("totalPages", (int) Math.ceil((double) totalBlogs / size));

        return "manager/blog/blogManage";
    }

    @GetMapping("/staff/blog/viewDetail/{id}")
    public String viewDetailBlog(@PathVariable("id") int id, Model model, HttpSession session) {
        Blog blog = blogService.getBlogWithContentById(id);
        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null)
            return "redirect:/login";
        if (blog != null && (blog.isBlogBelongToAuthor(staff) || "Management".equalsIgnoreCase(staff.getDepartment()))) {
            model.addAttribute("blog", blog);
            return "/manager/blog/blogDetail";
        } else {
            if ("manager".equalsIgnoreCase(staff.getDepartment())) {
                return "redirect:/manager/blogs";
            } else {
                return "redirect:/staff/blogs";
            }

        }

    }

    @GetMapping("/staff/blog/new")
    public String createBlogForm(Model model) {
        model.addAttribute("blog", new Blog());
        return "manager/blog/createBlog"; // JSP page name
    }

    @PostMapping("/staff/blog/new")
    public String createBlog(@ModelAttribute Blog blog,
            @RequestParam("file") MultipartFile file,
            @RequestParam("content") String content, // Get the content from the form
            Model model, HttpSession session) {
        try {
            Staff staff = (Staff) session.getAttribute("user");
            blog.setStaff(staff);
            blog.setDatePost(new java.util.Date());
            Content contentUpdated = new Content(content);
            blog.addContent(contentUpdated);
            String imgURL = fileUtility.handleFileUpload(file, FileUtility.BLOG_DIR);
            blog.setImgUrl(imgURL);
            blog.setStatus(1);
            blogService.createBlog(blog);
            // Redirect to the blog list page after creation
            return "redirect:/blog/list";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error uploading image");

            // Return the blog form with existing data to allow the user to correct input
            model.addAttribute("blog", blog);
            return "redirect:/staff/blogs";
        }
    }

    @GetMapping("/staff/blog/update/{id}")
    public String createUpdateForm(Model model, HttpSession session, @PathVariable("id") int blogId) {
        Blog blog = blogService.getBlogWithContentById(blogId);
        Staff staff = (Staff) session.getAttribute("user");

        if (blog != null && blog.isBlogBelongToAuthor(staff)) {
            model.addAttribute("blog", blog);
            return "manager/blog/editBlog";
        } else {
            return "redirect:/staff/blogs";
        }

    }

    @PostMapping("/staff/blog/update")
    public String updateBlog(@ModelAttribute Blog blog,
            @RequestParam("file") MultipartFile file,
            @RequestParam("content") String content, // Get the content from the form
            Model model) {
        try {
            Blog originBlog = blogService.getBlogWithContentById(blog.getId());
            if (originBlog != null) {
                originBlog.setName(blog.getName());
                originBlog.setDescription(blog.getDescription());
                originBlog.setStatus(1);
                String imgURL = fileUtility.handleFileUpload(file, FileUtility.BLOG_DIR);
                if (imgURL != null) {
                    blog.setImgUrl(imgURL);
                }

                Content contentUpdated = originBlog.getIntroContent();
                contentUpdated.setContent(content);
                contentUpdated.setLastUpdatedDate(new java.util.Date());
                blogService.updateBlog(originBlog);
                return "redirect:/staff/blog/viewDetail/" + originBlog.getId();
            } else {
                return "redirect:/staff/blogs";
            }

            // Redirect to the blog list page after creation
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/staff/blogs";
        }
    }

}
