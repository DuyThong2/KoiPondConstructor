package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignStageDAO;
import com.example.SWPKoiContructor.entities.DesignStage;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DesignStageService {
    private DesignStageDAO designStageDao;

    public DesignStageService(DesignStageDAO designStageDAO) {
        this.designStageDao = designStageDAO;
    }
    
    public List<DesignStage> getDesignStageListOfDesign(int id){
        return designStageDao.getDesignStageListOfDesign(id);
    }
}
