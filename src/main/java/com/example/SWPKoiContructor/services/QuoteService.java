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
    
    @Transactional
    public Quotes createNewQuotes(Quotes quotes){
        return quoteDAO.createNewQuotes(quotes);
    }
}
