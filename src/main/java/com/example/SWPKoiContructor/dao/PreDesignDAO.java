/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.PreDesign;
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
public class PreDesignDAO {
    
   private EntityManager entityManager;

    public PreDesignDAO(EntityManager entityManager) {
       this.entityManager = entityManager;
   }
    
    public List<PreDesign> getFilteredPreDesign(int page, int size, String sortBy, String sortDirection, Boolean statusFilter, String searchName){
        StringBuilder queryStr = new StringBuilder("SELECT p FROM PreDesign p WHERE 1=1");
        // Dynamic query construction
        if (statusFilter != null) {
            queryStr.append(" AND p.preDesignStatus = :statusFilter");
        }
        if (searchName != null && !searchName.isEmpty()) {
            queryStr.append(" AND p.preDesignName LIKE :searchName");
        }        
        // Sorting
        queryStr.append(" ORDER BY p.").append(sortBy).append(" ").append(sortDirection);
        // Creating the query
        TypedQuery<PreDesign> query = entityManager.createQuery(queryStr.toString(), PreDesign.class);
        // Setting parameters dynamically
        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (searchName != null && !searchName.isEmpty()) {
            query.setParameter("searchName", "%" + searchName + "%");
        }        
        // Pagination
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }
    
    public long countFilteredPreDesign(Boolean statusFilter, String searchName) {
        StringBuilder queryStr = new StringBuilder("SELECT COUNT(p) FROM PreDesign p WHERE 1=1");
        // Dynamic query construction
        if (statusFilter != null) {
            queryStr.append(" AND p.preDesignStatus = :statusFilter");
        }
        if (searchName != null && !searchName.isEmpty()) {
            queryStr.append(" AND p.preDesignName LIKE :searchName");
        }        
        // Creating the query
        TypedQuery<Long> query = entityManager.createQuery(queryStr.toString(), Long.class);
        // Setting parameters dynamically
        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (searchName != null && !searchName.isEmpty()) {
            query.setParameter("searchName", "%" + searchName + "%");
        }
        return query.getSingleResult();
    }
    
    public List<PreDesign> getPreDesignList(int page, int size, String sortBy, String sortDirection){
        String query = "SELECT p FROM PreDesign p ORDER BY p." + sortBy + " " + sortDirection;
        TypedQuery<PreDesign> tq = entityManager.createQuery(query, PreDesign.class);
        tq.setFirstResult(page * size);
        tq.setMaxResults(size);
        return tq.getResultList();
    }
   
    public long countPreDesignList(){
         TypedQuery<Long> tq = entityManager.createQuery("SELECT COUNT(p) FROM PreDesign p", Long.class);
         return tq.getSingleResult();
    }
    
    public List<PreDesign> getPreDesignListForHomePage(int page, int size){        
        TypedQuery<PreDesign> tq = entityManager.createQuery("SELECT p FROM PreDesign p WHERE p.preDesignStatus = true ORDER BY p.preDesignName ASC", PreDesign.class);
        tq.setFirstResult(page * size);
        tq.setMaxResults(size);
        return tq.getResultList();
    }
    
    public long countPreDesignListOfHomepage(){
         TypedQuery<Long> tq = entityManager.createQuery("SELECT COUNT(p) FROM PreDesign p WHERE p.preDesignStatus = true ", Long.class);
         return tq.getSingleResult();
    }
    
    public PreDesign getPreDesignById(int preDesignId){
        TypedQuery<PreDesign> tq = entityManager.createQuery("SELECT p FROM PreDesign p WHERE p.preDesignId = :id", PreDesign.class);
        tq.setParameter("id", preDesignId);
        return tq.getSingleResult();
    }
    
    public PreDesign getPreDesignAndContentById(int preDesignId){
        try{
        TypedQuery<PreDesign> tq = entityManager.createQuery("SELECT p FROM PreDesign p JOIN FETCH p.content c WHERE p.preDesignId = :id", PreDesign.class);
        tq.setParameter("id", preDesignId);
        return tq.getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }
   
    public PreDesign createNewPreDesign(PreDesign preDesign){
        entityManager.persist(preDesign);
        return preDesign;
    }
    
    public PreDesign updatePreDesign(PreDesign preDesign){
        return entityManager.merge(preDesign);
    }
}
