/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.List;
import javax.persistence.*;

/**
 *
 * @author Admin
 */

@Entity
@Table(name = "Service")
public class Service {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int serviceId;
    
    private String serviceName;
    
    private String serviceDescription;
    
    @OneToOne(mappedBy = "service", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Content content;
    
    private boolean serviceStatus;
    
    @OneToMany(mappedBy="service")
    private List<ServiceDetail>  serviceDetails;

    @OneToMany(mappedBy = "service", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("servicePriceStatus DESC, dateApply DESC")
    private List<ServicePrice> servicePrice;

    public Service(String serviceName, String serviceDescription,  boolean serviceStatus) {
        this.serviceName = serviceName;
        this.serviceDescription = serviceDescription;
       
        this.serviceStatus = serviceStatus;
    }

    public Service() {
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public List<ServicePrice> getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(List<ServicePrice> servicePrice) {
        this.servicePrice = servicePrice;
    }

   

    public boolean isServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(boolean serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    public List<ServiceDetail> getServiceDetails() {
        return serviceDetails;
    }

    public void setServiceDetails(List<ServiceDetail> serviceDetails) {
        this.serviceDetails = serviceDetails;
    }
    
    
    
    
}
