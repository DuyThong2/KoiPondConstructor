/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.PreDesignDAO;
import com.example.SWPKoiContructor.entities.PreDesign;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author HP
 */
@Service
public class PreDesignService {
    private PreDesignDAO preDesignDAO;

    public PreDesignService(PreDesignDAO preDesignDAO) {
        this.preDesignDAO = preDesignDAO;
    }
    
    public List<PreDesign> getFilteredPredesignList(int page, int size, String sortBy, String sortDirection, Boolean statusFilter, String searchName){
        return preDesignDAO.getFilteredPreDesign(page, size, sortBy, sortDirection, statusFilter, searchName);
    }
    
    public long countFilteredPredesignList(Boolean statusFilter, String searchName){
        return preDesignDAO.countFilteredPreDesign(statusFilter, searchName);
    }
    
    public List<PreDesign> getPreDesignList(int page, int size, String sortBy, String sortDirection){
        return preDesignDAO.getPreDesignList(page, size, sortBy, sortDirection);
    }
           
    public long countPreDesignList(){
        return preDesignDAO.countPreDesignList();
    }
    
    public List<PreDesign> getPreDesignListForHomePage(int page, int size){
        return preDesignDAO.getPreDesignListForHomePage(page, size);
    }
    
    public long countPreDesignListOfHomePage(){
        return preDesignDAO.countPreDesignListOfHomepage();
    }
    
    public PreDesign getPredesignById(int id){
        return preDesignDAO.getPreDesignById(id);
    }
    
    @Transactional
    public PreDesign createNewPreDesign(PreDesign preDesign){
        return preDesignDAO.createNewPreDesign(preDesign);
    }
    
    @Transactional
    public PreDesign updatePreDesign(PreDesign preDesign){
        return preDesignDAO.updatePreDesign(preDesign);
    }
    
    public PreDesign getPreDesignAndContentById(int preDesignId){
        return preDesignDAO.getPreDesignAndContentById(preDesignId);
    }
    @Transactional
    public PreDesign updatePreDesignStatus(int preDesignId, boolean status){
        return preDesignDAO.updatePreDesignStatus(preDesignId, status);
    }

    public List<PreDesign> getRelatedPreDesign(int id) {
        return preDesignDAO.getRelatedPreDesign(id);
    }
    
    public List<PreDesign> getActivePreDesignList(){
        return preDesignDAO.getActivePreDesignList();
    }
}
