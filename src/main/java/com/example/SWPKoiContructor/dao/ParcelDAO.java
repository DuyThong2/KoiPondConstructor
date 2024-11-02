/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Parcel;
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
public class ParcelDAO {

    private EntityManager entityManager;

    public ParcelDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    //--------------------------------------------------VIEW NORMAL PARCEL ----------------------------------------------------------------
    public List<Parcel> viewParcelList() {
        TypedQuery<Parcel> tq = entityManager.createQuery("SELECT p FROM Parcel p", Parcel.class);
        return tq.getResultList();
    }
    public List<Parcel> viewParcelActiveList() {
        TypedQuery<Parcel> tq = entityManager.createQuery("SELECT p FROM Parcel p where p.package_status = 1 order by p.designOnSquareRoot asc, p.constructionPriceOnSquareRoot asc", Parcel.class);
        return tq.getResultList();
    }
    //---------------------------------------------- VIEW PARCEL MANAGER HAVE SORT FILTER ----------------------------------------------------    
    public List<Parcel> viewParcelListByOrderSort(int page, int size, String sortBy, String sortDirection) {
        TypedQuery<Parcel> tq = entityManager.createQuery("SELECT p FROM Parcel p ORDER BY " + sortBy + " " + sortDirection, Parcel.class);
        tq.setFirstResult(size * page);
        tq.setMaxResults(size);
        return tq.getResultList();
    }

    public long countParcel() {
        TypedQuery<Long> tq = entityManager.createQuery("SELECT Count(p) FROM Parcel p ", Long.class);
        return tq.getSingleResult();
    }

    //-------------------------------------------- OTHER ----------------------------------------------------------------------------
    public Parcel getParcelById(int id) {
        try {
            TypedQuery<Parcel> tq = entityManager.createQuery("SELECT p FROM Parcel p WHERE p.packageId = :id ", Parcel.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    public Parcel saveParcel(Parcel parcel) {
        Parcel newParcel = entityManager.merge(parcel);
        return newParcel;
    }

    public Parcel updateParcel(Parcel parcel) {
        return entityManager.merge(parcel);
    }
}
