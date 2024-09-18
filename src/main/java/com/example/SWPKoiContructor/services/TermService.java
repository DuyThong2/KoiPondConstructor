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
    
    
}
