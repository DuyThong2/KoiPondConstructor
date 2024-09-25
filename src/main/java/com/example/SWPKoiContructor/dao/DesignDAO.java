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

    public List<Object[]> getListDesignWithCustomerName() {
        TypedQuery<Object[]> query = entityManager.createQuery(
                "SELECT d, cus FROM Design d JOIN d.project p JOIN p.contract c JOIN c.customer cus ORDER BY d.status ASC",
                Object[].class);
        return query.getResultList();
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

    // Hàm đếm tổng số bản ghi để tính tổng số trang
    public long countDesignsByStaff(int staffId) {
        String jpql = "SELECT COUNT(d) FROM Design d JOIN d.staff s WHERE s.id = :staffId";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);
        query.setParameter("staffId", staffId);
        return query.getSingleResult();
    }

   

}
