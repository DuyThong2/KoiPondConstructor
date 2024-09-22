/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Staff;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP
 */
@Repository
public class ConsultantDAO {
    
    private EntityManager entityManager;

    public ConsultantDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    //default
    public List<Consultant> getConsultantList(){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c ",Consultant.class);
        return tq.getResultList();
    }
    
    //search by id
    public Consultant getConsultantById(int Id){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.consultantId = :id", Consultant.class);
        tq.setParameter("id", Id);
        return tq.getSingleResult();
    }
    
    //search theo name
    public List<Consultant> getConsultantListByCusName(String name){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.consultantCustomerName like :ConsultantCusName", Consultant.class);
        tq.setParameter("ConsultantCusName", "%" + name + "%");
        return tq.getResultList();
    }
    
    //search theo staffId
    public List<Consultant> getConsultantListByStaffId(int staffId){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.staff.staffId = :staffId", Consultant.class);
        tq.setParameter("staffId", staffId);
        return tq.getResultList();
    }
    
    //tao moi consultant
    public Consultant createNewConsultant(Consultant consultant){
        Consultant newConsultant = entityManager.merge(consultant);
        return newConsultant;
    }
    
    //cap nhat all
    public Consultant updateConsultant(Consultant consultant){
        return entityManager.merge(consultant);
    }
    
    
    
    public Consultant updateConsultantStatus(int id, int status){
        Consultant consultant = getConsultantById(id);
        consultant.setConsultantStatus(status);
        return consultant;
    }
    
    public Consultant updateConsultantStaff(int id, Staff staff){
        Consultant consultant = getConsultantById(id);
        consultant.setStaff(staff);
        return consultant;
    }
}
