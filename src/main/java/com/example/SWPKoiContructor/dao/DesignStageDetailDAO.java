package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.DesignStageDetail;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class DesignStageDetailDAO {
    private EntityManager entityManager;

    public DesignStageDetailDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    public DesignStageDetail getDesignStageDetailOfDesignStage(int id){
        TypedQuery<DesignStageDetail> detail = entityManager.createQuery("SELECT dsd FROM DesignStageDetail dsd WHERE dsd.designStage.designStageId = :id ", DesignStageDetail.class);
        detail.setParameter("id", id);
        return detail.getSingleResult();
    }
}
