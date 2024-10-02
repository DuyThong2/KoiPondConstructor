/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Feedback;
import java.util.List;
import javax.persistence.EntityManager;
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
    
    public List<Feedback> getFeedBackList(){
        TypedQuery<Feedback> tq = entityManager.createQuery("SELECT f FROM Feedback f", Feedback.class);
        return tq.getResultList();
    }
    
    public Feedback saveFeedback(Feedback feedback){
        return entityManager.merge(feedback);
    }
}
