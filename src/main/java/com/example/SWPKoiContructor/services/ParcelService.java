/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ParcelDAO;
import com.example.SWPKoiContructor.entities.Parcel;
import java.util.List;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;


/**
 *
 * @author HP
 */
@Service
public class ParcelService {
    private ParcelDAO parcelDAO;

    public ParcelService(ParcelDAO parcelDAO) {
        this.parcelDAO = parcelDAO;
    }
    
    public List<Parcel> viewParcelList(){
        return parcelDAO.viewParcelList();
    }
    public List<Parcel> viewParcelActiveList() { return  parcelDAO.viewParcelActiveList(); }
    //--------------------------------------------- VIEW PARCEL LIST SORT FILTER  ----------------------------------------------------
    public List<Parcel> viewParcelListOrderSort(int page, int size, String sortBy, String sortDirection){
        return parcelDAO.viewParcelListByOrderSort(page, size, sortBy, sortDirection);
    }
               
    public long countParcel(){
        return parcelDAO.countParcel();
    }
    //--------------------------------------------- OTHER -----------------------------------------
    public Parcel getParcelById(int id){
        return parcelDAO.getParcelById(id);
    }
    
    @Transactional
    public Parcel saveParcel(Parcel parcel){
        return parcelDAO.saveParcel(parcel);
    }
    
    @Transactional
    public Parcel updateParcel(Parcel parcel){
        return parcelDAO.updateParcel(parcel);
    }
}
