/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Feedback;
import com.example.SWPKoiContructor.entities.Notification;
import com.example.SWPKoiContructor.entities.Parcel;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.*;

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

    private NotificationService notificationService;

    public QuoteController(QuoteService quoteService, ConsultantService consultantService, ParcelService parcelService, UserService userService, FeedbackService feedbackService,NotificationService notificationService) {
        this.quoteService = quoteService;
        this.consultantService = consultantService;
        this.parcelService = parcelService;
        this.userService = userService;
        this.feedbackService = feedbackService;
        this.notificationService= notificationService;
    }

    //-------------------------------------  CUSTOMER SITE  ---------------------------------------------
    @GetMapping("/customer/quote")
    public String getQuoteListToCusIdAndStatus(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Quotes> quoteList = quoteService.getQuoteListByCusIdAndStatus(user.getId());
        model.addAttribute("quoteList", quoteList);
        return "customer/quote/quoteManage";
    }

    @PostMapping("/customer/quote/updateStatus")
    public String customerUpdateQuoteStatus(@RequestParam("quoteId") int quoteId, @RequestParam("statusId") int statusId, Model model, HttpSession session) {
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
       String statusString=statusId==3?"Accepted":"Rejected";

        notificationService.changeNotificationToConsultant(quotes.getStaff().getId(),quotes.getConsultant().getConsultantCustomerName(), quoteId,statusId,"Customer","quote",statusString);
        return "redirect:/customer/quote";
    }

    @PostMapping("/customer/quote/updateStatusAndFeedback")
    public String customerUpdateQuoteStatusAndFeedback(@RequestParam("quoteId") int quoteId,
            @RequestParam("statusId") int statusId,
            @RequestParam("declineReason") String feedbackContent,
            @RequestParam("toUserId") int toUserId,
            Model model, HttpSession session) {
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
        User fromUser = (User) session.getAttribute("user");
        User toUser = userService.getUserById(toUserId);
        Feedback newFeedback = new Feedback(feedbackContent, new Date(), fromUser, toUser, quotes);
        newFeedback = feedbackService.saveFeedback(newFeedback);
        return "redirect:/customer/quote";
    }

    //--------------------------------  MANAGER SITE -------------------------------------------
    @GetMapping("/manager/quote")
    public String getQuoteList(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "quotesDate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        List<Quotes> quoteList;
        long totalQuote;

        if (statusFilter != null) {
            quoteList = quoteService.getQuoteListByOrderSortFilter(page, size, sortBy, sortDirection, statusFilter);
            totalQuote = quoteService.countQuoteByStatus(statusFilter);
        } else {
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

    //XEM CHI TIET QUOTATION
    @GetMapping("/manager/quote/detail/{id}")
    public String getQuoteById(@PathVariable("id") int quoteId, Model model, HttpSession session) {
        Quotes quotes = quoteService.getQuoteById(quoteId);
        if (quotes.getQuotesStatus() == 3) {
            User toUser = quotes.getStaff();
            User fromUser = (User) session.getAttribute("user");
            Feedback fb = feedbackService.getLatestFeedback(quoteId, fromUser.getId(), toUser.getId());
            model.addAttribute("feedback", fb);
        }
        if (quotes.getQuotesStatus() == 5) {
            User toUser = quotes.getStaff();
            User fromUser = quotes.getCustomer();
            Feedback fb = feedbackService.getLatestFeedback(quoteId, fromUser.getId(), toUser.getId());
            model.addAttribute("feedback", fb);
        }
        if (quotes.getQuotesStatus() == 6) {
            Feedback fb = feedbackService.getFeedbackForCancel(quoteId);
            model.addAttribute("feedback", fb);
        }
        model.addAttribute("quotes", quotes);
        return "manager/quote/quoteDetail";
    }

    //CAP NHAT STATUS KO FEEDBACK
    @PostMapping("/manager/quote/detail/updateStatus")
    public String managerUpdateQuoteStatus(@RequestParam("quoteId") int quoteId, @RequestParam("statusId") int statusId, Model model) {
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
        String statusString= statusId==2?"Accepted":"Rejected";
        notificationService.changeNotificationToConsultant(quotes.getStaff().getId(),quotes.getConsultant().getConsultantCustomerName(), quoteId,statusId,"Manager","quote",statusString);
        return "redirect:/manager/quote/detail/" + quoteId;
    }

    //CAP NHAT STATUS CO FEEDBACK
    @PostMapping("/manager/quote/detail/updateStatusAndFeedback")
    public String managerUpdateQuoteStatusAndFeedback(@RequestParam("quoteId") int quoteId,
            @RequestParam("statusId") int statusId,
            @RequestParam("declineReason") String feedbackContent,
            @RequestParam("toUserId") int toUserId,
            Model model, HttpSession session) {
        try {
            Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
            User fromUser = (User) session.getAttribute("user");
            User toUser = userService.getUserById(toUserId);
            Feedback newFeedback = new Feedback(feedbackContent, new Date(), fromUser, toUser, quotes);
            newFeedback = feedbackService.saveFeedback(newFeedback);
            String statusString= statusId==2?"Accepted":"Rejected";
            notificationService.changeNotificationToConsultant(quotes.getStaff().getId(),quotes.getConsultant().getConsultantCustomerName(), quoteId,statusId,"Manager","quote",statusString);
            return "redirect:/manager/quote/detail/" + quoteId;
        }catch(Exception e){
            return "redirect:/manager/quote/detail/" + quoteId;
        }

    }

    //----------------------------  CONSULTANT SITE  ----------------------------------------
    @GetMapping("/consultant/quote")
    public String getQuoteListByStaffId(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "quotesDate") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        User user = (User) session.getAttribute("user");
        List<Quotes> quoteList;
        long totalQuote;

        if (statusFilter != null) {
            quoteList = quoteService.getQuoteListByOrderSortFilterStaffId(user.getId(), page, size, sortBy, sortDirection, statusFilter);
            totalQuote = quoteService.countQuoteOfStaffByStatus(user.getId(), statusFilter);
        } else {
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

    @GetMapping("/consultant/quote/detail/{id}")
    public String getQuoteDetailById(@PathVariable("id") int quoteId, Model model, HttpSession session) {
        Quotes quotes = quoteService.getQuoteById(quoteId);
        if (quotes.getQuotesStatus() == 5) {
            User toUser = (User) session.getAttribute("user");
            User fromUser = quotes.getCustomer();
            Feedback fb = feedbackService.getLatestFeedback(quoteId, fromUser.getId(), toUser.getId());
            model.addAttribute("feedback", fb);
        }
        if (quotes.getQuotesStatus() == 3) {
            User toUser = (User) session.getAttribute("user");
            Feedback fb = feedbackService.getLatestManagerFeedback(quoteId, toUser.getId());
            model.addAttribute("feedback", fb);
        }
        if (quotes.getQuotesStatus() == 6) {
            Feedback fb = feedbackService.getFeedbackForCancel(quoteId);
            model.addAttribute("feedback", fb);
        }
        model.addAttribute("quotes", quotes);
        return "/consultant/quote/quoteDetail";
    }

    @PostMapping("consultant/quote/detail/updateStatus")
    public String updateQuoteStatus(@RequestParam("quoteId") int quoteId,
            @RequestParam("statusId") int statusId,
            Model model, HttpSession session) {
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
        return "redirect:/consultant/quote/detail/" + quoteId;
    }

    @PostMapping("consultant/quote/detail/updateStatusAndFeedback")
    public String updateQuoteStatusAndFeedback(@RequestParam("quoteId") int quoteId,
            @RequestParam("statusId") int statusId,
            @RequestParam("declineReason") String feedbackContent,
            Model model, HttpSession session) {
        Quotes quotes = quoteService.updateQuoteStatus(quoteId, statusId);
        User fromUser = (User) session.getAttribute("user");
        List<User> userList = userService.getUserListByRole("MANAGER");
        for (User i : userList) {
            Feedback newFeedback = new Feedback(feedbackContent, new Date(), fromUser, i, quotes);
            newFeedback = feedbackService.saveFeedback(newFeedback);
        }
        return "redirect:/consultant/quote/detail/" + quoteId;
    }

    @GetMapping("consultant/quote/createNewQuotes")
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
        Consultant consultant = newQuote.getConsultant();
        notificationService.createQuoteNotification(consultant.getConsultantCustomerName(),newQuote.getQuotesId(),newQuote.getCustomer().getId());
        return "redirect:/consultant/quote";
    }

    @GetMapping("consultant/quote/updateQuote")
    public String updateQuoteById(@RequestParam("quoteId") int quoteId, Model model, HttpSession session) {
        User staff = (User) session.getAttribute("user");
        Quotes quotes = quoteService.getQuoteById(quoteId);
        if(quotes != null && quotes.getStaff().getId() == staff.getId()){
            model.addAttribute("newQuote", quotes);
            model.addAttribute("customer", quotes.getCustomer());
            model.addAttribute("staff", quotes.getStaff());
            model.addAttribute("consultant", quotes.getConsultant());
            model.addAttribute("parcelList", parcelService.viewParcelList());
            return "consultant/quote/quoteEdit";
        }
        return "redirect:/consultant/quote";
    }

    @PostMapping("consultant/quote/saveUpdateQuote")
    public String saveUpdateQuoteById(@ModelAttribute("newQuote") Quotes newQuote) {
        newQuote.setQuotesStatus(1);
        newQuote.setQuotesDate(new Date());
        newQuote = quoteService.saveQuotes(newQuote);
        return "redirect:/consultant/quote/detail/" + newQuote.getQuotesId();
    }

}
