/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.User;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP
 */
@Repository
public class ServiceQuoteDAO {
    
    private EntityManager entityManager;

    public ServiceQuoteDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    //-----------------------------  GET LIST SECTION  ---------------------------------------------
    //lay ra list serviceQuotes
    public List<ServiceQuotes> getFilteredServiceQuoteConsultant(int page, int size, String sortBy, String sortDirection,
            Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate, User staff){
        StringBuilder queryStr = new StringBuilder("SELECT s FROM ServiceQuotes s WHERE 1=1 AND s.staff.id = :id");

        // Dynamic query construction
        if (statusFilter != null) {
            queryStr.append(" AND s.serviceQuotesStatus = :statusFilter");
        }
        if (searchName != null && !searchName.isEmpty()) {
            queryStr.append(" AND s.serviceQuotesName LIKE :searchName");
        }
        if (fromDate != null) {
            queryStr.append(" AND s.serviceQuotesDate >= :fromDate");
        }
        if (toDate != null) {
            queryStr.append(" AND s.serviceQuotesDate <= :toDate");
        }

        // Sorting
        queryStr.append(" ORDER BY s.").append(sortBy).append(" ").append(sortDirection);

        // Creating the query
        TypedQuery<ServiceQuotes> query = entityManager.createQuery(queryStr.toString(), ServiceQuotes.class);

        // Setting parameters dynamically
        query.setParameter("id", staff.getId());
        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (searchName != null && !searchName.isEmpty()) {
            query.setParameter("searchName", "%" + searchName + "%");
        }
        if (fromDate != null) {
            query.setParameter("fromDate", java.sql.Date.valueOf(fromDate));  // Convert LocalDate to java.sql.Date
        }
        if (toDate != null) {
            query.setParameter("toDate", java.sql.Date.valueOf(toDate));  // Convert LocalDate to java.sql.Date
        }

        // Pagination
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }
    
    // count filtered 
    public long countFilteredServiceQuoteConsultant(Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate, User staff) {
        StringBuilder queryStr = new StringBuilder("SELECT COUNT(s) FROM ServiceQuotes s WHERE 1=1 AND s.staff.id = :id");

        // Dynamic query construction
        if (statusFilter != null) {
            queryStr.append(" AND s.serviceQuotesStatus = :statusFilter");
        }
        if (searchName != null && !searchName.isEmpty()) {
            queryStr.append(" AND s.serviceQuotesName LIKE :searchName");
        }
        if (fromDate != null) {
            queryStr.append(" AND s.serviceQuotesDate >= :fromDate");
        }
        if (toDate != null) {
            queryStr.append(" AND s.serviceQuotesDate <= :toDate");
        }

        // Creating the query
        TypedQuery<Long> query = entityManager.createQuery(queryStr.toString(), Long.class);

        // Setting parameters dynamically
        query.setParameter("id", staff.getId());
        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (searchName != null && !searchName.isEmpty()) {
            query.setParameter("searchName", "%" + searchName + "%");
        }
        if (fromDate != null) {
            query.setParameter("fromDate", java.sql.Date.valueOf(fromDate));  // Convert LocalDate to java.sql.Date
        }
        if (toDate != null) {
            query.setParameter("toDate", java.sql.Date.valueOf(toDate));  // Convert LocalDate to java.sql.Date
        }

        return query.getSingleResult();
    }
    //---------------- GET DETAIL SECTION -------------------------------
    public ServiceQuotes getServiceQuoteById(int id) {
        try {
            TypedQuery<ServiceQuotes> tq = entityManager.createQuery("SELECT s FROM ServiceQuotes s WHERE s.serviceQuotesId = :id", ServiceQuotes.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            // Handle no result case, perhaps return null or throw a custom exception
            return null; // or throw new EntityNotFoundException("Contract not found for ID: " + id);
        }
    }
    
    //-----------------  CREATE SECTION  --------------------------------
    public ServiceQuotes createNewServiceQuote(ServiceQuotes serviceQuotes){
        ServiceQuotes newServiceQuotes = entityManager.merge(serviceQuotes);
        return newServiceQuotes;
    }
    
    public ServiceQuotes saveServiceQuotes(ServiceQuotes serviceQuotes){
        return entityManager.merge(serviceQuotes);
    }
}
