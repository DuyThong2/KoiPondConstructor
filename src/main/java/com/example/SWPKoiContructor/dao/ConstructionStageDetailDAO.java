package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ConstructionStageDetailDAO {

    private EntityManager entityManager;

    public ConstructionStageDetailDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public ConstructionStageDetail getConstructionStageDetailByConstructionStageId(int id) {
        try {
            TypedQuery<ConstructionStageDetail> detail = entityManager.createQuery("SELECT csd FROM ConstructionStageDetail csd "
                    + "WHERE csd.constructionStage.constructionStageId = :id ", ConstructionStageDetail.class);
            detail.setParameter("id", id);
            return detail.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }
    
    public List<ConstructionStageDetail> getConstructionStageDetailByStageId(int id){
        TypedQuery<ConstructionStageDetail> details = entityManager.createQuery("Select csd from ConstructionStageDetail csd where csd.constructionStage.constructionStageId = :id order by csd.constructionStageDetailId ", ConstructionStageDetail.class);
        details.setParameter("id", id);
        return details.getResultList();
    }
    
    public ConstructionStageDetail updateConstructionStageDetail(ConstructionStageDetail constructionStageDetail){
        return entityManager.merge(constructionStageDetail);
    }
}
