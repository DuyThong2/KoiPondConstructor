
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionStageDetailDAO;
import org.springframework.stereotype.Service;

@Service
public class ConstructionStageDetailService {
    private ConstructionStageDetailDAO constructionStageDetailDao;

    public ConstructionStageDetailService(ConstructionStageDetailDAO constructionStageDetailDao) {
        this.constructionStageDetailDao = constructionStageDetailDao;
    }

    
    public ConstructionStageDetailDAO getConstructionStageDetail(int id){
        return constructionStageDetailDao.getConstructionStageDetail(id);
    }
    
}
