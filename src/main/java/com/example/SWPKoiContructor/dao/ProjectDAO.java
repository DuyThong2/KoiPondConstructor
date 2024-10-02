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
import java.util.List;
import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;

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

    public List<Project> getProjectListIsSharable() {
        TypedQuery<Project> query = entityManager.createQuery("Select c from Project c where c.isSharedAble=1 order by c.dateEnd desc", Project.class);
        return query.getResultList();
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

    public List<Project> getPaginationProjectListByStatusAndStage(int page, int size, String sortBy, String sortType, Integer statusFilter, Integer stageFilter) {
        StringBuilder queryBuilder = new StringBuilder("SELECT c FROM Project c");

        String filter = filterQueryString(statusFilter, stageFilter);
        queryBuilder.append(filter);

        queryBuilder.append(" ORDER BY c.").append(sortBy).append(" ").append(sortType);

        TypedQuery<Project> query = entityManager.createQuery(queryBuilder.toString(), Project.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (stageFilter != null) {
            query.setParameter("stageFilter", stageFilter);
        }

        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countProjectFilter(Integer statusFilter, Integer stageFilter) {
        StringBuilder queryBuilder = new StringBuilder("Select Count(c) from Project c");
        String filter = filterQueryString(statusFilter, stageFilter);
        queryBuilder.append(filter);

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);
        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if (stageFilter != null) {
            query.setParameter("stageFilter", stageFilter);
        }
        return query.getSingleResult();
    }

    private String filterQueryString(Integer statusFilter, Integer stageFilter) {
        StringBuilder queryBuilder = new StringBuilder();
        boolean hasStatusFilter = (statusFilter != null);
        boolean hasStageFilter = (stageFilter != null);

        if (hasStatusFilter || hasStageFilter) {
            queryBuilder.append(" WHERE");
            if (hasStatusFilter) {
                queryBuilder.append(" c.status = :statusFilter");
            }
            if (hasStageFilter) {
                if (hasStatusFilter) {
                    queryBuilder.append(" AND");
                }
                queryBuilder.append(" c.stage = :stageFilter");
            }
        } else {
            return null;
        }
        return queryBuilder.toString();
    }

    public long countProjectProcessing() {
        TypedQuery<Long> query = entityManager.createQuery("Select Count(c) from Project c where c.status = 2", Long.class);
        return query.getSingleResult();
    }

    public long countProjectComplete() {
        TypedQuery<Long> query = entityManager.createQuery("Select Count(c) from Project c where c.status = 3", Long.class);
        return query.getSingleResult();
    }
}
