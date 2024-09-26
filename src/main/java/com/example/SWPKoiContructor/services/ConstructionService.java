/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionDAO;
import com.example.SWPKoiContructor.dao.ConstructionStageDAO;
import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.entities.ConstructionStage;
import java.util.List;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

/**
 *
 * @author nasaf
 */
@Service
public class ConstructionService {

    private ConstructionDAO constructionDao;
    private ConstructionStageDAO constructionStageDAO;
    private ProjectService projectService;

    public ConstructionService(ConstructionDAO constructionDao, ConstructionStageDAO constructionStageDAO, @Lazy ProjectService projectService) {
        this.constructionDao = constructionDao;
        this.constructionStageDAO = constructionStageDAO;
        this.projectService = projectService;
    }

    

    public List<Object[]> getListConstructionByCustomerName() {
        return constructionDao.getListConstructionByCustomerName();
    }

    public Construction getConstructionById(int id) {
        return constructionDao.getConstructionById(id);
    }

    public Construction updateConstruction(Construction construction) {
        return constructionDao.updateConstruction(construction);
    }

    protected void propagateStatusToConstruction(int constructionId) {
        Construction construction = constructionDao.getConstructionById(constructionId);

        // Check the status of all construction stages to determine Construction status
        if (construction != null) {
            List<ConstructionStage> stages = constructionStageDAO.findByConstructionIdOrderById(constructionId);
            boolean allCompleted = stages.stream().allMatch(stage -> stage.getConstructionStageStatus() == 4); // All stages completed
            boolean anyProcessing = stages.stream().anyMatch(stage -> stage.getConstructionStageStatus() == 2); // Any stages processing

            if (allCompleted) {
                construction.setConstructionStatus(3); // Completed
            } else if (anyProcessing) {
                construction.setConstructionStatus(2); // Processing
            } else {
                construction.setConstructionStatus(1); // Pending
            }

            constructionDao.updateConstruction(construction);

            // Step 4: Propagate changes to the Project
            projectService.propagateStatusToProject(construction.getProject().getProjectId());
        }else{
            throw new RuntimeException();
        }

    }
}
