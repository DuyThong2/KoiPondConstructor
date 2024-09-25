/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConsultantDAO;
import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Staff;
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
        return consultantDAO.getConsultantListByCusName(cusName);
    }
    
    public Consultant getConsultantById(int id){
        return consultantDAO.getConsultantById(id);
    }
    
    public List<Consultant> getConsultantListByStaffId(int staffId){
        return consultantDAO.getConsultantListByStaffId(staffId);
    }
    
    @Transactional
    public Consultant updateConsultant(Consultant consultant){
        return consultantDAO.updateConsultant(consultant);
    }
    
    @Transactional
    public Consultant updateConsultantStaff(int id, Staff staff){
        return consultantDAO.updateConsultantStaff(id, staff);
    }
    
    @Transactional
    public Consultant updateConsultantStatus(int id, int status){
        return consultantDAO.updateConsultantStatus(id, status);
    }
}
