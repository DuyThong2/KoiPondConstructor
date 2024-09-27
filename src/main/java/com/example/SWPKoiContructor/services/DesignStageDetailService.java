package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignStageDetailDAO;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DesignStageDetailService {

    private DesignStageDetailDAO designStageDetailDao;
    private DesignStageService designStageService;

    public DesignStageDetailService(DesignStageDetailDAO designStageDetailDao, DesignStageService designStageService) {
        this.designStageDetailDao = designStageDetailDao;
        this.designStageService = designStageService;
    }

    public List<DesignStageDetail> getDesignStageDetailOfDesignStageId(int id) {
        return designStageDetailDao.getDesignStageDetailOfDesignStageId(id);
    }

    @Transactional
    public void updateDesignStageDetailStatus(int designStageDetailId, int newStatus) {
        // Step 1: Update DesignStageDetail status
        DesignStageDetail designStageDetail = designStageDetailDao.getDesignStageDetailById(designStageDetailId);
        if (designStageDetail != null) {
            designStageDetail.setStatus(newStatus);
            designStageDetailDao.updateDesignStageDetail(designStageDetail);

            // Step 2: Propagate changes to DesignStage
            designStageService.propagateStatusToDesignStage(designStageDetail.getDesignStage().getDesignStageId());
        }

    }

}
