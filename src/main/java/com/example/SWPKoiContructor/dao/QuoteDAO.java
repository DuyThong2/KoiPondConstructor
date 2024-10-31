/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Quotes;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public class QuoteDAO {

    private EntityManager entityManager;

    public QuoteDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Quotes> getQuotesList() {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q", Quotes.class);
        return tq.getResultList();
    }

    //----------------------------------------------  MANAGER SITE  --------------------------------------------
    public List<Quotes> getQuotesList(int page, int size, String sortBy, String sortDirection) {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q ORDER BY q." + sortBy + " " + sortDirection, Quotes.class);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }

    public List<Quotes> getQuotesList(int page, int size, String sortBy, String sortDirection, int status) {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q WHERE q.quotesStatus = :status ORDER BY q." + sortBy + " " + sortDirection, Quotes.class);
        tq.setParameter("status", status);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }

    public long countQuotesByStatus(int status) {
        TypedQuery<Long> tq = entityManager.createQuery("SELECT Count(q) FROM Quotes q WHERE q.quotesStatus = :status", Long.class);
        tq.setParameter("status", status);
        return tq.getSingleResult();
    }

    public long countQuotes() {
        TypedQuery<Long> tq = entityManager.createQuery("SELECT Count(q) FROM Quotes q", Long.class);
        return tq.getSingleResult();
    }

    //----------------------------------------------  CONSULTANT SITE  -----------------------------------------
    public List<Quotes> getQuotesListByStaffId(int staffId, int page, int size, String sortBy, String sortDirection) {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q WHERE q.staff.id = :staffId ORDER BY q." + sortBy + " " + sortDirection, Quotes.class);
        tq.setParameter("staffId", staffId);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }

    public List<Quotes> getQuotesListByStaffId(int staffId, int page, int size, String sortBy, String sortDirection, int status) {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q WHERE q.quotesStatus = :status AND q.staff.id = :staffId ORDER BY q." + sortBy + " " + sortDirection, Quotes.class);
        tq.setParameter("staffId", staffId);
        tq.setParameter("status", status);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }

    public long countQuotesOfStaffByStatus(int staffId, int status) {
        TypedQuery<Long> tq = entityManager.createQuery("SELECT Count(q) FROM Quotes q WHERE q.quotesStatus = :status AND q.staff.id = :staffId", Long.class);
        tq.setParameter("staffId", staffId);
        tq.setParameter("status", status);
        return tq.getSingleResult();
    }

    public long countQuotesOfStaff(int staffId) {
        TypedQuery<Long> tq = entityManager.createQuery("SELECT Count(q) FROM Quotes q WHERE q.staff.id = :staffId", Long.class);
        tq.setParameter("staffId", staffId);
        return tq.getSingleResult();
    }
    //-------------------------------------------------------  CUSTOMER  --------------------------------------------------------------
    public List<Quotes> getFilteredQuoteCustomer(int page, int size, String sortBy, String sortDirection,
            LocalDate fromDate, LocalDate toDate, int cusId){
        StringBuilder queryStr = new StringBuilder("SELECT q FROM Quotes q WHERE 1=1 AND q.customer.id = :id AND (q.quotesStatus = 2 OR q.quotesStatus >= 4)");
       
        // Dynamic query construction
        if (fromDate != null) {
            queryStr.append(" AND q.quotesDate >= :fromDate");
        }
        if (toDate != null) {
            queryStr.append(" AND q.quotesDate <= :toDate");
        }

        // Sorting
        queryStr.append(" ORDER BY q.").append(sortBy).append(" ").append(sortDirection);

        // Creating the query
        TypedQuery<Quotes> query = entityManager.createQuery(queryStr.toString(), Quotes.class);

        query.setParameter("id", cusId);
        // Setting parameters dynamically       
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
    
    public long countFilteredQuoteCustomer(LocalDate fromDate, LocalDate toDate, int cusId){
        StringBuilder queryStr = new StringBuilder("SELECT COUNT(q) FROM Quotes q WHERE 1=1 AND q.customer.id = :id AND (q.quotesStatus = 2 OR q.quotesStatus >= 4)");
       
        // Dynamic query construction
        if (fromDate != null) {
            queryStr.append(" AND q.quotesDate >= :fromDate");
        }
        if (toDate != null) {
            queryStr.append(" AND q.quotesDate <= :toDate");
        }

        // Creating the query
        TypedQuery<Long> query = entityManager.createQuery(queryStr.toString(), Long.class);

        query.setParameter("id", cusId);
        // Setting parameters dynamically       
        if (fromDate != null) {
            query.setParameter("fromDate", java.sql.Date.valueOf(fromDate));  // Convert LocalDate to java.sql.Date
        }
        if (toDate != null) {
            query.setParameter("toDate", java.sql.Date.valueOf(toDate));  // Convert LocalDate to java.sql.Date
        }

        return query.getSingleResult();
    }
    
    

    //-------------------------------------------------------  OTHER  --------------------------------------------------------------
    public List<Quotes> getQuotesListByStaffId(int staffId) {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q WHERE q.staff.id = :id", Quotes.class);
        tq.setParameter("id", staffId);
        return tq.getResultList();
    }

    public List<Quotes> getQuotesListByCusIdAndStatus(int cusId) {
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q WHERE q.customer.id = :id and q.quotesStatus >= 2 AND q.quotesStatus != 3", Quotes.class);
        tq.setParameter("id", cusId);
        return tq.getResultList();
    }

    public Quotes getQuoteById(int id) {
        try {
            TypedQuery<Quotes> tq = entityManager.createQuery("select q from Quotes q where q.quotesId = :id", Quotes.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public Quotes createNewQuotes(Quotes quotes) {
        Quotes newQuotes = entityManager.merge(quotes);
        return newQuotes;
    }

    public Quotes saveQuote(Quotes quotes) {
        return entityManager.merge(quotes);
    }

    public Quotes updateQuoteStatus(int quoteId, int quoteStatus) {
        Quotes quotes = getQuoteById(quoteId);
        quotes.setQuotesStatus(quoteStatus);
        return quotes;
    }

    public long countQuotesPeding() {
        TypedQuery<Long> tq = entityManager.createQuery(
                "SELECT Count(q) FROM Quotes q WHERE q.quotesStatus = 1", Long.class);
        Long result = tq.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }
    
    public long test(){
        return 0;
    }
}
