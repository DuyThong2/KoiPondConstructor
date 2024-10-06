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
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */

@Service
public class CustomerService {
    
    private CustomerDAO customerDAO;
    private PasswordEncoder passwordEncoder;

    public CustomerService(CustomerDAO customerDAO,@Lazy PasswordEncoder passwordEncoder) {
        this.customerDAO = customerDAO;
        this.passwordEncoder = passwordEncoder;
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
        String encodedPassword = passwordEncoder.encode(customerDTO.getPassword());
        customer.setPassword(encodedPassword); 
        Authority authority = new Authority("ROLE_CUSTOMER");
        customer.AddAuthorities(authority);
        customerDAO.createCustomer(customer);
    }
    
    public Customer getCustomerByEmail(String email){
        return customerDAO.getCustomerByEmail(email);
    }

    
    
    
}
