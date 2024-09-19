/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Staff;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */

@Repository
public class StaffDAO {
    
    
    private EntityManager entityManager;

    public StaffDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    public Staff getStaffById(int id){
        TypedQuery<Staff> tq = entityManager.createQuery("select s from Staff s where s.staffId = :id", Staff.class);
        tq.setParameter("id", id);
        return tq.getSingleResult();
    }
}
