/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Construction;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author nasaf
 */
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
        try {
            TypedQuery<Construction> construct = entityManager.createQuery(
                    "SELECT c FROM Construction c WHERE c.constructionId = :id", Construction.class);
            construct.setParameter("id", id);
            return construct.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public Construction updateConstruction(Construction construction) {
        return entityManager.merge(construction);
    }
}
