/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Staff;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
<<<<<<< HEAD
 * @author Admin
 */


    
    

@Repository
public class StaffDAO {

    private EntityManager entityManager;

    public StaffDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    

    public List<Staff> getListStaff(){
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT * FROM Staff", Staff.class);
        return tq.getResultList();
    }
    
    public List<Staff> getListConsultantStaff(){
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT * FROM Staff s WHERE s.staff_role = 'Consultant", Staff.class);
        return tq.getResultList();
    }
    
    public Staff getStaffById(int id){
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT * FROM Staff s WHERE s.staff_id = :id", Staff.class);
        tq.setParameter("id", id);
        return tq.getSingleResult();
    }
    
    public Staff createStaff(Staff staff){
        Staff createStaff = entityManager.merge(staff);
        return createStaff;
    }
    
    public Staff updateStaff(Staff staff){
        return entityManager.merge(staff);
    }
    
    public void removeStaff(int id){
        Staff removeStaff = getStaffById(id);
        entityManager.remove(removeStaff);
    }
    
    

}
