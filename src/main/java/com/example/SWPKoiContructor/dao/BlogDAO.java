package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Blog;
import java.util.Date;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;
import javax.persistence.NoResultException;

@Repository
public class BlogDAO {

    private EntityManager entityManager;

    public BlogDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    // Retrieve a list of all blogs, ordered by date posted in descending order
    public List<Blog> getBlogList() {
        TypedQuery<Blog> query = entityManager.createQuery("Select b from Blog b where b.status = 2 order by b.datePost desc", Blog.class);
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
        try {
            return entityManager.find(Blog.class, id);
        } catch (NoResultException e) {
            return null;
        }

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
        if (deleteBlog != null) {
            entityManager.remove(deleteBlog);
        }
    }

    public Blog getBlogWithContentById(int id) {
        try {
            TypedQuery<Blog> query = entityManager.createQuery(
                    "SELECT b FROM Blog b LEFT JOIN FETCH b.introContent WHERE b.id = :id", Blog.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public List<Blog> searchByCriteria(String name, Integer status, Date dateFrom, Date dateTo, int page, int size) {
        StringBuilder queryBuilder = new StringBuilder("SELECT b FROM Blog b WHERE 1=1 ");

        // Add dynamic filters
        if (name != null && !name.isEmpty()) {
            queryBuilder.append("AND b.name LIKE :name ");
        }
        if (status != null) {
            queryBuilder.append("AND b.status = :status ");
        }
        if (dateFrom != null) {
            queryBuilder.append("AND b.datePost >= :dateFrom ");
        }
        if (dateTo != null) {
            queryBuilder.append("AND b.datePost <= :dateTo ");
        }
        queryBuilder.append("order by b.datePost desc ");

        TypedQuery<Blog> query = entityManager.createQuery(queryBuilder.toString(), Blog.class);

        // Set query parameters
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (status != null) {
            query.setParameter("status", status);
        }
        if (dateFrom != null) {
            query.setParameter("dateFrom", dateFrom);
        }
        if (dateTo != null) {
            query.setParameter("dateTo", dateTo);
        }

        // Set pagination parameters
        query.setFirstResult(page * size); // Skips previous pages' results
        query.setMaxResults(size);               // Limits results per page

        return query.getResultList();
    }

    public long countByCriteria(String name, Integer status, Date dateFrom, Date dateTo) {
        StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(b) FROM Blog b WHERE 1=1 ");

        // Add dynamic filters
        if (name != null && !name.isEmpty()) {
            queryBuilder.append("AND b.name LIKE :name ");
        }
        if (status != null) {
            queryBuilder.append("AND b.status = :status ");
        }
        if (dateFrom != null) {
            queryBuilder.append("AND b.datePost >= :dateFrom ");
        }
        if (dateTo != null) {
            queryBuilder.append("AND b.datePost <= :dateTo ");
        }

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);

        // Set query parameters
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (status != null) {
            query.setParameter("status", status);
        }
        if (dateFrom != null) {
            query.setParameter("dateFrom", dateFrom);
        }
        if (dateTo != null) {
            query.setParameter("dateTo", dateTo);
        }

        return query.getSingleResult();
    }
}
