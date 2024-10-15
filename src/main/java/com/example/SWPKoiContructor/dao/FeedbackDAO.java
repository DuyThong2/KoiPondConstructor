/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Feedback;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP
 */
@Repository
public class FeedbackDAO {

    private EntityManager entityManager;

    public FeedbackDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Feedback> getFeedBackList() {
        TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f", Feedback.class);
        return tq.getResultList();
    }

    public Feedback saveFeedback(Feedback feedback) {
        return entityManager.merge(feedback);
    }
    
    //---------------------------------  QUOTES  --------------------------------------
    public Feedback getLatestFeedback(int quotesId, int from_user, int to_user) {
        try{
            TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.quotes.quotesId = :quotesId AND f.fromUser.id = :fromUser AND f.toUser.id = :toUser ORDER BY f.feedbackId DESC", Feedback.class);
            tq.setParameter("quotesId", quotesId);
            tq.setParameter("fromUser", from_user);
            tq.setParameter("toUser", to_user);
            tq.setMaxResults(1);
            return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
    
    public Feedback getLatestFeedbackFromManager(int quotesId, int to_user) {
        try{
            TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.quotes.quotesId = :quotesId AND f.fromUser.authority.authority LIKE '%MANAGER%' AND f.toUser.id = :toUser ORDER BY f.feedbackId DESC", Feedback.class);
            tq.setParameter("quotesId", quotesId);
            tq.setParameter("toUser", to_user);
            tq.setMaxResults(1);
            return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
    
    public Feedback getFeedbackForCancel(int quotesId){
        try{
            TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.quotes.quotesId = :quotesId AND f.toUser.authority.authority LIKE '%MANAGER%' ORDER BY f.feedbackId DESC", Feedback.class);
            tq.setParameter("quotesId", quotesId);
            tq.setMaxResults(1);
            return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
    
    //-------------------------------------- CONTRACT  -------------------------------
    public Feedback getLatestContractFeedback(int contractId, int from_user, int to_user) {
        try{
            TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.contract.contractId = :contractId AND f.fromUser.id = :fromUser AND f.toUser.id = :toUser ORDER BY f.feedbackId DESC", Feedback.class);
            tq.setParameter("contractId", contractId);
            tq.setParameter("fromUser", from_user);
            tq.setParameter("toUser", to_user);
            tq.setMaxResults(1);
            return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
    
    public Feedback getLatestContractFeedbackFromManager(int contractId, int to_user) {
        try{
            TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.contract.contractId = :contractId AND f.fromUser.authority.authority LIKE '%MANAGER%' AND f.toUser.id = :toUser ORDER BY f.feedbackId DESC", Feedback.class);
            tq.setParameter("contractId", contractId);
            tq.setParameter("toUser", to_user);
            tq.setMaxResults(1);
            return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
    
    public Feedback getManagerSelfFeedback(int contractId){
        try{
            TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.contract.contractId = :contractId AND f.fromUser.authority.authority LIKE '%MANAGER%' ORDER BY f.feedbackId DESC", Feedback.class);
            tq.setParameter("contractId", contractId);
            tq.setMaxResults(1);
            return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
    
    //-------------------------- SERVICE QUOTE  -------------------------
    public Feedback getLatestFeedback(int serviceQuoteId){
        TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f WHERE f.serviceQuotes.serviceQuotesId = :serviceQuoteId ORDER BY f.feedbackId DESC", Feedback.class);
        tq.setParameter("serviceQuoteId", serviceQuoteId);
        tq.setMaxResults(1);
        return tq.getSingleResult();       
    }
}
