/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Project;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.sql.Date;
import java.util.List;
import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;
import javax.persistence.Tuple;

/**
 *
 * @author Admin
 */
@Repository
public class ProjectDAO {

    private EntityManager entityManager;

    public ProjectDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Project> getProjectList(int size) {
        TypedQuery<Project> query = entityManager.createQuery("Select c from Project c order by c.status asc, c.dateStart desc", Project.class);
        query.setMaxResults(size);
        return query.getResultList();
    }

    public List<Project> getProjectListIsSharable(int number) {
        TypedQuery<Project> query = entityManager.createQuery("Select c from Project c where c.isSharedAble= true order by c.dateEnd desc", Project.class);
        return query.setMaxResults(number).getResultList();
    }

    public List<Project> getPaginationProjectList(int page, int size, String sortBy, String sortType) {
        TypedQuery<Project> query = entityManager.createQuery("Select c from Project c order by c." + sortBy + " " + sortType, Project.class);
        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    public Project getProjectById(int id) {
        try {
            return entityManager.find(Project.class, id);
        } catch (NoResultException e) {
            return null;
        }

    }

    public Project createProject(Project project) {
        entityManager.setFlushMode(FlushModeType.COMMIT);
        Project result = entityManager.merge(project);
        entityManager.setFlushMode(FlushModeType.AUTO);
        return result;
    }

    public Project updateProject(Project project) {
        return entityManager.merge(project);
    }

    public void deleteProject(int id) {
        Project deleteProject = this.getProjectById(id);
        if (deleteProject != null) {
            entityManager.remove(deleteProject);
        }
    }

    public Project updateProjectStatus(Project project, int status) {
        if (project != null) {
            project.setStatus(status);
            return entityManager.merge(project);
        }
        return null;
    }

    public Project updateProjectStatus(int id, int status) {
        Project updateStatusProject = this.getProjectById(id);
        if (updateStatusProject != null) {
            updateStatusProject.setStatus(status);
            return entityManager.merge(updateStatusProject);
        }
        return null;
    }

    public long countProject() {
        TypedQuery<Long> query = entityManager.createQuery("Select Count(c) from Project c", Long.class);
        return query.getSingleResult();
    }

    public List<Project> getPaginationProjectListByStatusAndStage(int page, int size, String sortBy, String sortType, Integer statusFilter, Integer stageFilter, Date fromDate, Date endDate, String searchName) {
        StringBuilder queryBuilder = new StringBuilder("SELECT c FROM Project c");

        String filter = filterQueryString(statusFilter, stageFilter,fromDate,endDate,searchName);
        if (filter != null) {
            queryBuilder.append(filter);
        }

        // Ensure valid defaults for sortBy and sortType
        String validSortBy = (sortBy != null && !sortBy.isEmpty()) ? sortBy : "projectName"; // Default to 'projectName'
        String validSortType = (sortType != null && (sortType.equalsIgnoreCase("ASC") || sortType.equalsIgnoreCase("DESC"))) ? sortType : "ASC"; // Default to 'ASC'

        queryBuilder.append(" ORDER BY c.").append(validSortBy).append(" ").append(validSortType);

        TypedQuery<Project> query = entityManager.createQuery(queryBuilder.toString(), Project.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (stageFilter != null) {
            query.setParameter("stageFilter", stageFilter);
        }if(fromDate!=null){
            query.setParameter("fromDate",fromDate);
      } if(endDate!=null){
            query.setParameter("endDate",endDate);
        }if(searchName!=null){
            query.setParameter("searchName","%"+searchName+"%");
        }


        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countProjectFilter(Integer statusFilter, Integer stageFilter, Date fromDate, Date endDate, String searchName) {
        StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(c) FROM Project c");

        String filter = filterQueryString(statusFilter, stageFilter, fromDate, endDate, searchName);
        if (filter != null) {
            queryBuilder.append(filter);
        }

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (stageFilter != null) {
            query.setParameter("stageFilter", stageFilter);
        }
        if (fromDate != null) {
            query.setParameter("fromDate", fromDate);
        }
        if (endDate != null) {
            query.setParameter("endDate", endDate);
        }
        if (searchName != null) {
            query.setParameter("searchName", "%" + searchName + "%");
        }

        return query.getSingleResult();
    }

    private String filterQueryString(Integer statusFilter, Integer stageFilter, Date fromDate, Date endDate, String searchName) {
        StringBuilder queryBuilder = new StringBuilder();
        boolean hasPrevious = false;

        if (statusFilter != null) {
            queryBuilder.append(" WHERE c.status = :statusFilter");
            hasPrevious = true;
        }
        if (stageFilter != null) {
            queryBuilder.append(hasPrevious ? " AND" : " WHERE").append(" c.stage = :stageFilter");
            hasPrevious = true;
        }
        if (fromDate != null && endDate != null) {
            queryBuilder.append(hasPrevious ? " AND" : " WHERE").append(" c.dateStart >= :fromDate AND c.dateEnd <= :endDate");
            hasPrevious = true;
        } else if (fromDate != null) {
            queryBuilder.append(hasPrevious ? " AND" : " WHERE").append(" c.dateStart >= :fromDate");
            hasPrevious = true;
        } else if (endDate != null) {
            queryBuilder.append(hasPrevious ? " AND" : " WHERE").append(" c.dateEnd <= :endDate");
            hasPrevious = true;
        }
        if (searchName != null) {
            queryBuilder.append(hasPrevious ? " AND" : " WHERE").append(" c.projectName LIKE :searchName");
        }

        return queryBuilder.length() > 0 ? queryBuilder.toString() : null;
    }


    public long countProjectProcessing() {
        TypedQuery<Long> query = entityManager.createQuery("Select Count(c) from Project c where c.status = 2", Long.class);
        return query.getSingleResult();
    }

    public long countProjectComplete() {
        TypedQuery<Long> query = entityManager.createQuery("Select Count(c) from Project c where c.status = 3", Long.class);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public long countCustomerProjectsById(int customerId) {
        String queryString = "SELECT count(p.id) FROM Project p WHERE p.contract.customer.id = :customerId";
        TypedQuery<Long> query = entityManager.createQuery(queryString, Long.class);
        query.setParameter("customerId", customerId);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public List<Project> getCustomerProjectsById(int customerId) {
        String queryString = "SELECT p FROM Project p WHERE p.contract.customer.id = :customerId";
        TypedQuery<Project> query = entityManager.createQuery(queryString, Project.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    public List<Project> getActiveCustomerProjectsById(int customerId) {
        String queryString = "SELECT p FROM Project p WHERE p.contract.customer.id = :customerId AND p.status NOT IN (3, 4)";
        TypedQuery<Project> query = entityManager.createQuery(queryString, Project.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    public List<Project> getCompleteAndCancelCustomerProjectsById(int customerId) {
        String queryString = "SELECT p FROM Project p WHERE p.contract.customer.id = :customerId AND p.status IN (3, 4)";
        TypedQuery<Project> query = entityManager.createQuery(queryString, Project.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    public Project getProjectWithContentById(int id) {
        try {
            TypedQuery<Project> query = entityManager.createQuery("select p from Project p left join fetch p.content c where p.projectId = :id ", Project.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    //USE FOR DASHBOARD ONLY
    public List<Tuple> getTotalEarningsForCompletedProjectsPerMonth(int year) {
        // JPQL query to get the total price from completed projects at stage 5 with status 3, grouped by month
        String jpql = "SELECT FUNCTION('MONTH', p.dateEnd) AS month, SUM(c.totalPrice) AS totalEarnings "
                + "FROM Project p "
                + "JOIN p.contract c "
                + "WHERE p.stage = 5 "
                + "AND p.status = 3 "
                + "AND FUNCTION('YEAR', p.dateEnd) = :year "
                + "GROUP BY FUNCTION('MONTH', p.dateEnd)";

        TypedQuery<Tuple> query = entityManager.createQuery(jpql, Tuple.class);
        query.setParameter("year", year);

        return query.getResultList();

    }

    public Long countByStage(int stage) {
        TypedQuery<Long> query = entityManager.createQuery(
                "SELECT COUNT(p) FROM Project p WHERE p.stage = :stage", Long.class);
        query.setParameter("stage", stage);
        return query.getSingleResult();
    }

    public List<Project> findPaginatedProjectsForShowing(int page, int size) {
        String jpql = "SELECT p FROM Project p where p.isSharedAble = 1 ORDER BY p.projectName ASC";
        TypedQuery<Project> query = entityManager.createQuery(jpql, Project.class);

        query.setFirstResult((page-1) * size);  // Start index for pagination
        query.setMaxResults(size);  // Number of results per page

        return query.getResultList();
    }

    public long countSharedProjects() {
        String jpql = "SELECT COUNT(p) FROM Project p WHERE p.isSharedAble = 1";
        TypedQuery<Long> query = entityManager.createQuery(jpql, Long.class);

        return query.getSingleResult();
    }

    public List<Project> getRelatedProject(int projectId) {
        String jpql = "SELECT p from Project p where p.projectId !=" + projectId+ " and p.isSharedAble=true ORDER BY FUNCTION('RAND')";
        TypedQuery<Project> query = entityManager.createQuery(jpql, Project.class);
        return query.setMaxResults(6).getResultList();
    }
}
