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
import javax.persistence.NoResultException;
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

    public List<Consultant> getConsultantList(int page, int size, String sortBy, String sortDirection){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c ORDER BY c." + sortBy + " " + sortDirection, Consultant.class);
        
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        
        return tq.getResultList();
    }
    
    //test sort va filter
    public List<Consultant> getConsultantList(int page, int size, String sortBy, String sortDirection, int status){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.consultantStatus = :status ORDER BY c." + sortBy + " " + sortDirection, Consultant.class);
        
        tq.setParameter("status", status);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        
        return tq.getResultList();
    }
    
    //lay tong so luong theo status
    public long countConsultantByStatus(int status){
        TypedQuery<Long> tq = entityManager.createQuery("SELECT COUNT(c) FROM Consultant c WHERE c.consultantStatus = :status", Long.class);
        tq.setParameter("status", status);
        return tq.getSingleResult();
    }
    
    //lay tong so luong
    public long countConsultant(){
        TypedQuery<Long> tq = entityManager.createQuery("SELECT COUNT(c) FROM Consultant c", Long.class);
        return tq.getSingleResult();
    }

    //search by id
    public Consultant getConsultantById(int Id) {
        try {
            TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.consultantId = :id", Consultant.class);
            tq.setParameter("id", Id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    //search theo staffId
    public List<Consultant> getConsultantListByStaffId(int staffId) {
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.staff.id = :staffId order by c.consultantStatus asc ", Consultant.class);
        tq.setParameter("staffId", staffId);
        return tq.getResultList();
    }
    
    //CONSULTANT GET LIST BY STAFF
    public List<Consultant> getConsultantListByStaffId(int id, int page, int size, String sortBy, String sortDirection){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.staff.id = :id ORDER BY c." + sortBy + " " + sortDirection, Consultant.class);
        tq.setParameter("id", id);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }
    
    public List<Consultant> getConsultantListByStaffId(int id, int page, int size, String sortBy, String sortDirection, int status){
        TypedQuery<Consultant> tq = entityManager.createQuery("SELECT c FROM Consultant c WHERE c.staff.id = :id AND c.consultantStatus = :status ORDER BY c." + sortBy + " " + sortDirection, Consultant.class);
        tq.setParameter("status", status);
        tq.setParameter("id", id);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }
    
    public long countConsultantByStatusAndStaffId(int id, int status){
        TypedQuery<Long> tq = entityManager.createQuery("SELECT COUNT(c) FROM Consultant c WHERE c.consultantStatus = :status AND c.staff.id = :id", Long.class);
        tq.setParameter("id", id);
        tq.setParameter("status", status);
        return tq.getSingleResult();
    }
    
    public long countConsultantByStaffId(int id){
        TypedQuery<Long> tq = entityManager.createQuery("SELECT COUNT(c) FROM Consultant c WHERE c.staff.id = :id", Long.class);
        tq.setParameter("id", id);       
        return tq.getSingleResult();
    }

    //tao moi consultant
    public Consultant createNewConsultant(Consultant consultant) {
        Consultant newConsultant = entityManager.merge(consultant);
        return newConsultant;
    }

    //cap nhat all
    public Consultant updateConsultant(Consultant consultant) {
        return entityManager.merge(consultant);
    }

    
    
    //update consultant status
    public Consultant updateConsultantStatus(int id, int status){

        Consultant consultant = getConsultantById(id);
        consultant.setConsultantStatus(status);
        return consultant;
    }

    public Consultant updateConsultantStaff(int id, Staff staff) {
        Consultant consultant = getConsultantById(id);
        consultant.setStaff(staff);
        consultant.setConsultantStatus(2);
        return consultant;
    }
}
