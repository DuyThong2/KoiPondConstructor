package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignDAO;
import com.example.SWPKoiContructor.dao.DesignStageDAO;
import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.Project;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DesignService {

    private DesignDAO designDao;
    private DesignStageDAO designStageDAO;
    private DesignStageService designStageService;
    private ProjectService projectService;
    private ConstructionService constructionService;

    public DesignService(DesignDAO designDao, DesignStageDAO designStageDAO, DesignStageService designStageService, ProjectService projectService, ConstructionService constructionService) {
        this.designDao = designDao;
        this.designStageDAO = designStageDAO;
        this.designStageService = designStageService;
        this.projectService = projectService;
        this.constructionService = constructionService;
    }

    public List<Object[]> getListDesignWithCustomerName() {
        return designDao.getListDesignWithCustomerName();
    }

    public Design getDesignById(int id) {
        return designDao.getDesignById(id);
    }

    
    protected void propagateStatusToDesign(int designId) {
        Design design = getDesignById(designId);

        // Check the status of all design stages to determine Design status
        if (design != null) {
            List<DesignStage> stages = designStageDAO.getDesignStageListOfDesign(designId);
            boolean allCompleted = stages.stream().allMatch(stage -> stage.getDesignStageStatus() == 4); // All completed
            boolean anyProcessing = stages.stream().anyMatch(stage -> stage.getDesignStageStatus() == 2); // Any processing

            if (allCompleted) {
                design.setStatus(3); // Completed // set contruction to processing
                allowConstructionToProceed(designId);
            } else if (anyProcessing) {
                design.setStatus(2); // Processing
            } else {
                design.setStatus(1); // Pending
            }
            designDao.updateDesign(design);

            // Step 4: Propagate changes to Project
            projectService.propagateStatusToProject(design.getProject().getProjectId());
        } else {
            throw new RuntimeException();
        }

    }

    
    

    
    private void allowConstructionToProceed(int projectId) {
        Project project = projectService.getProjectById(projectId);

        if (project != null) {
            Construction construction = project.getConstruction();
            if (construction != null && construction.getConstructionStatus() == 1) { // Pending
                construction.setConstructionStatus(2); // Set construction to Processing
                constructionService.updateConstruction(construction);
            }
        } else {
            throw new RuntimeException();
        }

    }

}
