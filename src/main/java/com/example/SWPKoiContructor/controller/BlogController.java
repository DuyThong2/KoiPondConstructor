package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Blog;
import com.example.SWPKoiContructor.entities.Content;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.BlogService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

    @GetMapping("/manager/blogs")
    public String manageBlogs(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Integer status,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateFrom,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date dateTo,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model
    ) {
        // Get the filtered and paginated blog list
        List<Blog> blogs = blogService.getBlogsByCriteria(name, status, dateFrom, dateTo, page, size);
        long totalBlogs = blogService.countBlogsByCriteria(name, status, dateFrom, dateTo);

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

        model.addAttribute("blog", blog);
        return "viewBlogDetail";
    }

    @GetMapping("/staff/blog/new")
    public String createBlogForm(Model model) {
        model.addAttribute("blog", new Blog());
        return "createBlog"; // JSP page name
    }

    @PostMapping("/staff/blog/new")
    public String createBlog(@ModelAttribute Blog blog,
            @RequestParam("file") MultipartFile file,
            @RequestParam("content") String content, // Get the content from the form
            Model model, HttpSession session) {
        try {
            Staff staff = (Staff) session.getAttribute("user");
            blog.addAuthor(staff);
            blog.setDatePost(new java.util.Date());
            Content contentUpdated = new Content(content);
            blog.addContent(contentUpdated);
            String imgURL = fileUtility.handleFileUpload(file, FileUtility.BLOG_DIR);
            blog.setImgUrl(imgURL);
            blogService.createBlog(blog);
            // Redirect to the blog list page after creation
            return "redirect:/blog/list";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error uploading image");

            // Return the blog form with existing data to allow the user to correct input
            model.addAttribute("blog", blog);
            return "createBlog";  // Return to the blog creation form if there is an error
        }
    }

}
