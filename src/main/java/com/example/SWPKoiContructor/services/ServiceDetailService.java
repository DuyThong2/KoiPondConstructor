/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ServiceDetailDAO;
import com.example.SWPKoiContructor.entities.ServiceDetail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import javax.persistence.Tuple;

/**
 * Service layer for ServiceDetail.
 * This layer calls the DAO methods and contains any additional business logic.
 */
@Service
public class ServiceDetailService {

    private final ServiceDetailDAO serviceDetailDAO;

    public ServiceDetailService(ServiceDetailDAO serviceDetailDAO) {
        this.serviceDetailDAO = serviceDetailDAO;
    }

    public List<ServiceDetail> getServiceDetailList(int size) {
        return serviceDetailDAO.getServiceDetailList(size);
    }

    public List<ServiceDetail> getPaginationServiceDetailList(int page, int size, String sortBy, String sortType) {
        return serviceDetailDAO.getPaginationServiceDetailList(page, size, sortBy, sortType);
    }

    public ServiceDetail getServiceDetailById(int id) {
        return serviceDetailDAO.getServiceDetailById(id);
    }

    @Transactional
    public ServiceDetail createServiceDetail(ServiceDetail serviceDetail) {
        return serviceDetailDAO.createServiceDetail(serviceDetail);
    }

    @Transactional
    public ServiceDetail updateServiceDetail(ServiceDetail serviceDetail) {
        return serviceDetailDAO.updateServiceDetail(serviceDetail);
    }

    @Transactional
    public void deleteServiceDetail(int id) {
        serviceDetailDAO.deleteServiceDetail(id);
    }

    @Transactional
    public ServiceDetail updateServiceDetailStatus(ServiceDetail serviceDetail, int status) {
        return serviceDetailDAO.updateServiceDetailStatus(serviceDetail, status);
    }

    @Transactional
    public ServiceDetail updateServiceDetailStatus(int id, int status) {
        return serviceDetailDAO.updateServiceDetailStatus(id, status);
    }

    public long countServiceDetails() {
        return serviceDetailDAO.countServiceDetails();
    }

    public List<ServiceDetail> getPaginationServiceDetailListByStatus(int page, int size, String sortBy, String sortType, Integer statusFilter) {
        return serviceDetailDAO.getPaginationServiceDetailListByStatus(page, size, sortBy, sortType, statusFilter);
    }

    public long countServiceDetailFilter(Integer statusFilter) {
        return serviceDetailDAO.countServiceDetailFilter(statusFilter);
    }

    public long countServiceDetailsPending() {
        return serviceDetailDAO.countServiceDetailsPending();
    }

    @Transactional(readOnly = true)
    public long countServiceDetailsComplete() {
        return serviceDetailDAO.countServiceDetailsComplete();
    }

    public List<ServiceDetail> getCustomerServiceDetailsById(int customerId) {
        return serviceDetailDAO.getCustomerServiceDetailsById(customerId);
    }

    public List<ServiceDetail> getActiveCustomerServiceDetailsById(int customerId) {
        return serviceDetailDAO.getActiveCustomerServiceDetailsById(customerId);
    }

    public List<ServiceDetail> getCompleteOrCancelledCustomerServiceDetailsById(int customerId) {
        return serviceDetailDAO.getCompleteOrCancelledCustomerServiceDetailsById(customerId);
    }
    
    
    
    
    
    
    
    public List<Tuple> getServiceRevenue() {
        return serviceDetailDAO.getRevenueByService();
    }
}
