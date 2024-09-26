package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionStageDetailDAO;
import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ConstructionStageDetailService {

    private ConstructionStageDetailDAO constructionStageDetailDao;
    private ConstructionStageService constructionStageService;

    public ConstructionStageDetailService(ConstructionStageDetailDAO constructionStageDetailDao, @Lazy ConstructionStageService constructionStageService) {
        this.constructionStageDetailDao = constructionStageDetailDao;
        this.constructionStageService = constructionStageService;
    }

    public ConstructionStageDetail getConstructionStageDetail(int id) {
        return constructionStageDetailDao.getConstructionStageDetailByConstructionStageId(id);
    }

    @Transactional
    public void updateConstructionStageDetailStatus(int constructionStageDetailId, int newStatus) {
        // Step 1: Update ConstructionStageDetail status
        ConstructionStageDetail constructionStageDetail = constructionStageDetailDao.getConstructionStageDetailByConstructionStageId(constructionStageDetailId);
        if (constructionStageDetail != null) {
            constructionStageDetail.setConstructionStageDetailStatus(newStatus);
            constructionStageDetailDao.updateConstructionStageDetail(constructionStageDetail);

            // Step 2: Propagate changes to ConstructionStage
            constructionStageService.propagateStatusToConstructionStage(constructionStageDetail.getConstructionStage().getConstructionStageId());
        }

    }
}
