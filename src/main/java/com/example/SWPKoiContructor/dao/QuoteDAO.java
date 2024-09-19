/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Quotes;
import javax.persistence.EntityManager;
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
    
    public Quotes getQuoteById(int id){
        TypedQuery<Quotes> tq = entityManager.createQuery("select q from Quotes q where q.quotesId = :id", Quotes.class);
        tq.setParameter("id", id);
        return tq.getSingleResult();
    }
}
