package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.BluePrintDAO;
import com.example.SWPKoiContructor.entities.BluePrint;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BluePrintService {

    @Autowired
    private BluePrintDAO bluePrintDao;

    public BluePrintService(BluePrintDAO bluePrintDao) {
        this.bluePrintDao = bluePrintDao;
    }

    public List<BluePrint> findByDesignStageId(int id) {
        return bluePrintDao.findByDesignStageId(id);
    }

    public BluePrint getBluePrintById(int bluePrintId) {
        return bluePrintDao.getBluePrintById(bluePrintId);
    }

    public List<BluePrint> findByDesignStageIdWithComments(int designStageId) {
        return bluePrintDao.findByDesignStageIdWithComments(designStageId);
    }

    @Transactional
    public void deleteBluePrint(int bluePrintId) {
        bluePrintDao.deleteBluePrint(bluePrintId);
    }

    @Transactional
    public void saveBluePrint(BluePrint bluePrint) {
        bluePrintDao.saveBluePrint(bluePrint);
    }

}
