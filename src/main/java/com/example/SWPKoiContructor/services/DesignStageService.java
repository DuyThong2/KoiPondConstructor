package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignStageDAO;
import com.example.SWPKoiContructor.dao.DesignStageDetailDAO;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import java.util.List;
import org.springframework.context.annotation.Lazy;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class DesignStageService {

   
    

    private DesignStageDAO designStageDAO;
    private DesignService designService;
    private DesignStageDetailDAO designStageDetailDAO;

    public DesignStageService(DesignStageDAO designStageDAO,@Lazy DesignService designService,DesignStageDetailDAO designStageDetail) {
        this.designStageDAO = designStageDAO;
        this.designService = designService;
        this.designStageDetailDAO = designStageDetail;
    }

    public List<DesignStage> getDesignStageListOfDesign(int id) {
        return designStageDAO.getDesignStageListOfDesign(id);
    }

    
    protected void propagateStatusToDesignStage(int designStageId) {
        DesignStage designStage = designStageDAO.getDesignStageById(designStageId);

        if (designStage != null) {
            List<DesignStageDetail> details = designStageDetailDAO.getDesignStageDetailOfDesignStageId(designStageId);
            boolean allCompleted = details.stream().allMatch(detail -> detail.getStatus() == 4); // All completed
            boolean anyProcessing = details.stream().anyMatch(detail -> detail.getStatus() != 1); // Any processing


            if (allCompleted) {
                designStage.setDesignStageStatus(4); // Approved
                allowNextDesignStage(designStage.getDesign().getDesignId(), designStageId);
            } else if (anyProcessing) {
                designStage.setDesignStageStatus(2); // Processing
            } else {
                designStage.setDesignStageStatus(1); // Pending
            }

            designStageDAO.updateDesignStage(designStage);

            // Step 3: Propagate changes to Design
            designService.propagateStatusToDesign(designStage.getDesign().getDesignId());
        }else{
            throw new RuntimeException();
        }
        // Check the status of all design stage details to determine DesignStage status

    }
    

        
    public DesignStage getDesignStageById(int id) {
        return designStageDAO.getDesignStageById(id);
    }
    
    public List<DesignStage> getDesignStageByDesignId(int id) {
        return designStageDAO.getDesignStageListOfDesign(id);
    }
    
     
    public List<DesignStage> getDesignStageByDesignIdAndName(int designId, String stageName) {
        return designStageDAO.getDesignStageByDesignIdAndName(designId, stageName);
    }
    
    @Transactional
    public DesignStage updateDesignStage(DesignStage designStage) {
        return designStageDAO.updateDesignStage(designStage);
    }
    
    private void allowNextDesignStage(int designId, int completedStageId) {
        List<DesignStage> stages = designStageDAO.findByDesignIdOrderById(designId);

        // Find the next stage after the completed stage
        for (int i = 0; i < stages.size(); i++) {
            if (stages.get(i).getDesignStageId() == completedStageId && i < stages.size() - 1) {
                DesignStage nextStage = stages.get(i + 1);
                if (nextStage.getDesignStageStatus() == 1) { // Pending status
                    nextStage.setDesignStageStatus(2); // Move to Processing
                    designStageDAO.updateDesignStage(nextStage);
                }
                break;
            }
        }

        // Check if the whole design is complete

    }
}
