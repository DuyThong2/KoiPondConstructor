package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ProjectDAO;
import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.entities.ConstructionStage;
import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Term;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProjectService {

    private ProjectDAO projectDAO;
    private DesignService designService;
    private ConstructionService constructionService;

    public ProjectService(ProjectDAO projectDAO, DesignService designService, ConstructionService constructionService) {
        this.projectDAO = projectDAO;
        this.designService = designService;
        this.constructionService = constructionService;
    }

    public List<Project> getProjectList() {
        return projectDAO.getProjectList();
    }

    public Project getProjectById(int id) {
       
            return projectDAO.getProjectById(id);
        
        
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
    
    @Transactional
    public void propagateStatusToProject(int projectId) {
        Project project = getProjectById(projectId);
        
        if (project != null) {
            Design design = project.getDesign();
            Construction construction = project.getConstruction();

            // Step 1: Update Project Status Based on Design and Construction
            if (design != null && design.getStatus() == 3 && (construction == null || construction.getConstructionStatus() == 3)) {
                project.setStatus(3); // Completed (Both Design and Construction are completed)
                project.setStage(5); // Finish
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
    

}
