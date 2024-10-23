package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.TermDAO;
import com.example.SWPKoiContructor.entities.Term;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TermService {

    @Autowired
    private TermDAO termDAO;  // Assuming there's a TermDAO to handle DB interactions

    public List<Term> searchTermsByDescription(String description, int page, int size, String sortBy, String sortDirection, Boolean isDisabled) {
        return termDAO.searchByDescription(description, page, size, sortBy, sortDirection, isDisabled);
    }

    public long countTermsByDescription(String description, Boolean isDisabled) {
        return termDAO.countByDescription(description, isDisabled);
    }

    // Find all terms and filter by disabled status
    public List<Term> findAllTerms(int page, int size, String sortBy, String sortDirection, Boolean isDisabled) {
        return termDAO.findAllTerms(page, size, sortBy, sortDirection, isDisabled);
    }

    public long countAllTerms(Boolean isDisabled) {
        return termDAO.countAllTerms(isDisabled);
    }
    
    public List<Term> getAllTemplateTerm(){
        return termDAO.getTemplateTerm();
    }
    
    @Transactional
    public void updateTermStatus(int termId, boolean termStatus) {
        Term term = termDAO.findById(termId);
        if (term != null) {
            term.setTermStatus(termStatus);
            termDAO.save(term);
        } else {
            throw new RuntimeException("Term not found with ID: " + termId);
        }
    }
    
    @Transactional
    public Term save(Term term){
        return termDAO.save(term);
    }
    
    public Term findTermById(int id){
        return termDAO.findById(id);
    }

    
}
