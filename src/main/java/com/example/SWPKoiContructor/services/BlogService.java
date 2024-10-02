package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.BlogDAO;
import com.example.SWPKoiContructor.entities.Blog;
import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

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

    @Transactional
    public Blog createBlog(Blog blog) {
        return blogDAO.createBlog(blog);
    }

    @Transactional
    public Blog updateBlog(Blog blog) {
        return blogDAO.updateBlog(blog);
    }

    @Transactional
    public void deleteBlog(int id) {
        blogDAO.deleteBlog(id);
    }
    
    
    
    public List<Blog> getBlogsByCriteria(String name, Integer status, Date dateFrom, Date dateTo, int page, int size) {
        return blogDAO.searchByCriteria(name, status, dateFrom, dateTo, page, size);
    }

    public long countBlogsByCriteria(String name, Integer status, Date dateFrom, Date dateTo) {
        return blogDAO.countByCriteria(name, status, dateFrom, dateTo);
    }

    public Blog getBlogWithContentById(int id) {
        return blogDAO.getBlogWithContentById(id);
    }
}
