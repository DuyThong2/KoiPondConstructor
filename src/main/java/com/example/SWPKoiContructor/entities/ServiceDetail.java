/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */


@Entity
@Table(name = "Service_Detail")
public class ServiceDetail {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="service_detail_id")
    private int id;
    
    @Column(name="service_detail_price")
    private double price;
    
    @Temporal(TemporalType.DATE)
    private Date dateRegister;
    
    private int rating;
    
    private int serviceDetailStatus;
    
    private String feedback;
    
    @ManyToOne
    @JoinColumn(name="service_id")
    private Service service;
    
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    
    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;

    public ServiceDetail(double price, Date dateRegister, int rating, int serviceDetailStatus, String feedback) {
        this.price = price;
        this.dateRegister = dateRegister;
        this.rating = rating;
        this.serviceDetailStatus = serviceDetailStatus;
        this.feedback = feedback;
    }

    public ServiceDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDateRegister() {
        return dateRegister;
    }

    public void setDateRegister(Date dateRegister) {
        this.dateRegister = dateRegister;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getServiceDetailStatus() {
        return serviceDetailStatus;
    }

    public void setServiceDetailStatus(int serviceDetailStatus) {
        this.serviceDetailStatus = serviceDetailStatus;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
    
    
    
}
