/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ServiceQuoteDAO;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.User;
import java.time.LocalDate;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP
 */
@Service
public class ServiceQuoteService {
    private ServiceQuoteDAO serviceQuoteDAO;

    public ServiceQuoteService(ServiceQuoteDAO serviceQuoteDAO) {
        this.serviceQuoteDAO = serviceQuoteDAO;
    }
    
    public ServiceQuotes getServiceQuotesById(int id){
        return serviceQuoteDAO.getServiceQuoteById(id);
    }
    public List<ServiceQuotes> getFilteredServiceQuoteStaff(int page, int size, String sortBy, String sortDirection,
            Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate, User staff ){
        return serviceQuoteDAO.getFilteredServiceQuoteConsultant(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate, staff);
    }
    
    public long countFilteredServiceQuoteStaff(Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate, User staff){
        return serviceQuoteDAO.countFilteredServiceQuoteConsultant(statusFilter, searchName, fromDate, toDate, staff);
    }
    
    public List<ServiceQuotes> getFilteredServiceQuoteManager(int page, int size, String sortBy, String sortDirection,
            Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate){
        return serviceQuoteDAO.getFilteredServiceQuoteManager(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate);
    }
    
    public long countFilteredServiceQuoteManager(Integer statusFilter, String searchName, LocalDate fromDate, LocalDate toDate){
        return serviceQuoteDAO.countFilteredServiceQuoteManager(statusFilter, searchName, fromDate, toDate);
    }
    
    public List<ServiceQuotes> getFilteredServiceQuoteCustomer(int page, int size, String sortBy, String sortDirection,
            LocalDate fromDate, LocalDate toDate, int cusId){
        return serviceQuoteDAO.getFilteredServiceQuoteCustomer(page, size, sortBy, sortDirection, fromDate, toDate, cusId);
    }
    
    public long countFilteredServiceQuoteCustomer(LocalDate fromDate, LocalDate toDate, int cusId){
        return serviceQuoteDAO.countFilteredServiceCustomer(fromDate, toDate, cusId);
    }
    
    @Transactional
    public ServiceQuotes saveStatusUpdateManager(int serviceQuoteId, int serviceQuoteStatus){
        return serviceQuoteDAO.updateServiceQuoteStatus(serviceQuoteId, serviceQuoteStatus);
    }
    
    @Transactional
    public ServiceQuotes createNewServiceQuote(ServiceQuotes serviceQuotes){
        return serviceQuoteDAO.createNewServiceQuote(serviceQuotes);
    }
    
    @Transactional
    public ServiceQuotes saveNewServiceQuote(ServiceQuotes serviceQuotes){
        return serviceQuoteDAO.saveServiceQuotes(serviceQuotes);
    }
    
}
