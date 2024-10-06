package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ServiceDAO;
import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServicePrice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@org.springframework.stereotype.Service
public class ServiceService {

    @Autowired
    private ServiceDAO serviceDAO;

    // Get a paginated list of services with an optional status filter
    public List<Service> getPaginatedServiceListByStatus(int page, int size, String sortBy, String sortType, Boolean statusFilter) {
        return serviceDAO.getPaginationServiceListByStatus(page, size, sortBy, sortType, statusFilter);
    }

    // Get a paginated list of all services
    public List<Service> getPaginatedServiceList(int page, int size, String sortBy, String sortType) {
        return serviceDAO.getPaginationServiceList(page, size, sortBy, sortType);
    }

    // Count services with an optional status filter
    public long countServicesByStatus(Boolean statusFilter) {
        return serviceDAO.countServiceFilter(statusFilter);
    }

    // Count all services
    public long countServices() {
        return serviceDAO.countServices();
    }

    // Create a new service
    @Transactional
    public void createService(Service service) {
         serviceDAO.createService(service);
    }

    // Update an existing service
    @Transactional
    public Service updateService(Service service) {
        return serviceDAO.updateService(service);
    }

    // Update the status of a service by ID
    @Transactional
    public Service updateServiceStatus(int serviceId, boolean status) {
        return serviceDAO.updateServiceStatus(serviceId, status);
    }

    // Get service by ID
    public Service getServiceById(int serviceId) {
        return serviceDAO.getServiceById(serviceId);
    }

    // Delete a service by ID
    @Transactional
    public void deleteService(int serviceId) {
        serviceDAO.deleteService(serviceId);
    }
    @Transactional
    public void simpleTestTransaction() {
        Service testService = new Service();
        testService.setServiceName("Test Service");
        testService.setServiceDescription("This is a test service");
        serviceDAO.createService(testService);
    }

    public List<Service> getPaginationServiceListByStatus(int page, int size, String sortBy, String sortType, Boolean statusFilter) {
        return serviceDAO.getPaginationServiceListByStatus(page, size, sortBy, sortType, statusFilter);
    }

    public long countServiceFilter(Boolean statusFilter) {
        return serviceDAO.countServiceFilter(statusFilter);
    }

    public List<Service> getPaginationServiceList(int page, int size, String sortBy, String sortType) {
        return serviceDAO.getPaginationServiceList(page, size, sortBy, sortType);
    }


}
