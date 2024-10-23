package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionStageDetailDAO;
import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import java.util.List;
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
        return constructionStageDetailDao.getConstructionStageDetailByConstructionStageDetailId(id);
    }

    public List<ConstructionStageDetail> getConstructionStageDetailByStageId(int id) {
        return constructionStageDetailDao.getConstructionStageDetailByStageId(id);
    }

    @Transactional
    public ConstructionStageDetail updateConstructionStageDetailStatus(int constructionStageDetailId, int newStatus) {
        ConstructionStageDetail result = null;
        // Step 1: Update ConstructionStageDetail status
        ConstructionStageDetail constructionStageDetail = constructionStageDetailDao.getConstructionStageDetailByConstructionStageDetailId(constructionStageDetailId);
        if (constructionStageDetail != null) {
            System.out.println(constructionStageDetail.getConstructionStageDetailDescription() + constructionStageDetail.getConstructionStageDetailId());
            constructionStageDetail.setConstructionStageDetailStatus(newStatus);
            result = constructionStageDetailDao.updateConstructionStageDetail(constructionStageDetail);

            // Step 2: Propagate changes to ConstructionStage
            constructionStageService.propagateStatusToConstructionStage(constructionStageDetail.getConstructionStage().getConstructionStageId());
        }
        return result;

    }

    public ConstructionStageDetail getPreviousStageDetail(int constructionStageId) {
        return constructionStageDetailDao.getPreviousStageDetail(constructionStageId);
    }
}
