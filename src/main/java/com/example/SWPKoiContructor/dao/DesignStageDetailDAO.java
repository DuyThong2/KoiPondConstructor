package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.DesignStageDetail;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class DesignStageDetailDAO {

    private EntityManager entityManager;

    public DesignStageDetailDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<DesignStageDetail> getDesignStageDetailOfDesignStage(int id) {
        TypedQuery<DesignStageDetail> detail = entityManager.createQuery("SELECT dsd FROM DesignStageDetail dsd WHERE dsd.designStage.designStageId = :id ", DesignStageDetail.class);
        detail.setParameter("id", id);
        return detail.getResultList();

    }

    public DesignStageDetail getDesignStageDetailById(int designStageDetailId) {
        try {
            TypedQuery<DesignStageDetail> detail = entityManager.createQuery("SELECT dsd FROM DesignStageDetail dsd WHERE dsd.id = :id ", DesignStageDetail.class);
            detail.setParameter("id", designStageDetailId);
            return detail.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public DesignStageDetail updateDesignStageDetail(DesignStageDetail designStageDetail) {
        return entityManager.merge(designStageDetail);
    }
}
