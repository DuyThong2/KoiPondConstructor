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

    public DesignStage getDesignStageById(int id) {
        try {
            TypedQuery<DesignStage> ds = entityManager.createQuery("SELECT ds FROM DesignStage ds WHERE ds.designStageId = :id ", DesignStage.class);
            ds.setParameter("id", id);
            return ds.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public DesignStage updateDesignStage(DesignStage designStage) {
        return entityManager.merge(designStage);
    }

    public List<DesignStage> findByDesignIdOrderById(int designId) {
        TypedQuery<DesignStage> ds = entityManager.createQuery("SELECT ds FROM DesignStage ds ORDER BY ds.designStageId WHERE ds.design.designId = :id ", DesignStage.class);
        ds.setParameter("id", designId);
        return ds.getResultList();
    }

}
