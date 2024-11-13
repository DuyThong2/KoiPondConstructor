/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Service;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

/**
 *
 * @author Admin
 */
@Repository
public class ServiceDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public ServiceDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    // Get a limited number of services
    public List<Service> getServiceList(int size) {
        TypedQuery<Service> query = entityManager.createQuery("SELECT s FROM Service s where s.serviceStatus = true ORDER BY s.serviceStatus ASC, s.serviceName ASC", Service.class);
        query.setMaxResults(size);
        return query.getResultList();
    }

    public List<Service> getServicesPaged(int offset, int pageSize) {
        TypedQuery<Service> query = entityManager.createQuery("SELECT s FROM Service s", Service.class);
        query.setFirstResult(offset);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    // Get all sharable services
    public List<Service> getServiceListIsSharable() {
        TypedQuery<Service> query = entityManager.createQuery("SELECT s FROM Service s WHERE s.serviceStatus = true ORDER BY s.serviceName ASC", Service.class);
        return query.getResultList();
    }

    public List<Service> getServiceListIsSharable(int page, int pageSize) {
        TypedQuery<Service> query = entityManager.createQuery(
                "SELECT s FROM Service s WHERE s.serviceStatus = true ORDER BY s.serviceName ASC", Service.class);

        // Apply pagination
        query.setFirstResult((page - 1) * pageSize); // Start from the correct offset
        query.setMaxResults(pageSize); // Limit the result set to pageSize

        return query.getResultList();
    }

    // Get paginated list of services with sorting
    public List<Service> getPaginationServiceList(int page, int size, String sortBy, String sortType) {
        TypedQuery<Service> query = entityManager.createQuery("SELECT s FROM Service s ORDER BY s." + sortBy + " " + sortType, Service.class);
        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);
        return query.getResultList();
    }

    // Get service by ID
    public Service getServiceById(int id) {
        try {
            return entityManager.find(Service.class, id);
        } catch (NoResultException e) {
            return null;
        }
    }

    // Create a new service
    public void createService(Service service) {
        entityManager.persist(service);

    }

    // Update an existing service
    public Service updateService(Service service) {
        return entityManager.merge(service);
    }

    // Delete a service by ID
    public void deleteService(int id) {
        Service deleteService = this.getServiceById(id);
        if (deleteService != null) {
            entityManager.remove(deleteService);
        }
    }

    // Update the status of a service by entity
    public Service updateServiceStatus(Service service, boolean status) {
        if (service != null) {
            service.setServiceStatus(status);
            return entityManager.merge(service);
        }
        return null;
    }

    // Update the status of a service by ID
    public Service updateServiceStatus(int id, boolean status) {
        Service service = this.getServiceById(id);
        if (service != null) {
            service.setServiceStatus(status);
            return entityManager.merge(service);
        }
        return null;
    }

    // Count all services
    public long countServices() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(s) FROM Service s", Long.class);
        return query.getSingleResult();
    }

    public List<Service> getPaginationServiceListByStatus(int page, int size, String sortBy, String sortType, Boolean statusFilter,String searchName) {
        // Ensure valid defaults for sortBy and sortType
        String validSortBy = (sortBy != null && !sortBy.isEmpty()) ? sortBy : "serviceName";
        String validSortType = (sortType != null && (sortType.equalsIgnoreCase("ASC") || sortType.equalsIgnoreCase("DESC"))) ? sortType : "ASC";

        StringBuilder queryBuilder = new StringBuilder("SELECT s FROM Service s");

        boolean hasStatusFilter = (statusFilter != null);
        boolean hasSearchName = (searchName != null && !searchName.isEmpty());

        if (hasStatusFilter || hasSearchName) {
            queryBuilder.append(" WHERE ");
            if (hasStatusFilter) {
                queryBuilder.append("s.serviceStatus = :statusFilter");
            }
            if (hasSearchName) {
                if (hasStatusFilter) {
                    queryBuilder.append(" AND ");
                }
                queryBuilder.append("s.serviceName LIKE :searchName");
            }
        }


        queryBuilder.append(" ORDER BY s.").append(validSortBy).append(" ").append(validSortType);

        TypedQuery<Service> query = entityManager.createQuery(queryBuilder.toString(), Service.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if(searchName!=null&&!searchName.isEmpty()){
            query.setParameter("searchName", "%"+searchName+"%");
        }

        query.setFirstResult((page - 1) * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    // Count services by status filter
    public long countServiceFilter(Boolean statusFilter,String searchName) {
        StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(s) FROM Service s");

        boolean hasStatusFilter = (statusFilter != null);
        boolean hasSearchName = (searchName != null && !searchName.isEmpty());

        if (hasStatusFilter || hasSearchName) {
            queryBuilder.append(" WHERE ");
            if (hasStatusFilter) {
                queryBuilder.append("s.serviceStatus = :statusFilter");
            }
            if (hasSearchName) {
                if (hasStatusFilter) {
                    queryBuilder.append(" AND ");
                }
                queryBuilder.append("s.serviceName LIKE :searchName");
            }
        }

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);

        if (statusFilter != null) {
            query.setParameter("statusFilter", statusFilter);
        }
        if(searchName!=null&&!searchName.isEmpty()){
            query.setParameter("searchName", "%"+searchName+"%");
        }
        return query.getSingleResult();
    }

    // Count services with status 'Pending' (assuming pending status is represented by `false`)
    public long countServicesPending() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(s) FROM Service s WHERE s.serviceStatus = false", Long.class);
        return query.getSingleResult();
    }

    // Count services with status 'Complete' (assuming complete status is represented by `true`)
    public long countServicesComplete() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(s) FROM Service s WHERE s.serviceStatus = true", Long.class);
        return query.getSingleResult();
    }

    // Get services by customer ID
    public List<Service> getCustomerServicesById(int customerId) {
        String queryString = "SELECT s FROM Service s WHERE s.content.customer.id = :customerId";
        TypedQuery<Service> query = entityManager.createQuery(queryString, Service.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    // Get active customer services by customer ID
    public List<Service> getActiveCustomerServicesById(int customerId) {
        String queryString = "SELECT s FROM Service s WHERE s.content.customer.id = :customerId AND s.serviceStatus = true";
        TypedQuery<Service> query = entityManager.createQuery(queryString, Service.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    // Get complete or canceled customer services by customer ID
    public List<Service> getCompleteOrCancelledCustomerServicesById(int customerId) {
        String queryString = "SELECT s FROM Service s WHERE s.content.customer.id = :customerId AND s.serviceStatus = false";
        TypedQuery<Service> query = entityManager.createQuery(queryString, Service.class);
        query.setParameter("customerId", customerId);
        return query.getResultList();
    }

    public Service getServiceWithContentById(int id) {
        try {
            TypedQuery<Service> query = entityManager.createQuery(
                    "SELECT s FROM Service s left join s.content inner join s.servicePrice price where s.serviceId = :id and price.servicePriceStatus= 1", Service.class);
            query.setParameter("id", id);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }

    // Fetches the total revenue for each active service for the last 12 months using Tuple
    public List<Tuple> getMonthlyRevenueForActiveServices() {
        String sql = "SELECT "
                + "s.service_name AS serviceName, "
                + "YEAR(sd.date_register) AS year, "
                + "MONTH(sd.date_register) AS month, "
                + "SUM(sd.service_detail_price) AS totalRevenue "
                + "FROM Service_Detail sd "
                + "JOIN Service s ON sd.service_id = s.service_id "
                + "WHERE sd.service_detail_status = 3 " // Only completed services
                + "AND s.service_status = 1 " // Only active services
                + "AND sd.date_register >= DATEADD(month, -12, GETDATE()) " // Last 12 months
                + "GROUP BY s.service_name, YEAR(sd.date_register), MONTH(sd.date_register) "
                + "ORDER BY year, month";

        Query query = entityManager.createNativeQuery(sql, Tuple.class);
        return query.getResultList();
    }

    public List<Service> getRelatedService(int id) {
        String sql = "SELECT s FROM Service s WHERE s.serviceId != :id and s.serviceStatus=1 ORDER BY function('RAND')";
        TypedQuery<Service> query = entityManager.createQuery(sql, Service.class);
        query.setParameter("id", id);
        return query.setMaxResults(6).getResultList();
    }

    public List<Service> getSomeService(int i) {
        String sql = "SELECT s FROM Service s WHERE s.serviceStatus=1 ORDER BY function('RAND')";
        TypedQuery<Service> query = entityManager.createQuery(sql, Service.class);
        return query.setMaxResults(i).getResultList();
    }


}
