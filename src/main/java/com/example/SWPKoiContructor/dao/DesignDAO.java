package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Design;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class DesignDAO {

    private EntityManager entityManager;

    public DesignDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Design> getListDesignWithSortedAndPaginated(int page, int size, Integer status, String name) {
        StringBuilder queryBuilder = new StringBuilder("SELECT d FROM Design d WHERE 1 = 1");

        if (name != null && !name.isEmpty()) {
            queryBuilder.append(" AND d.designName LIKE :name");
        }
        if (status != null) {
            queryBuilder.append(" AND d.status = :status");
        }

        queryBuilder.append(" ORDER BY d.status ASC");

        TypedQuery<Design> query = entityManager.createQuery(queryBuilder.toString(), Design.class);
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if(status != null) {
            query.setParameter("status", status);
        }
        query.setFirstResult(size * page);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countAllDesigns(Integer status, String name) {
        StringBuilder queryBuilder = new StringBuilder("SELECT count(d) FROM Design d WHERE 1 = 1");

        if (name != null && !name.isEmpty()) {
            queryBuilder.append(" AND d.designName LIKE :name");
        }
        if (status != null) {
            queryBuilder.append(" AND d.status = :status");
        }
        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if(status != null) {
            query.setParameter("status", status);
        }
        return query.getSingleResult();
    }

    public Design getDesignById(int id) {
        try {
            TypedQuery<Design> design = entityManager.createQuery(
                    "SELECT d FROM Design d WHERE d.designId = :id", Design.class);
            design.setParameter("id", id);
            return design.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public void updateDesign(Design design) {
        entityManager.merge(design);
    }

    public List<Design> getSortedAndPaginatedByDesigner(int staffId, int page, int size, Integer status, String name) {
        StringBuilder queryBuilder = new StringBuilder("SELECT d FROM Design d JOIN d.staff s WHERE s.id = :staffId and 1 = 1");

        if (name != null && !name.isEmpty())
            queryBuilder.append(" AND d.designName LIKE :name");

        if (status != null)
            queryBuilder.append(" AND d.status = :status");

        queryBuilder.append(" ORDER BY d.status ASC");

        TypedQuery<Design> query = entityManager.createQuery(queryBuilder.toString(), Design.class);
        if (name != null && !name.isEmpty())
            query.setParameter("name", "%" + name + "%");

        if(status != null)
            query.setParameter("status", status);

        query.setParameter("staffId", staffId);

        query.setFirstResult(size * page);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countDesignsByStaffWithFilter(int staffId, Integer status, String name) {
        StringBuilder queryBuilder = new StringBuilder("SELECT count(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId and 1 = 1");

        if (name != null && !name.isEmpty())
            queryBuilder.append(" AND d.designName LIKE :name");

        if (status != null)
            queryBuilder.append(" AND d.status = :status");

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);
        if (name != null && !name.isEmpty())
            query.setParameter("name", "%" + name + "%");

        if(status != null)
            query.setParameter("status", status);

        query.setParameter("staffId", staffId);

        return query.getSingleResult();
    }

    // Method for caculate the sum of the page
    public long countDesignsByStaff(int staffId) {
        String countDesign = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId";
        TypedQuery<Long> query = entityManager.createQuery(countDesign, Long.class);
        query.setParameter("staffId", staffId);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public long countDesignsCompleteByStaffId(int staffId) {
        String countDesign = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId and d.status = 3";
        TypedQuery<Long> query = entityManager.createQuery(countDesign, Long.class);
        query.setParameter("staffId", staffId);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public long countDesignsProcessingByStaffId(int staffId) {
        String countDesign = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId and d.status = 2";
        TypedQuery<Long> query = entityManager.createQuery(countDesign, Long.class);
        query.setParameter("staffId", staffId);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public boolean isAssignedToDesign(int designId, int userId) {
        String staffInDesign
                = "SELECT COUNT(s) FROM Design d JOIN d.staff s WHERE d.designId = :designId AND s.id = :userId";
        TypedQuery<Long> query = entityManager.createQuery(staffInDesign, Long.class);
        query.setParameter("designId", designId);
        query.setParameter("userId", userId);
        Long count = query.getSingleResult();

        return count > 0;
    }

    public List<Design> getProjectsByStaffId(int staffId) {
        String queryString = "SELECT d FROM Design d JOIN d.staff s WHERE s.id = :staffId";
        TypedQuery<Design> query = entityManager.createQuery(queryString, Design.class);
        query.setParameter("staffId", staffId);
        return query.getResultList();
    }
}
