/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ConsultantDAO;
import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.User;
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
    
    
    //MANAGER CONSULTANT MANAGE
    public List<Consultant> getConsultantListOrderByAndSort(int page, int size, String sortBy, String sortDirection){
        return consultantDAO.getConsultantList(page, size, sortBy, sortDirection);
    }
    
    public List<Consultant> getConsultantListByOrderSortFilter(int page, int size, String sortBy, String sortDirection, int status){
        return consultantDAO.getConsultantList(page, size, sortBy, sortDirection, status);
    }
    
    public long countConsultantByStatus(int status){
        return consultantDAO.countConsultantByStatus(status);
    }
    
    public long countConsultant(){
        return consultantDAO.countConsultant();
    }
    
     public List<Consultant> getConsultantListOrderByAndSortCustomer(int page, int size, String sortBy, String sortDirection, Integer status, User customer){
        return consultantDAO.getFilteredConsultantCustomer(page, size, sortBy, sortDirection, status, customer);
    }
     
    public long countConsultantListOrderByAndSortCustomer(int page, int size, String sortBy, String sortDirection, Integer status, User customer){
        return consultantDAO.countFilteredConsultantCustomer(page, size, sortBy, sortDirection, status, customer);
    }
    
    //CONSULTANT DETAIL    
    public Consultant getConsultantById(int id){
        return consultantDAO.getConsultantById(id);
    }
    
    
    //STAFF CONSULTANT MANAGE
    public List<Consultant> getConsultantListByStaffId(int staffId){
        return consultantDAO.getConsultantListByStaffId(staffId);
    }
    
    public List<Consultant> getConsultantListByStaffIdOrderSort(int id, int page, int size, String sortBy, String sortDirection){
        return consultantDAO.getConsultantListByStaffId(id, page, size, sortBy, sortDirection);
    }
    
    public List<Consultant> getConsultantListByStaffIdOrderSortFilter(int id, int page, int size, String sortBy, String sortDirection, int status){
        return consultantDAO.getConsultantListByStaffId(id, page, size, sortBy, sortDirection, status);
    }
    
    public long countConsultantByStaffIdAndStatus(int id, int status){
        return consultantDAO.countConsultantByStatusAndStaffId(id, status);
    }
    
    public long countConsultantByStaffId(int id){
        return consultantDAO.countConsultantByStaffId(id);
    }
    
    
    
    
    //UPDATE ZONE
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
    
    @Transactional
    public Consultant createConsultant(Consultant consultant){
        return consultantDAO.createNewConsultant(consultant);
    }
    
    @Transactional
    public Consultant setCustomer(int id, Customer customer){
        return consultantDAO.setCustomerForConsultant(id, customer);
    }
}
