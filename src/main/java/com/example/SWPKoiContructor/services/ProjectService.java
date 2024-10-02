package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionDAO;
import com.example.SWPKoiContructor.dao.ContractDAO;
import com.example.SWPKoiContructor.dao.DesignDAO;
import com.example.SWPKoiContructor.dao.ProjectDAO;


import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.entities.ConstructionStage;
import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Term;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class ProjectService {

    private ProjectDAO projectDAO;

    private DesignDAO designDAO;
    private ConstructionDAO constructionDAO;

    private ContractDAO contractDAO;

    public ProjectService(ProjectDAO projectDAO) {
        this.projectDAO = projectDAO;
    }


    public List<Project> getProjectList(int size) {
        return projectDAO.getProjectList(size);

    }

    public List<Project> getProjectListIsSharable() {
        return projectDAO.getProjectListIsSharable();
    }

    public List<Project> getPaginationProjectList(int page, int size, String sortBy, String sortType) {
        return projectDAO.getPaginationProjectList(page, size, sortBy, sortType);
    }

    public Project getProjectById(int id) {
        return projectDAO.getProjectById(id);
    }

    public long countProject() {
        return projectDAO.countProject();
    }

    @Transactional
    public Project createProject(Project project) {
        //create design and construction
        Construction construction = createConstructionTemplate(project);
        Design design = createADesignTemplate(project);
        project.addDesign(design);
        project.addConstruction(construction);
        return projectDAO.createProject(project);
    }

    @Transactional
    public Project updateProject(Project project) {
        return projectDAO.updateProject(project);
    }

    @Transactional
    public void deleteProject(int id) {
        projectDAO.deleteProject(id);
    }

    @Transactional
    public Project updateProjectStatus(Project project, int status) {
        return projectDAO.updateProjectStatus(project, status);
    }

    @Transactional
    public Project updateProjectStatus(int id, int status) {
        return projectDAO.updateProjectStatus(id, status);
    }

    private Design createADesignTemplate(Project project) {
        Term term = project.getContract().getTerm();
        Design design = new Design();
        design.setStatus(1);

        design.setDesignName(project.getProjectName() + " design");

        List<DesignStage> listDesignStage = design.createListOfDesignStage(project);
        listDesignStage.forEach(designStage -> design.addDesignStage(designStage));

        listDesignStage.forEach((designStage) -> {
            designStage.createListOfDesignStageDetail(designStage, term)
                    .forEach(designStageDetail -> designStage.addDesignStageDetail(designStageDetail));
        });
        return design;
    }

    private Construction createConstructionTemplate(Project project) {
        Term term = project.getContract().getTerm();
        Construction construction = new Construction();
        construction.setConstructionStatus(1);

        construction.setConstructionName(project.getProjectName() + " construction");
        List<ConstructionStage> listConstructionStage = construction.createListOfConstructionStage(project);
        listConstructionStage.forEach(constructionStage -> construction.addConstructionStage(constructionStage));

        ConstructionStage raw = listConstructionStage.get(0);
        ConstructionStage complete = listConstructionStage.get(1);

        List<ConstructionStageDetail> rawDetail = raw.createListOfDesignStageDetailRaw(raw, term);
        List<ConstructionStageDetail> completeDetail = complete.createListOfDesignStageDetailComplete(complete, term);

        rawDetail.forEach(detail -> raw.addContructionDetailStage(detail));
        completeDetail.forEach(detail -> complete.addContructionDetailStage(detail));
        return construction;
    }


    protected void propagateStatusToProject(int projectId) {

        Project project = getProjectById(projectId);

        if (project != null) {
            Design design = project.getDesign();
            Construction construction = project.getConstruction();

            // Step 1: Update Project Status Based on Design and Construction
            if (design != null && design.getStatus() == 3 && (construction == null || construction.getConstructionStatus() == 3)) {
                project.setStatus(2); // Completed (Both Design and Construction are completed)
                project.setStage(4); // Maintenace
            } else if (construction != null && construction.getConstructionStatus() == 2) {
                project.setStatus(2); // Processing
                project.setStage(3); // Construction
            } else if (design != null && design.getStatus() == 2) {
                project.setStatus(2); // Processing
                project.setStage(2); // Design
            } else {
                project.setStatus(1); // Pending (if both are in Pending or if Design is not complete and Construction hasn't started)
                project.setStage(1); // Planning
            }

            // Step 2: Save the updated project status and stage
            projectDAO.updateProject(project);
        } else {
            throw new RuntimeException("Project not found with id: " + projectId);
        }
    }

    public List<Project> getPaginationProjectListByStatusAndStage(int page, int size, String sortBy, String sortType, Integer statusFilter, Integer stageFilter) {
        return projectDAO.getPaginationProjectListByStatusAndStage(page, size, sortBy, sortType, statusFilter, stageFilter);

    }

    public long countProjectFilter(Integer statusFilter, Integer stageFilter) {
        return projectDAO.countProjectFilter(statusFilter, stageFilter);
    }


    @Transactional
    public void updateProjectStage(int projectId){
        Project project = getProjectById(projectId);
        if(project!=null){
            Design design = project.getDesign();
            DesignStage startingDesignStage = design.getDesignStage().get(0);
            DesignStageDetail stratingDesignStageDetail = startingDesignStage.getDesignDetail().get(0);
            Construction construction = project.getConstruction();
            ConstructionStage startingConstructionStage = construction.getConstructionStage().get(0);
            ConstructionStageDetail startingConstructionStageDetail = startingConstructionStage.getConstructionStageDetail().get(0);
            switch (project.getStage()){
                case 1 :
                    project.setStage(2);
                    project.setStatus(2);
                    design.setStatus(2);
                    startingDesignStage.setDesignStageStatus(2);
                    stratingDesignStageDetail.setStatus(2);
                    break;
                case 2:
                    project.setStage(3);
                    construction.setConstructionStatus(2);
                    startingConstructionStage.setConstructionStageStatus(2);
                    startingConstructionStageDetail.setConstructionStageDetailStatus(2);
                    break;
                case 3:
                    project.setStage(4);
                    break;
                case 4:
                    project.setStage(5);
                    project.setStatus(3);
                    break;
                default:
                    break;
            }
            projectDAO.updateProject(project);
        }
    }

    public long countProjectProcessing() {
        return projectDAO.countProjectProcessing();
    }

    public long countProjectComplete() {
        return projectDAO.countProjectComplete();

    }


    public List<Project> getCustomerProjectsById(int customerId) {
        return projectDAO.getCustomerProjectsById(customerId);
    }
    public List<Project> getActiveCustomerProjectsById(int customerId) {
     return projectDAO.getActiveCustomerProjectsById(customerId);
    }

    public List<Project> getCompleteAndCancelCustomerProjectsById(int customerId) {
        return projectDAO.getCompleteAndCancelCustomerProjectsById(customerId);
    }

}