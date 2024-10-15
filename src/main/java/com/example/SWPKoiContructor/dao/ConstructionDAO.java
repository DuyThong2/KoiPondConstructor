package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Construction;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class ConstructionDAO {

    private EntityManager entityManager;

    public ConstructionDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Construction> getListConstructionWithCustomerName(int page, int size) {
        TypedQuery<Construction> query = entityManager.createQuery(
                "SELECT c FROM Construction c ORDER BY c.constructionStatus ASC",Construction.class);
        query.setFirstResult(size * page);
        query.setMaxResults(size);
        return query.getResultList();
    }
    
        public long countAllConstructions() {
        String jpql = "SELECT COUNT(c) FROM Construction c JOIN c.constructionStaffs cs ";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        return query.getSingleResult();
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

    // Fetch sorted and paginated constructions by staffId
    public List<Construction> getSortedAndPaginatedByStaff(int staffId, int page, int size) {
        String jpql = "SELECT c FROM Construction c "
                + "JOIN c.constructionStaffs cs "
                + "JOIN cs.staff s "
                + "WHERE s.id = :staffId "
                + "ORDER BY c.constructionStatus ASC";
        TypedQuery<Construction> query = entityManager.createQuery(jpql, Construction.class);
        query.setParameter("staffId", staffId);
        query.setFirstResult(page * size); // Start at the correct row
        query.setMaxResults(size); // Limit the number of results
        return query.getResultList();
    }

    // Count the total number of constructions by staffId
    public long countConstructionsByStaff(int staffId) {
        String jpql = "SELECT COUNT(c) FROM Construction c "
                + "JOIN c.constructionStaffs cs "
                + "JOIN cs.staff s "
                + "WHERE s.id = :staffId";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
    }

    public List<Construction> getconstructionByStaffId(int staffId) {
        String jpql = "SELECT c FROM Construction c "
                + "JOIN c.constructionStaffs cs "
                + "JOIN cs.staff s "
                + "WHERE s.id = :staffId "
                + "ORDER BY c.constructionStatus ASC";
        TypedQuery<Construction> query = entityManager.createQuery(jpql, Construction.class);
        query.setParameter("staffId", staffId);
        return query.getResultList();
    }

    public long countConstructionsInProcessByStaffId(int staffId) {
        String jpql = "SELECT COUNT(c) FROM Construction c "
                + "JOIN c.constructionStaffs cs "
                + "JOIN cs.staff s "
                + "WHERE s.id = :staffId and cs.construction.constructionStatus = 2";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
    }
    public long countConstructionsInCompleteByStaffId(int staffId) {
        String jpql = "SELECT COUNT(c) FROM Construction c "
                + "JOIN c.constructionStaffs cs "
                + "JOIN cs.staff s "
                + "WHERE s.id = :staffId and cs.construction.constructionStatus = 3";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
    }
}
