
package com.example.SWPKoiContructor.dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.example.SWPKoiContructor.entities.LoyaltyPoint;
import org.springframework.stereotype.Repository;

@Repository
public class LoyaltyPointDAO {
    private EntityManager entityManager;

    public LoyaltyPointDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public long     TotalPoints(int customerId) {
        TypedQuery<Long> query = entityManager.createQuery(
                "select SUM(l.amount) from LoyaltyPoint l where l.customer.id = :customerId", Long.class);
        query.setParameter("customerId", customerId);
        return query.getSingleResult();
    }
}
