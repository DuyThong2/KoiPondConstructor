package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.DesignStage;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class DesignStageDAO {

    private EntityManager entityManager;

    public DesignStageDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<DesignStage> getDesignStageListOfDesign(int id) {
        TypedQuery<DesignStage> ds = entityManager.createQuery("SELECT ds FROM DesignStage ds WHERE ds.design.designId = :id ", DesignStage.class);

        ds.setParameter("id", id);
        return ds.getResultList();
    }


    public List<DesignStage> getDesignStageByDesignIdAndName(int designId, String stageName) {
        TypedQuery<DesignStage> query = entityManager.createQuery(
            "SELECT ds FROM DesignStage ds WHERE ds.design.designId = :designId AND ds.designStageName LIKE :stageName",
            DesignStage.class);
        query.setParameter("designId", designId);
        query.setParameter("stageName", "%" + stageName + "%");
        return query.getResultList();
    }
    
    public DesignStage updateDesignStage(DesignStage designStage) {
        return entityManager.merge(designStage);
    }

    public DesignStage getDesignStageById(int id) {
        try {
            TypedQuery<DesignStage> ds = entityManager.createQuery("SELECT ds FROM DesignStage ds WHERE ds.designStageId = :id ", DesignStage.class);
            ds.setParameter("id", id);
            return ds.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    

    public List<DesignStage> findByDesignIdOrderById(int designId) {
        TypedQuery<DesignStage> ds = entityManager.createQuery(
                "SELECT ds FROM DesignStage ds WHERE ds.design.designId = :id  ORDER BY ds.designStageId", DesignStage.class);
        ds.setParameter("id", designId);
        return ds.getResultList();
    }

}
