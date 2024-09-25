
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Construction;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ConstructionDAO {

    private EntityManager entityManager;

    public ConstructionDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Object[]> getListConstructionByCustomerName() {
        TypedQuery<Object[]> query = entityManager.createQuery(
                "SELECT c, p, cus FROM Construction c JOIN c.project p JOIN p.contract d JOIN d.customer cus ORDER BY c.constructionStatus ASC",
                Object[].class);
        return query.getResultList();
    }

    public Construction getConstructionById(int id) {
        TypedQuery<Construction> construct = entityManager.createQuery(
                "SELECT c FROM Construction c WHERE c.constructionId = :id", Construction.class);
        construct.setParameter("id", id);
        return construct.getSingleResult();
    }
}

