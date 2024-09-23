package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.DesignDAO;
import com.example.SWPKoiContructor.entities.Design;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DesignService {

    private DesignDAO designDao;

    public DesignService(DesignDAO designDao) {
        this.designDao = designDao;
    }

    public List<Object[]> getListDesignWithCustomerName() {
        return designDao.getListDesignWithCustomerName();
    }

    public Design getDesignById(int id) {
        return designDao.getDesignById(id);
    }
    
    
    
    

}
