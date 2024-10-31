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

    public List<Construction> getPaginatedConstructions(Integer staffId, int page, int size, Integer statusFilter, String searchName) {
        // Build the base JPQL query
        StringBuilder jpql = new StringBuilder("SELECT c FROM Construction c");

        boolean hasStaffFilter = staffId != null;
        boolean hasStatusFilter = statusFilter != null;
        boolean hasSearchName = searchName != null && !searchName.isEmpty();

        // Include JOIN only if filtering by staffId
        if (hasStaffFilter) {
            jpql.append(" JOIN c.constructionStaffs cs WHERE cs.staff.id = :staffId");
        } else {
            jpql.append(" WHERE 1=1");
        }

        // Add dynamic conditions for status and name search
        if (hasStatusFilter) {
            jpql.append(" AND c.constructionStatus = :statusFilter");
        }

        if (hasSearchName) {
            jpql.append(" AND LOWER(c.constructionName) LIKE LOWER(:searchName)");
        }

        jpql.append(" ORDER BY c.constructionStatus ASC");

        TypedQuery<Construction> query = entityManager.createQuery(jpql.toString(), Construction.class);

        // Set parameters dynamically
        if (hasStaffFilter) {
            query.setParameter("staffId", staffId);
        }

        if (hasStatusFilter) {
            query.setParameter("statusFilter", statusFilter);
        }

        if (hasSearchName) {
            query.setParameter("searchName", "%" + searchName + "%");
        }

        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    // Count the total number of constructions, with optional filtering by staffId, status, and search by name
    public long countConstructions(Integer staffId, Integer statusFilter, String searchName) {
        StringBuilder jpql = new StringBuilder("SELECT COUNT(c) FROM Construction c JOIN c.constructionStaffs cs WHERE 1=1");

        boolean hasStaffFilter = staffId != null;
        boolean hasStatusFilter = statusFilter != null;
        boolean hasSearchName = searchName != null && !searchName.isEmpty();

        // Building dynamic query conditions
        if (hasStaffFilter) {
            jpql.append(" AND cs.staff.id = :staffId");
        }

        if (hasStatusFilter) {
            jpql.append(" AND c.constructionStatus = :statusFilter");
        }

        if (hasSearchName) {
            jpql.append(" AND LOWER(c.constructionName) LIKE LOWER(:searchName)");
        }

        TypedQuery<Long> query = entityManager.createQuery(jpql.toString(), Long.class);

        // Setting parameters dynamically
        if (hasStaffFilter) {
            query.setParameter("staffId", staffId);
        }

        if (hasStatusFilter) {
            query.setParameter("statusFilter", statusFilter);
        }

        if (hasSearchName) {
            query.setParameter("searchName", "%" + searchName + "%");
        }

        return query.getSingleResult();
    }

    // Method to get a construction by its ID
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

    // Method to update a construction entity
    public Construction updateConstruction(Construction construction) {
        return entityManager.merge(construction);
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
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public long countConstructionsInCompleteByStaffId(int staffId) {
        String jpql = "SELECT COUNT(c) FROM Construction c "
                + "JOIN c.constructionStaffs cs "
                + "JOIN cs.staff s "
                + "WHERE s.id = :staffId and cs.construction.constructionStatus = 3";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("staffId", staffId);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }
}
