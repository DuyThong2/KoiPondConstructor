/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Staff;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * <<<<<<< HEAD
 * @a
 *
 * uthor Admin
 */
@Repository
public class StaffDAO {

    private EntityManager entityManager;

    public StaffDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Staff> getListStaff() {
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT s FROM Staff s", Staff.class);
        return tq.getResultList();
    }

    public List<Staff> getListStaffByRole(String department) {
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT s FROM Staff s WHERE s.department = :role", Staff.class);
        tq.setParameter("role", department);
        return tq.getResultList();
    }

    public Staff getStaffById(int id) {
        try {
            TypedQuery<Staff> tq = entityManager.createQuery("SELECT s FROM Staff s WHERE s.id = :id", Staff.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null; // Return empty if no customer is found
        }

    }

    public List<Staff> getTopStaffList(){
        TypedQuery<String> typedQuery= entityManager.createQuery("Select distinct c.staffRole From Staff c",String.class);
        List<String> roleList= typedQuery.getResultList();
        List<Staff> listStaff = new ArrayList<>();
        roleList.forEach(role ->{
            List<Staff> staffList= getListStaffByRole(role);
            Staff staff = staffList.get(0);
            listStaff.add(staff);
        });
        return listStaff;
    }


    public Staff createStaff(Staff staff){
        Staff createStaff = entityManager.merge(staff);
        return createStaff;
    }

    public Staff updateStaff(Staff staff) {
        return entityManager.merge(staff);
    }

    public void removeStaff(int id) {
        Staff removeStaff = getStaffById(id);
        entityManager.remove(removeStaff);
    }

    public Staff findStaffByEmail(String email) {
        try {
            TypedQuery<Staff> tq = entityManager.createQuery("SELECT s from Staff s where s.email = :email", Staff.class);
            tq.setParameter("email", email);
            Staff result = tq.getSingleResult();
            System.out.println(result);
            return result;
        } catch (NoResultException e) {
            return null; // Return empty if no customer is found
        }

    }

}
