/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConsultantDAO;
import com.example.SWPKoiContructor.entities.Consultant;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP
 */
@Service
public class ConsultantService {
    private ConsultantDAO consultantDAO;

    public ConsultantService(ConsultantDAO consultantDAO) {
        this.consultantDAO = consultantDAO;
    }
    
    public List<Consultant> getConsultantList(){
        return consultantDAO.getConsultantList();
    }
    
    public List<Consultant> getConsultantListByCusName(String cusName){
        return consultantDAO.getConsultantByCusName(cusName);
    }
    
    public Consultant getConsultantById(int id){
        return consultantDAO.getConsultantById(id);
    }
    
    @Transactional
    public Consultant updateConsultant(Consultant consultant){
        return consultantDAO.updateConsultant(consultant);
    }
    
}
