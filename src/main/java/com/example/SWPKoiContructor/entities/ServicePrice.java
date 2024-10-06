/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author nasaf
 */
@Entity
@Table(name = "Service_Price")
public class ServicePrice {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "service_price_id")
    private int servicePriceId;
    
    private double value;
    
    private Date dateApply;
    
    @Column(name = "service_price_status")
    private boolean servicePriceStatus;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

    public ServicePrice(int servicePriceId, double value, Date dateApply, boolean servicePriceStatus) {
        this.servicePriceId = servicePriceId;
        this.value = value;
        this.dateApply = dateApply;
        this.servicePriceStatus = servicePriceStatus;
    }

    public ServicePrice() {
    }

    public int getServicePriceId() {
        return servicePriceId;
    }

    public void setServicePriceId(int servicePriceId) {
        this.servicePriceId = servicePriceId;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public Date getDateApply() {
        return dateApply;
    }

    public void setDateApply(Date dateApply) {
        this.dateApply = dateApply;
    }

    public boolean isServicePriceStatus() {
        return servicePriceStatus;
    }

    public void setServicePriceStatus(boolean servicePriceStatus) {
        this.servicePriceStatus = servicePriceStatus;
    }


    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
