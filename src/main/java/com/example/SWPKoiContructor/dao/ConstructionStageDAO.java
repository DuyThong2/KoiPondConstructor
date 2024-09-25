
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.ConstructionStage;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ConstructionStageDAO {
        private EntityManager entityManager;

    public ConstructionStageDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    public List<ConstructionStage> getListConstructionStages(int id){
        TypedQuery<ConstructionStage> list = entityManager.createQuery(
                "SELECT cs FROM ConstructionStage cs "
                + "WHERE cs.construction.constructionId = :id", ConstructionStage.class);
        list.setParameter("id", id);
        return list.getResultList();
    }
    
}
