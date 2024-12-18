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

import javax.persistence.TypedQuery;
import java.sql.Date;
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

    public List<ServiceDetail> getPaginationServiceDetailListByStatus(int page, int size, String sortBy, String sortType, Integer statusFilter, Date fromDate, Date endDate, String searchName) {
        return serviceDetailDAO.getPaginationServiceDetailListByStatus(page, size, sortBy, sortType, statusFilter, fromDate, endDate, searchName);
    }

    public long countServiceDetailFilter(Integer statusFilter, Date fromDate, Date endDate, String searchName) {
        return serviceDetailDAO.countServiceDetailFilter(statusFilter, fromDate, endDate, searchName);
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

    public long countServiceDetailsByCustomerId(int customerId) {
        return serviceDetailDAO.countServiceDetailsByCustomerId(customerId);

    }
    
    public List<Tuple> getServiceRevenue() {
        return serviceDetailDAO.getRevenueByService();

    }

    public List<ServiceDetail> getPaginationServiceDetailListByCustomerId(int id, int page, int size, String sortBy, String sortType) {
        return serviceDetailDAO.getPaginationServiceDetailListByCustomerId(id,page,size,sortBy,sortType);
    }
    public List<ServiceDetail> getServiceDetailsByStaffId(int staffId, int page, int size, String sortBy, String sortType) {
        return serviceDetailDAO.getServiceDetailsByStaffId(staffId, page, size, sortBy, sortType);
    }

    // Fetch paginated and sorted service details by staff ID and status
    public List<ServiceDetail> getServiceDetailsByStaffIdAndStatus(int staffId, int page, int size, String sortBy, String sortType, int status) {
        return serviceDetailDAO.getServiceDetailsByStaffIdAndStatus(staffId, page, size, sortBy, sortType, status);
    }

    // Count service details by staff ID
    public long countServiceDetailsByStaffId(int staffId) {
        return serviceDetailDAO.countServiceDetailsByStaffId(staffId);
    }

    // Count service details by staff ID and status
    public long countServiceDetailsByStaffIdAndStatus(int staffId, int status) {
        return serviceDetailDAO.countServiceDetailsByStaffIdAndStatus(staffId, status);
    }


    public List<ServiceDetail> getServiceDetailsByStaffId(int staffId) {
        return serviceDetailDAO.getServiceDetailsByStaffId(staffId);
    }
    public Double getAverageRatingService(int id){
        return serviceDetailDAO.averageRatingService(id);
    }
    public List<ServiceDetail> getTopFeedBackService(int id){
        return serviceDetailDAO.topFeedBack(id);
    }
}
