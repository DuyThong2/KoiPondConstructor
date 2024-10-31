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

import com.example.SWPKoiContructor.entities.Project;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import javax.persistence.TypedQuery;

/**
 *
 * @author nasaf
 */
@Service
public class ConstructionService {

    private ConstructionDAO constructionDAO;
    private ConstructionStageDAO constructionStageDAO;
    private ProjectService projectService;

    public ConstructionService(ConstructionDAO constructionDAO, ConstructionStageDAO constructionStageDAO, @Lazy ProjectService projectService) {
        this.constructionDAO = constructionDAO;
        this.constructionStageDAO = constructionStageDAO;
        this.projectService = projectService;
    }

    public List<Construction> getListConstruction(Integer staffId, int page, int size, Integer statusFilter, String searchName) {
        return constructionDAO.getPaginatedConstructions(staffId, page, size, statusFilter, searchName);
    }

    // Method to get total pages with optional filtering by staffId, status, and search by name
    public int getTotalPages(Integer staffId, int size, Integer statusFilter, String searchName) {
        long totalRecords = constructionDAO.countConstructions(staffId, statusFilter, searchName);
        return (int) Math.ceil((double) totalRecords / size);
    }

    public Construction getConstructionById(int id) {
        return constructionDAO.getConstructionById(id);
    }

    public Construction updateConstruction(Construction construction) {
        return constructionDAO.updateConstruction(construction);
    }

    

    protected void propagateStatusToConstruction(int constructionId) {
        Construction construction = constructionDAO.getConstructionById(constructionId);

        // Check the status of all construction stages to determine Construction status
        if (construction != null) {
            List<ConstructionStage> stages = constructionStageDAO.findByConstructionIdOrderById(constructionId);
            boolean allCompleted = stages.stream().allMatch(stage -> stage.getConstructionStageStatus() == 4); // All stages completed
            boolean anyProcessing = stages.stream().anyMatch(stage -> stage.getConstructionStageStatus() != 1); // Any stages processing

            if (allCompleted) {
                construction.setConstructionStatus(3); // Completed
            } else if (anyProcessing) {
                construction.setConstructionStatus(2); // Processing
            } else {
                construction.setConstructionStatus(1); // Pending
            }

            constructionDAO.updateConstruction(construction);

            // Step 4: Propagate changes to the Project
            projectService.propagateStatusToProject(construction.getProject().getProjectId());
        } else {
            throw new RuntimeException();
        }

    }
    public List<Construction> getConstructionByStaffId(int staffId) {
        return constructionDAO.getconstructionByStaffId(staffId);
    }
    public long countConstructionsByStaff(int staffId) {
        return constructionDAO.countConstructions(staffId,null,null);
    }
    public long countConstructionsInProcessByStaffId(int staffId) {
        return constructionDAO.countConstructionsInProcessByStaffId(staffId);
    }
    public long countConstructionsInCompleteByStaffId(int staffId) {
        return constructionDAO.countConstructionsInCompleteByStaffId(staffId);
    }
}
