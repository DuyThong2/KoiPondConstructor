/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.PaymentHistory;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */

@Repository
public class PaymentHistoryDAO {
    
    private EntityManager entityManager;

    
    @Autowired
    public PaymentHistoryDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    
    
    
    
    
    
    public List<PaymentHistory> getFilteredPayments(
    int page, int size, 
    String sortBy, String sortDirection, 
    String paymentMethod, 
    String searchDescription, 
    LocalDateTime fromDate, 
    LocalDateTime toDate,
    Integer customerId,  // ID of the customer to filter, null if manager
    String userRole  // Role of the user: 'CUSTOMER' or 'MANAGER'
) {
    StringBuilder queryStr = new StringBuilder("SELECT p FROM PaymentHistory p WHERE 1=1");

    // Role-based filtering
    if ("CUSTOMER".equals(userRole) && customerId != null) {
        queryStr.append(" AND p.customer.id = :customerId");
    }

    // Filtering conditions
    if (paymentMethod != null && !paymentMethod.isEmpty()) {
        queryStr.append(" AND p.paymentMethod = :paymentMethod");
    }
    if (searchDescription != null && !searchDescription.isEmpty()) {
        queryStr.append(" AND p.description LIKE :searchDescription");
    }
    if (fromDate != null) {
        queryStr.append(" AND p.paymentDate >= :fromDate");
    }
    if (toDate != null) {
        queryStr.append(" AND p.paymentDate <= :toDate");
    }

    // Sorting
    queryStr.append(" ORDER BY p.").append(sortBy).append(" ").append(sortDirection);

    // Creating the query
    TypedQuery<PaymentHistory> query = entityManager.createQuery(queryStr.toString(), PaymentHistory.class);

    // Setting parameters dynamically
    if ("CUSTOMER".equals(userRole) && customerId != null) {
        query.setParameter("customerId", customerId);
    }
    if (paymentMethod != null && !paymentMethod.isEmpty()) {
        query.setParameter("paymentMethod", paymentMethod);
    }
    if (searchDescription != null && !searchDescription.isEmpty()) {
        query.setParameter("searchDescription", "%" + searchDescription + "%");
    }
    if (fromDate != null) {
        query.setParameter("fromDate", fromDate);
    }
    if (toDate != null) {
        query.setParameter("toDate", toDate);
    }

    // Pagination
    query.setFirstResult(page * size);
    query.setMaxResults(size);

    return query.getResultList();
}
    
    public long countFilteredPayments(
    String paymentMethod, 
    String searchDescription, 
    LocalDateTime fromDate, 
    LocalDateTime toDate,
    Integer customerId,
    String userRole
) {
    StringBuilder queryStr = new StringBuilder("SELECT COUNT(p) FROM PaymentHistory p WHERE 1=1");

    // Role-based filtering
    if ("CUSTOMER".equals(userRole) && customerId != null) {
        queryStr.append(" AND p.customer.id = :customerId");
    }

    // Filtering conditions
    if (paymentMethod != null && !paymentMethod.isEmpty()) {
        queryStr.append(" AND p.paymentMethod = :paymentMethod");
    }
    if (searchDescription != null && !searchDescription.isEmpty()) {
        queryStr.append(" AND p.description LIKE :searchDescription");
    }
    if (fromDate != null) {
        queryStr.append(" AND p.paymentDate >= :fromDate");
    }
    if (toDate != null) {
        queryStr.append(" AND p.paymentDate <= :toDate");
    }

    // Creating the query
    TypedQuery<Long> query = entityManager.createQuery(queryStr.toString(), Long.class);

    // Setting parameters dynamically
    if ("CUSTOMER".equals(userRole) && customerId != null) {
        query.setParameter("customerId", customerId);
    }
    if (paymentMethod != null && !paymentMethod.isEmpty()) {
        query.setParameter("paymentMethod", paymentMethod);
    }
    if (searchDescription != null && !searchDescription.isEmpty()) {
        query.setParameter("searchDescription", "%" + searchDescription + "%");
    }
    if (fromDate != null) {
        query.setParameter("fromDate", fromDate);
    }
    if (toDate != null) {
        query.setParameter("toDate", toDate);
    }

    return query.getSingleResult();
}
    
     
    public PaymentHistory createPayment(PaymentHistory payment) {
        entityManager.persist(payment);
        return payment;
    }

   
    public PaymentHistory updatePayment(PaymentHistory payment) {
        return entityManager.merge(payment);
    }

   
    public void deletePayment(UUID paymentId) {
        PaymentHistory payment = entityManager.find(PaymentHistory.class, paymentId);
        if (payment != null) {
            entityManager.remove(payment);
        }
    }
    
    public PaymentHistory getById(UUID paymentId) {
        try{
            return entityManager.find(PaymentHistory.class, paymentId);
        }catch(NoResultException e){
            return null;
        }
        
    }


}
