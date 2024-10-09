/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Customer;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.example.SWPKoiContructor.entities.Staff;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@Repository
public class CustomerDAO {

    private EntityManager entityManager;

    public CustomerDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Customer getCustomerById(int id) {
        try {
            TypedQuery<Customer> tq = entityManager.createQuery("select c from Customer c where c.id = :id", Customer.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null; // Return empty if no customer is found
        }

    }

    public Customer getCustomerByEmail(String email) {
        try {
            return entityManager.createQuery("SELECT c FROM Customer c WHERE c.email = :email", Customer.class)
                    .setParameter("email", email)
                    .getSingleResult();

        } catch (NoResultException e) {
            return null; // Return empty if no customer is found
        }
    }

    public void createCustomer(Customer customer) {
        entityManager.persist(customer);
    }

    public Customer updateCustomer(Customer customer) {
        return entityManager.merge(customer);
    }

    public boolean isCustomerExists(String email) {
        TypedQuery<Long> query = entityManager.createQuery(
                "SELECT COUNT(c) FROM Customer c WHERE c.email = :email", Long.class);
        query.setParameter("email", email);
        Long count = query.getSingleResult();
        return count > 0;
    }

    // Lấy danh sách Customer với điều kiện email và trạng thái
    public List<Customer> getFilterListOfCustomer(String name, String email, Boolean status, int page, int size) {
        StringBuilder queryBuilder = new StringBuilder("SELECT c FROM Customer c WHERE 1 = 1");

        if (email != null && !email.isEmpty()) {
            queryBuilder.append(" AND c.email LIKE :email");
        }
        if (name != null && !name.isEmpty()) {
            queryBuilder.append(" AND c.name LIKE :name");
        }
        if (status != null) {
            queryBuilder.append(" AND c.enabled = :enabled");
        }

        TypedQuery<Customer> query = entityManager.createQuery(queryBuilder.toString(), Customer.class);

        if (email != null && !email.isEmpty()) {
            query.setParameter("email", "%" + email + "%");
        }
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (status != null) {
            query.setParameter("enabled", status);
        }

        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countFilterCustomer(String name, String email, Boolean status) {
        StringBuilder queryBuilder = new StringBuilder("SELECT count(c) FROM Customer c WHERE 1 = 1");

        if (email != null && !email.isEmpty()) {
            queryBuilder.append(" AND c.email LIKE :email");
        }
        if (name != null && !name.isEmpty()) {
            queryBuilder.append(" AND c.name LIKE :name");
        }
        if (status != null) {
            queryBuilder.append(" AND c.enabled = :enabled");
        }

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);

        if (email != null && !email.isEmpty()) {
            query.setParameter("email", "%" + email + "%");
        }
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (status != null) {
            query.setParameter("enabled", status);
        }
        return query.getSingleResult();
    }

}
