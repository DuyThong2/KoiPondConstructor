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

    public ProjectDAO(EntityManager entityManager){
        this.entityManager  = entityManager;
    }

    public List<Project> getProjectList(){
        TypedQuery<Project> query = entityManager.createQuery("Select c from Project c order by c.status asc, c.dateStart desc", Project.class);
        return query.getResultList();
    }
    public List<Project> getProjectListIsSharable(){
        TypedQuery<Project> query = entityManager.createQuery("Select c from Project c where c.isSharedAble=1 order by c.dateEnd desc", Project.class);
        return query.getResultList();
    }
    public Project getProjectById(int id){
        try{
            return entityManager.find(Project.class,id);
        }catch (NoResultException e){
            return null;
        }
        
    }

    public Project createProject(Project project){
      entityManager.setFlushMode(FlushModeType.COMMIT);
      Project result = entityManager.merge(project);
      entityManager.setFlushMode(FlushModeType.AUTO);
      return result;
    }

    public Project updateProject(Project project){
        return entityManager.merge(project);
    }

    public void deleteProject(int id){
        Project deleteProject = this.getProjectById(id);
        if(deleteProject!=null)
            entityManager.remove(deleteProject);
    }

    public Project updateProjectStatus(Project project,int status){
        if(project!=null){
            project.setStatus(status);
            return entityManager.merge(project);
        } return null;
    }
    public Project updateProjectStatus(int id, int status){
        Project updateStatusProject = this.getProjectById(id);
        if(updateStatusProject!=null){
            updateStatusProject.setStatus(status);
            return entityManager.merge(updateStatusProject);
        } return null;
    }

}
