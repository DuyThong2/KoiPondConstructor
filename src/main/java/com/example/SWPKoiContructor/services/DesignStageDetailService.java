package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignStageDetailDAO;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import org.springframework.stereotype.Service;

@Service
public class DesignStageDetailService {
    private DesignStageDetailDAO designStageDetailDao;

    public DesignStageDetailService(DesignStageDetailDAO designStageDetailDao) {
        this.designStageDetailDao = designStageDetailDao;
    }
    
    public DesignStageDetail getDesignStageDetailOfDesignStage(int id){
        return designStageDetailDao.getDesignStageDetailOfDesignStage(id);
    }
    
    
}
