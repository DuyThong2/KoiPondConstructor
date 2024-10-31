/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dto;

import com.example.SWPKoiContructor.entities.Comment;
import com.example.SWPKoiContructor.entities.Content;
import com.example.SWPKoiContructor.entities.ServiceDetail;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServicePrice;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ServiceDTO {

    private int serviceId;

    private String serviceName;

    private String serviceDescription;

    private String serviceImgUrl;

    private Content content;

    private boolean serviceStatus;

    private List<ServiceDetail> serviceDetails;

    private double price;

    private List<Comment> comments;

    private List<ServiceQuotes> serviceQuotes;

    public ServiceDTO(int serviceId, String serviceName, String serviceDescription, String serviceImgUrl, boolean serviceStatus, double price) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.serviceDescription = serviceDescription;
        this.serviceImgUrl = serviceImgUrl;
        this.serviceStatus = serviceStatus;
        this.price = price;
    }

    public ServiceDTO() {
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

    public String getServiceImgUrl() {
        return serviceImgUrl;
    }

    public void setServiceImgUrl(String serviceImgUrl) {
        this.serviceImgUrl = serviceImgUrl;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<ServiceQuotes> getServiceQuotes() {
        return serviceQuotes;
    }

    public void setServiceQuotes(List<ServiceQuotes> serviceQuotes) {
        this.serviceQuotes = serviceQuotes;
    }

    public static Service mapToService(ServiceDTO serviceDTO) {
        Service serviceToUpdate = new Service();
        serviceToUpdate.setServiceId(serviceDTO.serviceId);
        serviceToUpdate.setServiceDescription(serviceDTO.getServiceDescription());
        serviceToUpdate.setServiceImgUrl(serviceDTO.serviceImgUrl);
        serviceToUpdate.setServiceStatus(serviceDTO.isServiceStatus());
        serviceToUpdate.addPrice(new ServicePrice(serviceDTO.price));
        return serviceToUpdate;
    }

    public static ServiceDTO mapToServiceDTO(Service service) {
        ServiceDTO dto = new ServiceDTO();

        dto.setServiceId(service.getServiceId());
        dto.setServiceName(service.getServiceName());
        dto.setServiceDescription(service.getServiceDescription());
        dto.setServiceImgUrl(service.getServiceImgUrl());
        dto.setServiceStatus(service.isServiceStatus());

        // Extract the active price from the servicePrice list
        service.getServicePrice().stream()
                .filter(ServicePrice::isServicePriceStatus) // Assuming isServicePriceStatus indicates active prices
                .findFirst()
                .ifPresent(price -> dto.setPrice(price.getValue()));

        return dto;
    }

}
