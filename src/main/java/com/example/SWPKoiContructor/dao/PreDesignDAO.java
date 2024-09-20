/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.PreDesign;
import java.util.List;
import javax.persistence.EntityManager;
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
   
    public List<PreDesign> getListPreDesign(){
       TypedQuery<PreDesign> tq = entityManager.createQuery("SELECT d FROM Pre_Design d", PreDesign.class);
       return tq.getResultList();
   }
   
    public List<PreDesign> getListPreDesignByName(String name){
       TypedQuery<PreDesign> tq = entityManager.createQuery("SELECT d FROM Pre_Design d WHERE d.pre_design_name like :name", PreDesign.class);
       tq.setParameter("name", "%"+name+"%");
       return tq.getResultList();
   }
   
    public PreDesign createNewPreDesign(PreDesign preDesign){
        PreDesign createPreDesign = entityManager.merge(preDesign);
        return createPreDesign;
    }
    
    public PreDesign updatePreDesign(PreDesign preDesign){
        return entityManager.merge(preDesign);
    }
}
