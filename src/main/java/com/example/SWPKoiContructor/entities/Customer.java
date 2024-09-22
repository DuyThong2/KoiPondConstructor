/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "Customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id")
    private int customerId;

    private String username;

    @Column(name = "customer_phone")
    private String customerPhone;

    @Column(name = "customer_email")
    private String customerEmail;
  
    private String password;

    private boolean status;

    @Column(name = "user_type")
    private String userType;
    
    @OneToMany(mappedBy = "customer")
    private List<Consultant> consultant;

    @OneToMany(mappedBy = "customer")
    private List<Quotes> quotes;
    
    @OneToMany(mappedBy="customer")
    private List<Contract> contracts;

    public Customer(String username, String customerPhone, String customerEmail, String password, boolean status, String userType) {
        this.username = username;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.password = password;
        this.status = status;
        this.userType = userType;
    }

    public Customer() {
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public List<Consultant> getConsultant() {
        return consultant;
    }

    public void setConsultant(List<Consultant> consultant) {
        this.consultant = consultant;
    }

    public List<Quotes> getQuotes() {
        return quotes;
    }

    public void setQuotes(List<Quotes> quotes) {
        this.quotes = quotes;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }
    
    public void addContract(Contract contract){
        this.contracts.add(contract);
        contract.setCustomer(this);
        
    }

    @Override
    public String toString() {
        return "Customer{" + "customerId=" + customerId + ", username=" + username + ", customerPhone=" + customerPhone + ", customerEmail=" + customerEmail + ", password=" + password + ", status=" + status + ", userType=" + userType + '}';
    }
    
    
}
