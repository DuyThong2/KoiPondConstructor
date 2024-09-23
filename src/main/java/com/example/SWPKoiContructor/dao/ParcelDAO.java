/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Parcel;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP
 */
@Repository
public class ParcelDAO {
    private EntityManager entityManager;

    public ParcelDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
            
    public List<Parcel> viewParcelList(){
        TypedQuery<Parcel> tq = entityManager.createQuery("SELECT p FROM Parcel p", Parcel.class);
        return tq.getResultList();
    }
}
