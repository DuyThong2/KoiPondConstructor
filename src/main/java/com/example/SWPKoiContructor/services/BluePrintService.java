package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.BluePrintDAO;
import com.example.SWPKoiContructor.entities.BluePrint;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

@Service
public class BluePrintService {
    private BluePrintDAO bluePrintDao;

    public BluePrintService(BluePrintDAO bluePrintDao) {
        this.bluePrintDao = bluePrintDao;
    }

    public List<BluePrint> findByDesignStageId(int id) {
        return bluePrintDao.findByDesignStageId(id);
    }

}
