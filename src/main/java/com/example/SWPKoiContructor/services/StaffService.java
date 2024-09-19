/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.StaffDAO;
import com.example.SWPKoiContructor.entities.Staff;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */

@Service
public class StaffService {
    
    private StaffDAO staffDAO;

    public StaffService(StaffDAO staffDAO) {
        this.staffDAO = staffDAO;
    }
    
    
    public Staff getStaffById(int id){
        return staffDAO.getStaffById(id);
    }
    
}
