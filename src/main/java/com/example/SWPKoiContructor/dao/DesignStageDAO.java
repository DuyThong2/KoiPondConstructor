package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.DesignStage;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class DesignStageDAO {
    private EntityManager entityManager;

    public DesignStageDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    public List<DesignStage> getDesignStageByDesignId(int id){
        TypedQuery<DesignStage> ds = entityManager.createQuery(
                "SELECT ds FROM DesignStage ds WHERE ds.design.designId = :id ", DesignStage.class);
        ds.setParameter("id", id);
        return ds.getResultList();
    }

    
}
