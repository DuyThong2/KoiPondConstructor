/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ParcelDAO;
import com.example.SWPKoiContructor.entities.Parcel;
import java.util.List;
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
    
}
