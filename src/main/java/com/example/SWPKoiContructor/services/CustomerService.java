/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.CustomerDAO;
import com.example.SWPKoiContructor.entities.Customer;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */

@Service
public class CustomerService {
    
    private CustomerDAO customerDAO;

    public CustomerService(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }
    
    public Customer getCustomerById(int id){
        return customerDAO.getCustomerById(id);
    }
    
    
}
