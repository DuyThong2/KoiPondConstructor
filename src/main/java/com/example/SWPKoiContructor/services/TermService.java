/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.TermDAO;
import com.example.SWPKoiContructor.entities.Term;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */

@Service
public class TermService {
    
    private TermDAO termDAO;

    public TermService(TermDAO termDAO) {
        this.termDAO = termDAO;
    }
    
    public List<Term> getAllTemplateTerm(){
        return termDAO.getAllTemplateTerms();
    }
    
    public Term getTermById(int id){
        return termDAO.getTermById(id);
    }
    
    public Term updateTerm(Term term){
        return termDAO.updateTerm(term);
        
    }
    
    public Term createTerm(Term term){
        return termDAO.createTerm(term);
    }
    
    public List<Term> searchTermsByDescription(String description, int page, int size, String sortBy, String sortDirection) {
        return termDAO.searchTermsByDescription(description, page, size, sortBy, sortDirection);
    }

    
    public long countTermsByDescription(String description) {
        return termDAO.countTermsByDescription(description);
    }

    
    public List<Term> findTermsByStatus(Integer status, int page, int size, String sortBy, String sortDirection) {
        return termDAO.findTermsByStatus(status, page, size, sortBy, sortDirection);
    }

    
    public long countTermsByStatus(Integer status) {
        return termDAO.countTermsByStatus(status);
    }

    
    public List<Term> findAllTerms(int page, int size, String sortBy, String sortDirection) {
        return termDAO.findAllTerms(page, size, sortBy, sortDirection);
    }

    
    public long countAllTerms() {
        return termDAO.countAllTerms();
    }
    
    
}
