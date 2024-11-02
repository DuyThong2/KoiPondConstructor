package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ServiceDAO;
import com.example.SWPKoiContructor.dao.ServiceDetailDAO;
import com.example.SWPKoiContructor.entities.Service;
import java.math.BigDecimal;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;
import javax.persistence.Tuple;

@org.springframework.stereotype.Service
public class ServiceService {
    
    

    @Autowired
    private ServiceDAO serviceDAO;
    
    @Autowired
    private ServiceDetailDAO serviceDetailDAO;

    // Get a paginated list of services with an optional status filter
    public List<Service> getPaginatedServiceListByStatus(int page, int size, String sortBy, String sortType, Boolean statusFilter) {
        return serviceDAO.getPaginationServiceListByStatus(page, size, sortBy, sortType, statusFilter);
    }
    
    public List<Service> getServiceList(int size){
        return serviceDAO.getServiceList(size);
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
    
    public List<Service> getServicesPaged(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return serviceDAO.getServicesPaged(offset, pageSize);
    }
    
    public Service getServiceWithContentById(int id){
        return serviceDAO.getServiceWithContentById(id);
    }


    public List<Service> getRelatedService(int id) {
        return serviceDAO.getRelatedService(id);
    }

    public List<Service> getSomeService(int i) {
        return serviceDAO.getSomeService(i);
    }
}
