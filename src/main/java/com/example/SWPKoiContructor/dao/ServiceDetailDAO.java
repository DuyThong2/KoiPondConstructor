/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.ServiceDetail;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.FlushModeType;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import java.util.List;

/**
 *
 * @author Admin
 */
@Repository
public class ServiceDetailDAO {

    private EntityManager entityManager;

    public ServiceDetailDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    // Get a limited number of service details
    public List<ServiceDetail> getServiceDetailList(int size) {
        TypedQuery<ServiceDetail> query = entityManager.createQuery("SELECT sd FROM ServiceDetail sd ORDER BY sd.serviceDetailStatus ASC, sd.price ASC", ServiceDetail.class);
        query.setMaxResults(size);
        return query.getResultList();
    }

    // Get paginated list of service details with sorting
    public List<ServiceDetail> getPaginationServiceDetailList(int page, int size, String sortBy, String sortType) {
        TypedQuery<ServiceDetail> query = entityManager.createQuery("SELECT sd FROM ServiceDetail sd ORDER BY sd." + sortBy + " " + sortType, ServiceDetail.class);
        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    // Get service detail by ID
    public ServiceDetail getServiceDetailById(int id) {
        try {
            return entityManager.find(ServiceDetail.class, id);
        } catch (NoResultException e) {
            return null;
        }
    }

    // Create a new service detail
    public ServiceDetail createServiceDetail(ServiceDetail serviceDetail) {
        entityManager.setFlushMode(FlushModeType.COMMIT);
        ServiceDetail result = entityManager.merge(serviceDetail);
        entityManager.setFlushMode(FlushModeType.AUTO);
        return result;
    }

    // Update an existing service detail
    public ServiceDetail updateServiceDetail(ServiceDetail serviceDetail) {
        return entityManager.merge(serviceDetail);
    }

    // Delete a service detail by ID
    public void deleteServiceDetail(int id) {
        ServiceDetail deleteServiceDetail = this.getServiceDetailById(id);
        if (deleteServiceDetail != null) {
            entityManager.remove(deleteServiceDetail);
        }
    }

    // Update the status of a service detail by entity
    public ServiceDetail updateServiceDetailStatus(ServiceDetail serviceDetail, int status) {
        if (serviceDetail != null) {
            serviceDetail.setServiceDetailStatus(status);
            return entityManager.merge(serviceDetail);
        }
        return null;
    }

    // Update the status of a service detail by ID
    public ServiceDetail updateServiceDetailStatus(int id, int status) {
        ServiceDetail serviceDetail = this.getServiceDetailById(id);
        if (serviceDetail != null) {
            serviceDetail.setServiceDetailStatus(status);
            return entityManager.merge(serviceDetail);
        }
        return null;
    }

    // Count all service details
    public long countServiceDetails() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(sd) FROM ServiceDetail sd", Long.class);
        return query.getSingleResult();
    }

    // Get paginated list of service details filtered by status
    public List<ServiceDetail> getPaginationServiceDetailListByStatus(int page, int size, String sortBy, String sortType, Integer statusFilter) {
        StringBuilder queryBuilder = new StringBuilder("SELECT sd FROM ServiceDetail sd");

        if (statusFilter != null) {
            queryBuilder.append(" WHERE sd.serviceDetailStatus = :statusFilter");
        }

        queryBuilder.append(" ORDER BY sd.").append(sortBy).append(" ").append(sortType);

        TypedQuery<ServiceDetail> query = entityManager.createQuery(queryBuilder.toString(), ServiceDetail.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }

        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    // Count service details by status filter
    public long countServiceDetailFilter(Integer statusFilter) {
        StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(sd) FROM ServiceDetail sd");

        if (statusFilter != null) {
            queryBuilder.append(" WHERE sd.serviceDetailStatus = :statusFilter");
        }

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }

        return query.getSingleResult();
    }

    // Count service details with status 'Pending' (assuming pending status is represented by `1`)
    public long countServiceDetailsPending() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(sd) FROM ServiceDetail sd WHERE sd.serviceDetailStatus = 1", Long.class);
        return query.getSingleResult();
    }

    // Count service details with status 'Completed' (assuming complete status is represented by `3`)
    public long countServiceDetailsComplete() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(sd) FROM ServiceDetail sd WHERE sd.serviceDetailStatus = 3", Long.class);
        return query.getSingleResult();
    }

    // Get service details by customer ID
    public List<ServiceDetail> getCustomerServiceDetailsById(int customerId) {
        String queryString = "SELECT sd FROM ServiceDetail sd WHERE sd.customer.id = :customerId";
        TypedQuery<ServiceDetail> query = entityManager.createQuery(queryString, ServiceDetail.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    // Get active customer service details by customer ID
    public List<ServiceDetail> getActiveCustomerServiceDetailsById(int customerId) {
        String queryString = "SELECT sd FROM ServiceDetail sd WHERE sd.customer.id = :customerId AND sd.serviceDetailStatus = 2"; // Assuming '2' means active or in-progress
        TypedQuery<ServiceDetail> query = entityManager.createQuery(queryString, ServiceDetail.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    // Get completed or canceled customer service details by customer ID
    public List<ServiceDetail> getCompleteOrCancelledCustomerServiceDetailsById(int customerId) {
        String queryString = "SELECT sd FROM ServiceDetail sd WHERE sd.customer.id = :customerId AND (sd.serviceDetailStatus = 3 OR sd.serviceDetailStatus = 4)";
        TypedQuery<ServiceDetail> query = entityManager.createQuery(queryString, ServiceDetail.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }
}