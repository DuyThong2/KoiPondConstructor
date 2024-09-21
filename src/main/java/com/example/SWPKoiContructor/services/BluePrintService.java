package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.BluePrintDAO;
import com.example.SWPKoiContructor.entities.BluePrint;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class BluePrintService {
    private BluePrintDAO bluePrintDao;

    public BluePrintService(BluePrintDAO bluePrintDao) {
        this.bluePrintDao = bluePrintDao;
    }
    
    
    //xem lại cái này có phải là list hay ko??????????
     public List<BluePrint> getBluePrintListOfDesignStage(int id){
         return bluePrintDao.getBluePrintListOfDesignStage(id);
     }
}
