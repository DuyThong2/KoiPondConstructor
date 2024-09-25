/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Parcel;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.ConsultantService;
import com.example.SWPKoiContructor.services.ParcelService;
import com.example.SWPKoiContructor.services.QuoteService;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String getQuoteListByStaffId(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Quotes> list = quoteService.getQuoteListByStaffId(user.getId());
        model.addAttribute("quoteList", list);
        return "consultant/quote/quoteManage";
    }
    
    @GetMapping("consultant/quote/detail/{id}")
    public String getQuoteDetailById(@PathVariable("id")int quoteId, Model model){
        Quotes quotes = quoteService.getQuoteById(quoteId);
        model.addAttribute("quotes", quotes);
        return "/consultant/quote/quoteDetail";
    }
    
    @GetMapping("consultant/quote/detail/updateStatus")
    public String updateQuoteStatus(@RequestParam("quoteId")int quoteId, @RequestParam("statusId")int statusId, Model model){
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
        return "redirect:/consultant/quote/detail/" + quoteId;
    }

    @PostMapping("consultant/quote/createNewQuotes")
    public String createNewQuote(@RequestParam("consultantId") int consultantId, Model model, HttpSession session) {
        Quotes newQuote = new Quotes();
        Consultant consultant = consultantService.getConsultantById(consultantId);
        if (consultant.getQuotes() == null) {
            model.addAttribute("consultant", consultant);
            model.addAttribute("customer", consultant.getCustomer());
            model.addAttribute("newQuote", newQuote);
            List<Parcel> parcelList = parcelService.viewParcelList();
            model.addAttribute("parcelList", parcelList);
            User user = (User) session.getAttribute("user");
            model.addAttribute("staff", user);
            return "consultant/quote/quoteCreate";
        }
        return "redirect:/consultant/viewConsultantList";
    }

    @PostMapping("consultant/quote/saveNewQuotes")
    public String saveQuote(@ModelAttribute("newQuote") Quotes newQuote) {
        newQuote.setQuotesStatus(1);
        newQuote.setQuotesDate(new Date());
        newQuote = quoteService.saveQuotes(newQuote);
        return "redirect:/consultant/quote";
    }
    
    @PostMapping("consultant/quote/updateQuote")
    public String updateQuoteById(@RequestParam("quoteId")int quoteId, Model model){
        Quotes quotes = quoteService.getQuoteById(quoteId);
        model.addAttribute("newQuote", quotes);
        model.addAttribute("customer", quotes.getCustomer());
        model.addAttribute("staff", quotes.getStaff());
        model.addAttribute("consultant", quotes.getConsultant());
        model.addAttribute("parcelList", parcelService.viewParcelList());
        return "consultant/quote/quoteEdit";
    }
    
    @PutMapping("consultant/quote/saveUpdateQuote")
    public String saveUpdateQuoteById(@ModelAttribute("newQuote") Quotes newQuote) {
        newQuote.setQuotesStatus(1);
        newQuote.setQuotesDate(new Date());
        newQuote = quoteService.saveQuotes(newQuote);
        return "redirect:/consultant/quote/detail/" + newQuote.getQuotesId();
    }

}
