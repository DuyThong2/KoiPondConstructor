package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.BlogDAO;
import com.example.SWPKoiContructor.entities.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class BlogService {

    private BlogDAO blogDAO;

    @Autowired
    public BlogService(BlogDAO blogDAO) {
        this.blogDAO = blogDAO;
    }

    // Get all blogs ordered by date posted in descending order
    public List<Blog> getAllBlogs() {
        return blogDAO.getBlogList();
    }

    // Get blogs by keyword in title
    public List<Blog> getBlogsByKeyword(String keyword) {
        return blogDAO.getBlogListByKeyword(keyword);
    }

    // Get a specific blog by its ID
    public Blog getBlogById(int id) {
        return blogDAO.getBlogById(id);
    }

    // Create a new blog
    public Blog createBlog(Blog blog) {
        return blogDAO.createBlog(blog);
    }

    // Update an existing blog
    public Blog updateBlog(Blog blog) {
        return blogDAO.updateBlog(blog);
    }

    // Delete a blog by its ID
    public void deleteBlog(int id) {
        blogDAO.deleteBlog(id);
    }
}
