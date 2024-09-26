package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionStageDAO;
import com.example.SWPKoiContructor.dao.ConstructionStageDetailDAO;
import com.example.SWPKoiContructor.entities.ConstructionStage;
import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import java.util.List;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

@Service
public class ConstructionStageService {

    private ConstructionStageDAO constructionStageDao;
    private ConstructionStageDetailDAO constructionStageDetailDAO;
    private ConstructionService constructionService;

    public ConstructionStageService(ConstructionStageDAO constructionStageDao, ConstructionStageDetailDAO constructionStageDetailDAO,
            @Lazy ConstructionService constructionService) {
        this.constructionStageDao = constructionStageDao;
        this.constructionStageDetailDAO = constructionStageDetailDAO;
        this.constructionService = constructionService;
    }

    

    public List<ConstructionStage> getListConstructionStage(int id) {
        return constructionStageDao.getListConstructionStagesByConstructionId(id);
    }

    protected void propagateStatusToConstructionStage(int constructionStageId) {
        ConstructionStage constructionStage = constructionStageDao.getConstructionStageById(constructionStageId);

        if (constructionStage != null) {
            List<ConstructionStageDetail> details = constructionStageDetailDAO.getConstructionStageDetailByStageId(constructionStageId);
            boolean allCompleted = details.stream().allMatch(detail -> detail.getConstructionStageDetailStatus() == 4); // All completed
            boolean anyProcessing = details.stream().anyMatch(detail -> detail.getConstructionStageDetailStatus() == 2); // Any processing

            if (allCompleted) {
                constructionStage.setConstructionStageStatus(4); // Approved
                allowNextConstructionStage(constructionStage.getConstruction().getConstructionId(), constructionStageId);
            } else if (anyProcessing) {
                constructionStage.setConstructionStageStatus(2); // Processing
            } else {
                constructionStage.setConstructionStageStatus(1); // Pending
            }

            constructionStageDao.updateConstructionStage(constructionStage);

            // Step 3: Propagate changes to the parent Construction
            constructionService.propagateStatusToConstruction(constructionStage.getConstruction().getConstructionId());
        } else {
            throw new RuntimeException();
        }
        // Check the status of all stage details

    }
    
    private void allowNextConstructionStage(int constructionId, int completedStageId) {
        List<ConstructionStage> stages = constructionStageDao.findByConstructionIdOrderById(constructionId);

        // Find the next stage after the completed stage
        for (int i = 0; i < stages.size(); i++) {
            if (stages.get(i).getConstructionStageId() == completedStageId && i < stages.size() - 1) {
                ConstructionStage nextStage = stages.get(i + 1);
                if (nextStage.getConstructionStageStatus() == 1) { // Pending status
                    nextStage.setConstructionStageStatus(2); // Move to Processing
                    constructionStageDao.updateConstructionStage(nextStage);
                }
                break;
            }
        }
    }

}
