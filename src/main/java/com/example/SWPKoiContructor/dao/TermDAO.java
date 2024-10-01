/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Term;
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
public class TermDAO {
    
    
    private EntityManager em;

    public TermDAO(EntityManager em) {
        this.em = em;
    }
    
    public List<Term> getAllTemplateTerms(){
        TypedQuery<Term> tq = em.createQuery("select t from Term t where t.isTemplate = 1",Term.class);
        return tq.getResultList();
    }
    
    public Term getTermById(int id){
        try{
            TypedQuery<Term> tq = em.createQuery("select t from Term t where t.termId = :id",Term.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        
        }catch(NoResultException e){
            
            return null;
        }
        
    }
    
    
    public Term updateTerm(Term term ){
        return em.merge(term);
    }
    
    public Term createTerm(Term term){
        return em.merge(term);
    }
    
    
    
    public List<Term> findTermsByStatus(Integer status, int page, int size, String sortBy, String sortDirection) {
        String queryStr = "SELECT t FROM Term t WHERE t.isTemplate = :status ORDER BY t." + sortBy + " " + sortDirection;
        TypedQuery<Term> query = em.createQuery(queryStr, Term.class);
        query.setParameter("status", status);
        query.setFirstResult(page * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    
    public List<Term> findAllTerms(int page, int size, String sortBy, String sortDirection) {
        String queryStr = "SELECT t FROM Term t ORDER BY t." + sortBy + " " + sortDirection;
        TypedQuery<Term> query = em.createQuery(queryStr, Term.class);
        query.setFirstResult(page * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

   
    public long countTermsByStatus(Integer status) {
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(t) FROM Term t WHERE t.isTemplate = :status", Long.class);
        query.setParameter("status", status);
        return query.getSingleResult();
    }

    
    public long countAllTerms() {
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(t) FROM Term t", Long.class);
        return query.getSingleResult();
    }
    
     public List<Term> searchTermsByDescription(String description, int page, int size, String sortBy, String sortDirection) {
        String queryStr = "SELECT t FROM Term t WHERE LOWER(t.description) LIKE LOWER(CONCAT('%', :description, '%')) ORDER BY t." + sortBy + " " + sortDirection;
        TypedQuery<Term> query = em.createQuery(queryStr, Term.class);
        query.setParameter("description", description);
        query.setFirstResult(page * size);
        query.setMaxResults(size);
        return query.getResultList();
    }
     
     public long countTermsByDescription(String description) {
        TypedQuery<Long> query = em.createQuery("SELECT COUNT(t) FROM Term t WHERE LOWER(t.description) LIKE LOWER(CONCAT('%', :description, '%'))", Long.class);
        query.setParameter("description", description);
        return query.getSingleResult();
    }
}
