package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.BluePrint;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class BluePrintDAO {

    private EntityManager entityManager;

    public BluePrintDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<BluePrint> getBluePrintListOfDesignStage(int id) {
        TypedQuery<BluePrint> bp = entityManager.createQuery("SELECT bp FROM BluePrint bp WHERE bp.designStage.designStageId = :id", BluePrint.class);
        bp.setParameter("id", id);
        return bp.getResultList();
    }

    public BluePrint getBluePrintOfDesignStage(int id) {
        TypedQuery<BluePrint>bp = entityManager.createQuery(
                "SELECT bp FROM BluePrint bp WHERE bp.designStage.designStageId = :id", BluePrint.class);
        bp.setParameter("id", id);
        return bp.getSingleResult();
    }

}
