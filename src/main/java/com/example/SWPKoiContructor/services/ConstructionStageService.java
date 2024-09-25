
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConstructionStageDAO;
import com.example.SWPKoiContructor.entities.ConstructionStage;
import java.util.List;
import org.springframework.stereotype.Service;


@Service
public class ConstructionStageService {
    
    private ConstructionStageDAO ConstructionStageDao;

    public ConstructionStageService(ConstructionStageDAO ConstructionStageDao) {
        this.ConstructionStageDao = ConstructionStageDao;
    }
    
    
    public List<ConstructionStage> getListConstructionStage(int id){
        return ConstructionStageDao.getListConstructionStages(id);
    }
}
