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

    public ConstructionStageDetail getConstructionStageDetailByConstructionStageDetailId(int id) {
        try {
            TypedQuery<ConstructionStageDetail> detail = entityManager.createQuery("SELECT csd FROM ConstructionStageDetail csd where csd.constructionStageDetailId = :id", ConstructionStageDetail.class);
            detail.setParameter("id", id);
            return detail.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public List<ConstructionStageDetail> getConstructionStageDetailByStageId(int id) {
        try {
            TypedQuery<ConstructionStageDetail> details = entityManager.createQuery("Select csd from ConstructionStageDetail csd where csd.constructionStage.constructionStageId = :id order by csd.constructionStageDetailId ", ConstructionStageDetail.class);
            details.setParameter("id", id);
            return details.getResultList();
        } catch (NoResultException e) {
            return null;
        }

    }

    public ConstructionStageDetail updateConstructionStageDetail(ConstructionStageDetail constructionStageDetail) {
        return entityManager.merge(constructionStageDetail);
    }

    public ConstructionStageDetail getPreviousStageDetail(int constructionStageId) {
        String jpql = "SELECT d FROM ConstructionStageDetail d WHERE d.constructionStage.constructionStageId = :stageId ORDER BY d.constructionStageDetailId DESC";
        TypedQuery<ConstructionStageDetail> query = entityManager.createQuery(jpql, ConstructionStageDetail.class);
        query.setParameter("stageId", constructionStageId);
        List<ConstructionStageDetail> details = query.getResultList();

        // Check the last stage's type and determine the correct "previous" stage
        if (!details.isEmpty()) {
            String lastStageName = details.get(0).getConstructionStageDetailName();

            if ("Inspection".equalsIgnoreCase(lastStageName) && details.size() > 1) {
                // Testing is the 2nd to last if last stage is Inspection
                return details.get(1);
            } else if ("Payment".equalsIgnoreCase(lastStageName) && details.size() > 2) {
                // Testing is the 3rd to last if last stage is Payment
                return details.get(2);
            } else if (details.size() > 1) {
                // General fallback to the 2nd to last if none of the above conditions match
                return details.get(1);
            }
        }

        // Return null if no appropriate previous stage is found
        return null;
    }
}
