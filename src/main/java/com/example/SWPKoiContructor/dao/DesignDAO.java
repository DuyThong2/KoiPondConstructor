package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.Project;
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

    public List<Design> getListDesignWithSortedAndPaginated(int page, int size) {
        TypedQuery<Design> query = entityManager.createQuery(
                "SELECT d FROM Design d ORDER BY d.status ASC", Design.class);
        query.setFirstResult(size * page);
        query.setMaxResults(size);
        return query.getResultList();
    }
    
    public long countAllDesigns() {
        String countAllDesign = "SELECT COUNT(d) FROM Design d";
        TypedQuery<Long> query = entityManager.createQuery(countAllDesign, Long.class);
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

    public Design createADesign(Design design) {
        return entityManager.merge(design);
    }

    public Design updateDesign(Design design) {
        return entityManager.merge(design);
    }

    // Hàm phân trang và sắp xếp
    public List<Design> getSortedAndPaginatedByDesigner(int staffId, int page, int size) {
        String jpql = "SELECT d FROM Design d JOIN d.staff s WHERE s.id = :staffId ORDER BY d.status ASC";
        TypedQuery<Design> query = entityManager.createQuery(jpql, Design.class);
        query.setParameter("staffId", staffId);
        query.setFirstResult(page * size); // Bắt đầu từ vị trí nào
        query.setMaxResults(size); // Số lượng phần tử mỗi trang
        return query.getResultList();
    }

    // Method for caculate the sum of the page
    public long countDesignsByStaff(int staffId) {
        String countDesign = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId";
        TypedQuery<Long> query = entityManager.createQuery(countDesign, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
    }

    public long countDesignsCompleteByStaffId(int staffId) {
        String countDesign = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId and d.status = 3";
        TypedQuery<Long> query = entityManager.createQuery(countDesign, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
    }

    public long countDesignsProcessingByStaffId(int staffId) {
        String countDesign = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId and d.status = 2";
        TypedQuery<Long> query = entityManager.createQuery(countDesign, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
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
