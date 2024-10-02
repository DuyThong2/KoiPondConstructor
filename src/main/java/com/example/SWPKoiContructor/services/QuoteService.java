/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.QuoteDAO;
import com.example.SWPKoiContructor.entities.Quotes;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */

@Service
public class QuoteService {
    
    private QuoteDAO quoteDAO;

    public QuoteService(QuoteDAO quoteDAO) {
        this.quoteDAO = quoteDAO;
    }
    
    public Quotes getQuoteById(int id){
        return quoteDAO.getQuoteById(id);
    }
    
    public List<Quotes> getQuoteList(){
        return quoteDAO.getQuotesList();
    }
    
    public List<Quotes> getQuoteListByStaffId(int staffId){
        return quoteDAO.getQuotesListByStaffId(staffId);
    }
    
    public List<Quotes> getQuoteListByCusIdAndStatus(int cusId){
        return quoteDAO.getQuotesListByCusIdAndStatus(cusId);
    }
    
    //---------------------------------------  4 under: TEST SORT FILTER  -------------------------------------------------
    public List<Quotes> getQuoteListByOrderSortFilter(int page, int size, String sortBy, String sortDirection, int status){
        return quoteDAO.getQuotesList(page, size, sortBy, sortDirection, status);
    }
    
    public List<Quotes> getQuoteListByOrderSort(int page, int size, String sortBy, String sortDirection){
        return quoteDAO.getQuotesList(page, size, sortBy, sortDirection);
    }
    
    public long countQuoteByStatus(int status){
        return quoteDAO.countQuotesByStatus(status);
    }
    
    public long countQuote(){
        return quoteDAO.countQuotes();
    }
    
    
    //---------------------------------------  4 under: TEST SORT FILTER  -------------------------------------------------
    public List<Quotes> getQuoteListByOrderSortFilterStaffId(int staffId, int page, int size, String sortBy, String sortDirection, int status){
        return quoteDAO.getQuotesListByStaffId(staffId, page, size, sortBy, sortDirection, status);
    }
    
    public List<Quotes> getQuoteListByOrderSortStaffId(int staffId, int page, int size, String sortBy, String sortDirection){
        return quoteDAO.getQuotesListByStaffId(staffId, page, size, sortBy, sortDirection);
    }
    
    public long countQuoteOfStaffByStatus(int staffId, int status){
        return quoteDAO.countQuotesOfStaffByStatus(staffId, status);
    }
    
    public long countQuoteOfStaffId(int staffId){
        return quoteDAO.countQuotesOfStaff(staffId);
    }
    //-----------------------------------------------------------------------------------------------------------------------
    
    @Transactional
    public Quotes createNewQuotes(Quotes quotes){
        return quoteDAO.createNewQuotes(quotes);
    }
    
    @Transactional
    public Quotes saveQuotes(Quotes quotes){
        return quoteDAO.saveQuote(quotes);
    }
    
    @Transactional
    public Quotes updateQuoteStatus(int quoteId, int quoteStatusId){
        return quoteDAO.updateQuoteStatus(quoteId, quoteStatusId);
    }
    
     public long countQuotesPeding(){
        return quoteDAO.countQuotesPeding();
    }
}
