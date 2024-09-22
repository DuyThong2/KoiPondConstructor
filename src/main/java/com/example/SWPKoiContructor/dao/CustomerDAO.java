/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Customer;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

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
    
    public Customer getCustomerById(int id){
        TypedQuery<Customer> tq = entityManager.createQuery("select c from Customer c where c.customerId = :id",Customer.class);
        tq.setParameter("id", id);
        return tq.getSingleResult();
    }
    
    public Customer getCustomerByEmail(String email){
        TypedQuery<Customer> tq = entityManager.createQuery("select c from Customer c where c.customerEmail = :id",Customer.class);
        tq.setParameter("id", email);
        return tq.getSingleResult();
    }
    
}
