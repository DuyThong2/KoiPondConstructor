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

    public List<Project> getProjectList(int size){
        return projectDAO.getProjectList(size);
    }
    public List<Project> getProjectListIsSharable(){
        return projectDAO.getProjectListIsSharable();
    }

    public List<Project> getPaginationProjectList(int page, int size, String sortBy, String sortType){
        return projectDAO.getPaginationProjectList(page,size,sortBy,sortType);
    }
    public Project getProjectById(int id){
        return projectDAO.getProjectById(id);
    }
    public long countProject(){
        return projectDAO.countProject();
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

    public List<Project> getPaginationProjectListByStatusAndStage(int page, int size, String sortBy, String sortType, Integer statusFilter, Integer stageFilter) {
        return projectDAO.getPaginationProjectListByStatusAndStage(page,size,sortBy,sortType,statusFilter,stageFilter);

    }

    public long countProjectFilter(Integer statusFilter, Integer stageFilter) {
        return projectDAO.countProjectFilter(statusFilter,stageFilter);
    }
}
