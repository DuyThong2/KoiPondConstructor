/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionDAO;
import com.example.SWPKoiContructor.entities.Construction;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author nasaf
 */
@Service
public class ConstructionService {
    private ConstructionDAO constructionDao;

    public ConstructionService(ConstructionDAO constructionDao) {
        this.constructionDao = constructionDao;
    }
    public List<Object[]> getListConstructionByCustomerName(){
        return constructionDao.getListConstructionByCustomerName();        
    }
    public Construction getConstructionById(int id){
        return constructionDao.getConstructionById(id);
    }
    
}
