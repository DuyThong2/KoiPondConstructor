package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignStageDetailDAO;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

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

    public DesignStageDetail getDesignStageDetailById(int designStageDetailId) {
     return designStageDetailDao.getDesignStageDetailById(designStageDetailId);
    }
    @Transactional
    public DesignStageDetail updateDesignStageDetailStatus(int designStageDetailId, int newStatus) {
        // Step 1: Update DesignStageDetail status
        DesignStageDetail designStageDetail = designStageDetailDao.getDesignStageDetailById(designStageDetailId);
        DesignStageDetail result = null;
        if (designStageDetail != null) {
            designStageDetail.setStatus(newStatus);
            result = designStageDetailDao.updateDesignStageDetail(designStageDetail);

            // Step 2: Propagate changes to DesignStage
            designStageService.propagateStatusToDesignStage(designStageDetail.getDesignStage().getDesignStageId());
        }
        return result;

    }

}
