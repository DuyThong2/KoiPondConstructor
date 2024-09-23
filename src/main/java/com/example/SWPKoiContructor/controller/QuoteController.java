/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Parcel;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.services.ConsultantService;
import com.example.SWPKoiContructor.services.ParcelService;
import com.example.SWPKoiContructor.services.QuoteService;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author HP
 */
@Controller
public class QuoteController {
    private QuoteService quoteService;
    private ConsultantService consultantService;
    private ParcelService parcelService;

    public QuoteController(QuoteService quoteService, ConsultantService consultantService, ParcelService parcelService) {
        this.quoteService = quoteService;
        this.consultantService = consultantService;
        this.parcelService = parcelService;
    }
      
    @GetMapping("consultant/quote")
    public String getQuoteList(Model model){
        List<Quotes> list = quoteService.getQuoteList();
        model.addAttribute("quoteList",list);
        return "consultant/quote/quoteManage";
    }
    
    @GetMapping("consultant/quote/createNewQuotes/{consultantId}")
    public String createNewQuote(@PathVariable("consultantId")int consultantId, Model model){
        Quotes newQuote = new Quotes();
        Consultant consultant = consultantService.getConsultantById(consultantId);
        model.addAttribute("consultant", consultant);
        model.addAttribute("customer", consultant.getCustomer());
        model.addAttribute("newQuote", newQuote);
        List<Parcel> parcelList = parcelService.viewParcelList();
        model.addAttribute("parcelList", parcelList);
        model.addAttribute("staff", consultant.getStaff());                  
        return "consultant/quote/quoteCreate";
    }
    
    @PostMapping("consultant/quote/createNewQuotes")
    public String saveQuote(@ModelAttribute("newQuote")Quotes newQuote){
       newQuote.setQuotesStatus(1);
       newQuote.setQuotesDate(new Date());
       newQuote = quoteService.saveQuotes(newQuote);
       return "redirect:/consultant/quote";
    }
    
}
