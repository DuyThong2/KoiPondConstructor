package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Design;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class DesignDAO {

    private EntityManager entityManager;

    public DesignDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Object[]> getListDesignWithCustomerName() {
        TypedQuery<Object[]> query = entityManager.createQuery(
                "SELECT d, cus FROM Design d JOIN d.project p JOIN p.contract c JOIN c.customer cus ORDER BY d.status ASC",
                Object[].class);
        return query.getResultList();
    }
    
        public Design getDesignById(int id) {
        TypedQuery<Design> design = entityManager.createQuery(
                "SELECT d FROM Design d WHERE d.designId = :id", Design.class);
        design.setParameter("id", id);
        return design.getSingleResult();
    }
}