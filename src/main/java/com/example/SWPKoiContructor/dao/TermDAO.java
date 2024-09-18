/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Term;
import java.util.List;
import javax.persistence.EntityManager;
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
        TypedQuery<Term> tq = em.createQuery("select term from Term term where term.isTemplate = 1",Term.class);
        return tq.getResultList();
    }
}
