/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.services.QuoteService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author HP
 */
@Controller
public class QuoteController {
    private QuoteService quoteService;

    public QuoteController(QuoteService quoteService) {
        this.quoteService = quoteService;
    }
    
    @GetMapping("consultant/quote")
    public String getQuoteList(Model model){
        List<Quotes> list = quoteService.getQuoteList();
        model.addAttribute("quoteList",list);
        return "consultant/quoteManage";
    }
    
    @GetMapping("consultant/quote/createNewQuotes/{consultantId}")
    public String createNewQuote(@PathVariable("consultantId")int consultantId ){
        
        return "consultant/quote/quoteCreate";
    }
}
