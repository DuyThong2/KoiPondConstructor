/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Feedback;
import com.example.SWPKoiContructor.entities.Parcel;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.ConsultantService;
import com.example.SWPKoiContructor.services.FeedbackService;
import com.example.SWPKoiContructor.services.ParcelService;
import com.example.SWPKoiContructor.services.QuoteService;
import com.example.SWPKoiContructor.services.UserService;
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
    private UserService userService;
    private FeedbackService feedbackService;

    public QuoteController(QuoteService quoteService, ConsultantService consultantService, ParcelService parcelService, UserService userService, FeedbackService feedbackService) {
        this.quoteService = quoteService;
        this.consultantService = consultantService;
        this.parcelService = parcelService;
        this.userService = userService;
        this.feedbackService = feedbackService;
    }
     
    //-------------------------------------  CUSTOMER SITE  ---------------------------------------------
    @GetMapping("/customer/quote")
    public String getQuoteListToCusIdAndStatus(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Quotes> quoteList = quoteService.getQuoteListByCusIdAndStatus(user.getId());
        model.addAttribute("quoteList", quoteList);
        return "customer/quote/quoteManage";
    }
    
    @PostMapping("/customer/quote/updateStatus")
    public String customerUpdateQuoteStatus(@RequestParam("quoteId")int quoteId, @RequestParam("statusId")int statusId, Model model, HttpSession session){
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);        
        return "redirect:/customer/quote";
    }
    
    @PostMapping("/customer/quote/updateStatusAndFeedback")
    public String customerUpdateQuoteStatusAndFeedback(@RequestParam("quoteId")int quoteId, 
                                                       @RequestParam("statusId")int statusId,
                                                       @RequestParam("declineReason")String feedbackContent,
                                                       @RequestParam("toUserId")int toUserId,
                                                       Model model, HttpSession session){
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);        
        User fromUser = (User) session.getAttribute("user");
        User toUser = userService.getUserById(toUserId);
        Feedback newFeedback = new Feedback(feedbackContent, new Date(), fromUser, toUser);
        newFeedback = feedbackService.saveFeedback(newFeedback);
        return "redirect:/customer/quote";
    }
    
    
    
    //--------------------------------  MANAGER SITE -------------------------------------------
 
    @GetMapping("/manager/quote")
    public String getQuoteList(Model model,
                               @RequestParam(defaultValue = "0")int page,
                               @RequestParam(defaultValue = "8")int size,
                               @RequestParam(defaultValue = "quotesDate")String sortBy,
                               @RequestParam(defaultValue = "asc")String sortDirection,
                               @RequestParam(required = false)Integer statusFilter){
        List<Quotes> quoteList;
        long totalQuote;
        
        if(statusFilter != null){
            quoteList = quoteService.getQuoteListByOrderSortFilter(page, size, sortBy, sortDirection, statusFilter);
            totalQuote = quoteService.countQuoteByStatus(statusFilter);
        }
        else{
            quoteList = quoteService.getQuoteListByOrderSort(page, size, sortBy, sortDirection);
            totalQuote = quoteService.countQuote();
        }
        int totalPages = (int) Math.ceil((double) totalQuote / size);
        
        model.addAttribute("quoteList", quoteList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        
        return "manager/quote/quoteManage";
    }
           
    @GetMapping("/manager/quote/detail/{id}")
    public String getQuoteById(@PathVariable("id")int quoteId, Model model){
        Quotes quotes = quoteService.getQuoteById(quoteId);
        model.addAttribute("quotes", quotes);
        return "manager/quote/quoteDetail";
    }
    
    @GetMapping("/manager/quote/detail/updateStatus")
    public String managerUpdateQuoteStatus(@RequestParam("quoteId")int quoteId, @RequestParam("statusId")int statusId, Model model){
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
        return "redirect:/manager/quote/detail/" + quoteId;
    }
    
    
    
    
    
    //----------------------------  CONSULTANT SITE  ----------------------------------------
   
    @GetMapping("consultant/quote")
    public String getQuoteListByStaffId(Model model, HttpSession session,
                                        @RequestParam(defaultValue = "0")int page,
                                        @RequestParam(defaultValue = "8")int size,
                                        @RequestParam(defaultValue = "quotesDate")String sortBy,
                                        @RequestParam(defaultValue = "asc")String sortDirection,
                                        @RequestParam(required = false)Integer statusFilter){
        User user = (User) session.getAttribute("user");
        List<Quotes> quoteList;
        long totalQuote;
        
        if(statusFilter != null){
            quoteList = quoteService.getQuoteListByOrderSortFilterStaffId(user.getId(), page, size, sortBy, sortDirection, statusFilter);
            totalQuote = quoteService.countQuoteOfStaffByStatus(user.getId(), statusFilter);
        }
        else{
            quoteList = quoteService.getQuoteListByOrderSortStaffId(user.getId(), page, size, sortBy, sortDirection);
            totalQuote = quoteService.countQuoteOfStaffId(user.getId());
        }
        int totalPages = (int) Math.ceil((double) totalQuote / size);
        
        model.addAttribute("quoteList", quoteList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        
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
