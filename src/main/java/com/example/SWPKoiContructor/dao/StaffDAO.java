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
import org.springframework.transaction.annotation.Transactional;

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
        TypedQuery<String> typedQuery= entityManager.createQuery("Select distinct c.department From Staff c",String.class);
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
    public long countStaff(){
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(s) FROM Staff s where s.enabled = true",Long.class);
        return query.getSingleResult();
    }

    public List<Staff> findByRoleAndProjectId(String role, int projectId) {
        TypedQuery<Staff> query = entityManager.createQuery(
                "SELECT s FROM Staff s WHERE s.department = :role AND s.project.id = :projectId", Staff.class);
        query.setParameter("role", role);
        query.setParameter("projectId", projectId);
        return query.getResultList();
    }
    public List<Staff> getAllStaff() {
        String query = "SELECT s FROM Staff s WHERE LOWER(s.department) IN ('design', 'construction')";
        TypedQuery<Staff> typedQuery = entityManager.createQuery(query, Staff.class);
        return typedQuery.getResultList();
    }

    // Method to search staff by name and filter by "design" or "construction" department
    public List<Staff> searchStaffByName(String name) {
        String query = "SELECT s FROM Staff s WHERE LOWER(s.department) IN ('design', 'construction')";
        if (name != null && !name.isEmpty()) {
            query += " AND LOWER(s.name) LIKE :name";
        }
        TypedQuery<Staff> typedQuery = entityManager.createQuery(query, Staff.class);

        if (name != null && !name.isEmpty()) {
            typedQuery.setParameter("name", "%" + name.toLowerCase() + "%");
        }

        return typedQuery.getResultList();
    }

    public void assignStaffToConstruction(int staffId, int constructionId) {
        try {
            entityManager.createNativeQuery(
                            "INSERT INTO Construction_Staff (staff_id, construction_id, role_in_project) VALUES (:staffId, :constructionId, :roleInProject)")
                    .setParameter("staffId", staffId)
                    .setParameter("constructionId", constructionId)
                    .setParameter("roleInProject", 1) // Assigning the value 1 directly
                    .executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Failed to assign staff to construction: " + e.getMessage(), e);
        }
    }


    public void assignStaffToDesign(int staffId, int designId) {
        try {
            entityManager.createNativeQuery(
                            "INSERT INTO Staff_Design (staff_id, design_id) VALUES (:staffId, :designId)")
                    .setParameter("staffId", staffId)
                    .setParameter("designId", designId)
                    .executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Failed to assign staff to design: " + e.getMessage(), e);
        }
    }
}
