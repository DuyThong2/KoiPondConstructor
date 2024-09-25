/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.CustomerDAO;
import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.entities.Authority;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.exception.AccountIsExistException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    
    @Transactional
    public void registerCustomer(CustomerDTO customerDTO) {
        // Check if a customer with this email already exists
        if (customerDAO.isCustomerExists(customerDTO.getEmail())) {
            throw new AccountIsExistException("account is existed try to use another email");
        }

        // Map DTO to entity and save
        Customer customer = customerDTO.mapDTOToCustomer(customerDTO);
        Authority authority = new Authority("ROLE_CUSTOMER");
        customer.AddAuthorities(authority);
        customerDAO.createCustomer(customer);
    }

    
    
    
}
