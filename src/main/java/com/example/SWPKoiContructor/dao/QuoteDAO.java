/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Quotes;
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

    
    public List<Quotes> getQuotesListByStaffId(int staffId){
        TypedQuery<Quotes> tq = entityManager.createQuery("SELECT q FROM Quotes q WHERE q.staff.id = :id", Quotes.class);
        tq.setParameter("id", staffId);
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
    
    public Quotes updateQuoteStatus(int quoteId, int quoteStatus){
        Quotes quotes = getQuoteById(quoteId);
        quotes.setQuotesStatus(quoteStatus);
        return quotes;
    }
}
