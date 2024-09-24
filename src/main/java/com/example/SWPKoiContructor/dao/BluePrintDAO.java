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

    public List<BluePrint> findByDesignStageId(int id) {
        TypedQuery<BluePrint> query = entityManager.createQuery(
                "SELECT b FROM BluePrint b WHERE b.designStage.designStageId = :id", BluePrint.class);
        query.setParameter("id", id);
        return query.getResultList();
    }

    public void saveBluePrint(BluePrint bluePrint) {
        entityManager.persist(bluePrint);
    }

    public BluePrint getBluePrintById(int bluePrintId) {
        return entityManager.find(BluePrint.class, bluePrintId);
    }

    public void deleteBluePrint(int bluePrintId) {
        BluePrint bluePrint = getBluePrintById(bluePrintId);
        if (bluePrint != null) {
            entityManager.remove(bluePrint);
        }
    }
}
