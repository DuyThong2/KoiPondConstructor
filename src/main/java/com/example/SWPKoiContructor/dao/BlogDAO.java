package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Blog;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class BlogDAO {

    private EntityManager entityManager;

    public BlogDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    // Retrieve a list of all blogs, ordered by date posted in descending order
    public List<Blog> getBlogList() {
        TypedQuery<Blog> query = entityManager.createQuery("Select b from Blog b order by b.datePost desc", Blog.class);
        return query.getResultList();
    }

    // Retrieve a list of blogs that contain a specific keyword in the title
    public List<Blog> getBlogListByKeyword(String keyword) {
        TypedQuery<Blog> query = entityManager.createQuery("Select b from Blog b where b.name like :keyword order by b.datePost desc", Blog.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }

    // Retrieve a specific blog by its ID
    public Blog getBlogById(int id) {
        return entityManager.find(Blog.class, id);
    }

    // Create a new blog
    public Blog createBlog(Blog blog) {
        entityManager.persist(blog);
        return blog;
    }

    // Update an existing blog
    public Blog updateBlog(Blog blog) {
        return entityManager.merge(blog);
    }

    // Delete a blog by its ID
    public void deleteBlog(int id) {
        Blog deleteBlog = this.getBlogById(id);
        if (deleteBlog != null)
            entityManager.remove(deleteBlog);
    }
}

