package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ProjectDAO;
import com.example.SWPKoiContructor.entities.Project;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProjectService {
    private ProjectDAO projectDAO;
    public ProjectService(ProjectDAO projectDAO){
        this.projectDAO = projectDAO;
    }

    public List<Project> getProjectList(){
        return projectDAO.getProjectList();
    }
    public List<Project> getProjectListIsSharable(){
        return projectDAO.getProjectListIsSharable();
    }


    public Project getProjectById(int id){
        return projectDAO.getProjectById(id);
    }
    @Transactional
    public Project createProject(Project project){
        return projectDAO.createProject(project);
    }
    @Transactional
    public Project updateProject(Project project){
        return projectDAO.updateProject(project);
    }
    @Transactional
    public void  deleteProject(int id){
         projectDAO.deleteProject(id);
    }
    @Transactional
    public Project updateProjectStatus(Project project,int status){
        return projectDAO.updateProjectStatus(project,status);
    }
    @Transactional
    public Project updateProjectStatus(int id,int status){
        return projectDAO.updateProjectStatus(id,status);
    }
}
