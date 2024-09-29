package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.ConstructionStage;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ConstructionStageDAO {

    private EntityManager entityManager;

    public ConstructionStageDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<ConstructionStage> getListConstructionStagesByConstructionId(int id) {
        TypedQuery<ConstructionStage> list = entityManager.createQuery(
                "SELECT cs FROM ConstructionStage cs "
                + "WHERE cs.construction.constructionId = :id", ConstructionStage.class);
        list.setParameter("id", id);
        return list.getResultList();
    }
    
    

    public ConstructionStage getConstructionStageById(int constructionStageId) {
        try {
            TypedQuery<ConstructionStage> list = entityManager.createQuery(
                    "SELECT cs FROM ConstructionStage cs "
                    + "WHERE cs.constructionStageId = :id", ConstructionStage.class);
            list.setParameter("id", constructionStageId);
            return list.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }
    
    public ConstructionStage updateConstructionStage(ConstructionStage constructionStage){
        return entityManager.merge(constructionStage);
    }

    public List<ConstructionStage> findByConstructionIdOrderById(int constructionId) {
        TypedQuery<ConstructionStage> list = entityManager.createQuery(
                "SELECT cs FROM ConstructionStage cs WHERE cs.construction.constructionId = :id ORDER BY cs.constructionStageId"
                , ConstructionStage.class);
        list.setParameter("id", constructionId);
        return list.getResultList();
    }

}
