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
@Table(name = "Customers")
public class Customer extends User{
    
    @OneToMany(mappedBy = "customer")
    private List<Consultant> consultant;

    @OneToMany(mappedBy = "customer")
    private List<Quotes> quotes;
    
    @OneToMany(mappedBy="customer")
    private List<Contract> contracts;
    
    @OneToMany(mappedBy = "customer")
    private List<Comment> comment;
    
    @OneToMany(mappedBy = "customer")
    private List<LoyaltyPoint> point;
    
    @OneToMany(mappedBy = "customer")
    private List<ServiceQuotes> serviceQuotes;
    
    public Customer(String name, String email, String imgURL, String phone, String password, boolean enable) {
        super(name, email, imgURL, phone, password, enable);
    }

    public Customer() {
    }

    public List<Consultant> getConsultant() {
        return consultant;
    }

    public List<Quotes> getQuotes() {
        return quotes;
    }

    public List<Contract> getContracts() {
        return contracts;
    }

    public void setConsultant(List<Consultant> consultant) {
        this.consultant = consultant;
    }

    public void setQuotes(List<Quotes> quotes) {
        this.quotes = quotes;
    }

    public void setContracts(List<Contract> contracts) {
        this.contracts = contracts;
    }

    @Override
    public String toString() {
        return super.toString();
    }
    
    
    
    public List<Comment> getComment() {
        return comment;
    }

    public void setComment(List<Comment> comment) {
        this.comment = comment;
    }

    public List<LoyaltyPoint> getPoint() {
        return point;
    }

    public void setPoint(List<LoyaltyPoint> point) {
        this.point = point;
    }

    public List<ServiceQuotes> getServiceQuotes() {
        return serviceQuotes;
    }

    public void setServiceQuotes(List<ServiceQuotes> serviceQuotes) {
        this.serviceQuotes = serviceQuotes;
    }
    
    
    
}
