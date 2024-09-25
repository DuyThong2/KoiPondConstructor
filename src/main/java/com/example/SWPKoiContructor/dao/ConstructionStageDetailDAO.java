
package com.example.SWPKoiContructor.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ConstructionStageDetailDAO {
    private EntityManager entityManager;

    public ConstructionStageDetailDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    public ConstructionStageDetailDAO getConstructionStageDetail(int id){
        TypedQuery<ConstructionStageDetailDAO> detail = entityManager.createQuery("SELECT csd FROM ConstructionStageDetail csd "
                + "WHERE csd.constructionStage.constructionStageId = :id ", ConstructionStageDetailDAO.class);
        detail.setParameter("id", id);
        return detail.getSingleResult();
    }
}
