package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignStageDAO;
import com.example.SWPKoiContructor.entities.DesignStage;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
public class DesignStageService {
   
    private DesignStageDAO designStageDao;

    public DesignStageService(DesignStageDAO designStageDAO) {
        this.designStageDao = designStageDAO;
    }
    
        
    public DesignStage getDesignStageById(int id) {
        return designStageDao.getDesignStageById(id);
    }
    
    public List<DesignStage> getDesignStageByDesignId(int id) {
        return designStageDao.getDesignStageByDesignId(id);
    }
    
     
    public List<DesignStage> getDesignStageByDesignIdAndName(int designId, String stageName) {
        return designStageDao.getDesignStageByDesignIdAndName(designId, stageName);
    }
    
    @Transactional
    public DesignStage updateDesignStage(DesignStage designStage) {
        return designStageDao.updateDesignStage(designStage);
    }
}
