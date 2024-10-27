/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dto.ServiceDTO;
import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Feedback;
import com.example.SWPKoiContructor.entities.PaymentHistory;
import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author HP
 */
@Controller
public class ServiceQuoteController {

    private ServiceQuoteService serviceQuoteService;
    private ServiceService serviceService;
    private ConsultantService consultantService;
    private UserService userService;
    private FeedbackService feedbackService;
    private LoyaltyPointService loyaltyPointService;
    private PaymentHistoryService paymentHistoryService;

    private NotificationService notificationService;

    public ServiceQuoteController(ServiceQuoteService serviceQuoteService, ServiceService serviceService, ConsultantService consultantService, UserService userService, FeedbackService feedbackService, LoyaltyPointService loyaltyPointService, PaymentHistoryService paymentHistoryService, NotificationService notificationService) {
        this.serviceQuoteService = serviceQuoteService;
        this.serviceService = serviceService;
        this.consultantService = consultantService;
        this.userService = userService;
        this.feedbackService = feedbackService;
        this.loyaltyPointService = loyaltyPointService;
        this.paymentHistoryService = paymentHistoryService;
        this.notificationService = notificationService;
    }

    //----------------------------------- MANAGER SECTION ----------------------------------------------
    @GetMapping("/manager/serviceQuote/detail/{id}")
    public String getDetailServiceQuoteManager(@PathVariable("id") int id, Model model) {
        ServiceQuotes serviceQuote = serviceQuoteService.getServiceQuotesById(id);
        if (serviceQuote != null) {
            model.addAttribute("serviceQuote", serviceQuote);
            Feedback feedback = feedbackService.getLatestServiceQuoteFeedback(id);
            if (feedback != null) {
                model.addAttribute("feedback", feedback);
            }
            return "manager/serviceQuote/serviceQuoteDetail";
        }
        return "redirect:/manager/serviceQuote";
    }

    @GetMapping("/manager/serviceQuote")
    public String listFilteredServiceQuoteManager(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "serviceQuotesDate") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate) {

        List<ServiceQuotes> serviceQuoteses;
        long totalServiceQuotes;

        // Apply filtering based on the name, date range, and status
        totalServiceQuotes = serviceQuoteService.countFilteredServiceQuoteManager(statusFilter, searchName, fromDate, toDate);

        int totalPages = (int) Math.ceil((double) totalServiceQuotes / size);
        if (page > totalPages) {
            page = 0;
        }
        serviceQuoteses = serviceQuoteService.getFilteredServiceQuoteManager(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate);

        // Add attributes to the model for JSP rendering
        model.addAttribute("serviceQuote", serviceQuoteses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);  // Add searchName to model
        model.addAttribute("fromDate", fromDate);  // Add fromDate to model
        model.addAttribute("toDate", toDate);  // Add toDate to model

        return "manager/serviceQuote/serviceQuoteManage";  // JSP page to display the contract list
    }

    @PostMapping("/manager/serviceQuote/detail/saveStatus")
    public String saveStatusUpdateManager(Model model, HttpSession session,
            @RequestParam("id") int serviceQuoteId,
            @RequestParam("status") int statusId,
            @RequestParam(name = "declineReason", required = false) String feedbackContent,
            @RequestParam(name = "toUserId", required = false) Integer toUserId) {
        ServiceQuotes serviceQuotes = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, statusId);
        if (feedbackContent != null && toUserId != null) {
            User fromUser = (User) session.getAttribute("user");
            User toUser = userService.getUserById(toUserId);
            Feedback feedback = new Feedback();
            feedback.setFeedbackContent(feedbackContent);
            feedback.setFeedbackDate(new Date());
            feedback.setFromUser(fromUser);
            feedback.setToUser(toUser);
            feedback.setServiceQuotes(serviceQuotes);
            feedback = feedbackService.saveFeedback(feedback);
        }
        if (statusId == 2) {
            notificationService.createNotification(serviceQuoteId, "serviceQuote", serviceQuotes.getCustomer().getId(), "customer", "Your service quotes has been created!");
        } else if (statusId == 3) {
            notificationService.createNotification(serviceQuoteId, "serviceQuote", serviceQuotes.getConsultant().getStaff().getId(), "consultant", "Your service quotes has been denied by manager! Please edit it");

        }
        return "redirect:/manager/serviceQuote/detail/" + serviceQuoteId;
    }

    @PostMapping("/manager/serviceQuote/savePayment")
    public String savePayment(@RequestParam("id") int serviceQuoteId,
            @RequestParam("status") int statusId,
            Model model) {
        ServiceQuotes serviceQuote = serviceQuoteService.getServiceQuotesById(serviceQuoteId);
        PaymentHistory paymentHistory = new PaymentHistory();
        paymentHistory.setCustomer(serviceQuote.getCustomer());
       
//        BigDecimal amount = BigDecimal.valueOf(serviceQuote.calculateTotalPricePayment() - serviceQuote.calculatePointUsing());
        BigDecimal totalPrice = BigDecimal.valueOf(serviceQuote.calculateTotalPricePayment());
        BigDecimal pointsUsed = BigDecimal.valueOf(serviceQuote.calculatePointUsing());
        BigDecimal amount = totalPrice.subtract(pointsUsed);
         System.out.println(amount);
        paymentHistory.setAmount(amount);
        
        paymentHistory.setPaymentDate(LocalDateTime.now());
        paymentHistory.setPaymentMethod("Manual");
        paymentHistory.setDescription("Payment of " + amount + " for service quote" + serviceQuote.getServiceQuotesId() + " by " + serviceQuote.getCustomer().getName() + " using " + serviceQuote.calculatePointUsing());
        paymentHistoryService.createPayment(paymentHistory);
        
        double pointGained = amount.doubleValue();
        loyaltyPointService.gainLoyaltyPoints(serviceQuote.getCustomer(), pointGained);
    System.out.println(pointGained);
        serviceQuote = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, statusId);
        return "redirect:/manager/serviceQuote/detail/" + serviceQuoteId;
    }

    //----------------------------------- STAFF SECTION ----------------------------------------------
    @GetMapping("/consultant/serviceQuote/detail/{id}")
    public String getDetailServiceQuote(@PathVariable("id") int id, Model model, HttpSession session) {
        ServiceQuotes serviceQuote = serviceQuoteService.getServiceQuotesById(id);
        Staff staff = (Staff) session.getAttribute("user");
        if (serviceQuote != null && serviceQuote.isServiceQuoteBelongToStaff(staff, serviceQuote)) {
            model.addAttribute("serviceQuote", serviceQuote);
            Feedback feedback = feedbackService.getLatestServiceQuoteFeedback(id);
            if (feedback != null) {
                model.addAttribute("feedback", feedback);
            }
            return "consultant/serviceQuote/serviceQuoteDetail";
        }
        return "redirect:/consultant/serviceQuote";
    }

    @GetMapping("/consultant/serviceQuote")
    public String listFilteredServiceQuote(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "serviceQuotesDate") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate) {

        User staff = (User) session.getAttribute("user");
        List<ServiceQuotes> serviceQuoteses;
        long totalServiceQuotes;

        // Apply filtering based on the name, date range, and status
        if (statusFilter != null || searchName != null || fromDate != null || toDate != null) {
            serviceQuoteses = serviceQuoteService.getFilteredServiceQuoteStaff(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate, staff);
            totalServiceQuotes = serviceQuoteService.countFilteredServiceQuoteStaff(statusFilter, searchName, fromDate, toDate, staff);
        } else {
            serviceQuoteses = serviceQuoteService.getFilteredServiceQuoteStaff(page, size, sortBy, sortDirection, statusFilter, searchName, fromDate, toDate, staff);
            totalServiceQuotes = serviceQuoteService.countFilteredServiceQuoteStaff(statusFilter, searchName, fromDate, toDate, staff);
        }

        int totalPages = (int) Math.ceil((double) totalServiceQuotes / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("serviceQuote", serviceQuoteses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);  // Add searchName to model
        model.addAttribute("fromDate", fromDate);  // Add fromDate to model
        model.addAttribute("toDate", toDate);  // Add toDate to model

        return "consultant/serviceQuote/serviceQuoteManage";  // JSP page to display the contract list
    }

    @GetMapping("/consultant/serviceQuote/create")
    public String createNewServiceQuote(@RequestParam("consultantId") int consultantId, Model model, HttpSession session) {
        ServiceQuotes newServiceQuotes = new ServiceQuotes();
        Consultant consultant = consultantService.getConsultantById(consultantId);
        if (consultant.getServiceQuotes() == null) {
            model.addAttribute("consultant", consultant);
            model.addAttribute("customer", consultant.getCustomer());
            model.addAttribute("newServiceQuote", newServiceQuotes);
            List<Service> services = serviceService.getServiceList(20);
            model.addAttribute("services", services);
            User user = (User) session.getAttribute("user");
            model.addAttribute("staff", user);
            long totalPoint = loyaltyPointService.TotalPoints(consultant.getCustomer().getId());
            model.addAttribute("totalPoint", totalPoint);

            return "consultant/serviceQuote/serviceQuoteCreate";
        }
        model.addAttribute("newServiceQuote", newServiceQuotes);
        return "redirect:/consultant/viewConsultantDetail/" + consultantId;
    }

    @PostMapping("/consultant/serviceQuote/save")
    public String saveServiceQuote(@ModelAttribute("newServiceQuote") ServiceQuotes newServiceQuotes,
            @RequestParam("serviceIds") List<Integer> serviceIds,
            @RequestParam("pointsUsed") String pointUsed,
            RedirectAttributes redirectAttributes) {
        
        String redirectIfWrong = checkValidation(newServiceQuotes, serviceIds, true, redirectAttributes);
        if(redirectIfWrong != null){
            return redirectIfWrong;
        }
        List<Service> serviceList = new ArrayList<>();
        newServiceQuotes.setServiceQuotesStatus(1);
        newServiceQuotes.setServiceQuotesDate(new Date());
        newServiceQuotes.setUsedPoint(Integer.parseInt(pointUsed));
        for (int id : serviceIds) {
            Service service = serviceService.getServiceById(id);
            if (service != null) { // Check if the service exists
                serviceList.add(service);
            }
        }

        newServiceQuotes.setService(serviceList);
        newServiceQuotes = serviceQuoteService.saveNewServiceQuote(newServiceQuotes);
        notificationService.createNotification(newServiceQuotes.getServiceQuotesId(),"serviceQuote",null,"manager","New Service Quote has been created");
        return "redirect:/consultant/serviceQuote";
    }

    @GetMapping("/consultant/serviceQuote/update")
    public String updateServiceQuote(@RequestParam("serviceQuoteId") int serviceQuoteId, Model model, HttpSession session) {
        ServiceQuotes serviceQuote = serviceQuoteService.getServiceQuotesById(serviceQuoteId);
        Staff staff = (Staff) session.getAttribute("user");

        if (serviceQuote != null && serviceQuote.isServiceQuoteBelongToStaff(staff, serviceQuote)) {
            model.addAttribute("consultant", serviceQuote.getConsultant());
            model.addAttribute("customer", serviceQuote.getCustomer());
            model.addAttribute("serviceQuote", serviceQuote);

            // List of all available services
            model.addAttribute("services", serviceService.getServiceList(20));

            User user = (User) session.getAttribute("user");
            model.addAttribute("staff", user);
            long totalPoint = loyaltyPointService.TotalPoints(serviceQuote.getCustomer().getId());
            model.addAttribute("totalPoint", totalPoint);
            notificationService.createNotification(serviceQuoteId, "serviceQuote", null, "manager", "Service Quote has been updated");
            return "consultant/serviceQuote/serviceQuoteUpdate";
        }

        return "redirect:/consultant/serviceQuote/detail/" + serviceQuoteId;
    }

    @PostMapping("/consultant/serviceQuote/saveUpdate")
    public String saveUpdateServiceQuote(@ModelAttribute("serviceQuote") ServiceQuotes serviceQuote,
            @RequestParam("serviceIds") List<Integer> serviceIds,
            @RequestParam("pointsUsed") String pointUsed,
            RedirectAttributes redirectAttributes) {
        
        String redirectIfWrong = checkValidation(serviceQuote, serviceIds, false, redirectAttributes);
        if(redirectIfWrong != null){
            return redirectIfWrong;
        }
        
        List<Service> serviceList = new ArrayList<>();
        serviceQuote.setServiceQuotesStatus(1);
        serviceQuote.setServiceQuotesDate(new Date());
        serviceQuote.setUsedPoint(Integer.parseInt(pointUsed));
        for (int id : serviceIds) {
            Service service = serviceService.getServiceById(id);
            if (service != null) { // Check if the service exists
                serviceList.add(service);
            }
        }
        serviceQuote.setService(serviceList);
        serviceQuote = serviceQuoteService.saveNewServiceQuote(serviceQuote);
        return "redirect:/consultant/serviceQuote/detail/" + serviceQuote.getServiceQuotesId();
    }

    @PostMapping("/consultant/serviceQuote/detail/saveStatus")
    public String saveStatusUpdateConsultant(Model model, HttpSession session,
            @RequestParam("id") int serviceQuoteId,
            @RequestParam("status") int statusId,
            @RequestParam(name = "declineReason", required = false) String feedbackContent,
            @RequestParam(name = "toUserId", required = false) Integer toUserId) {
        ServiceQuotes serviceQuotes = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, statusId);
        if (feedbackContent != null && toUserId != null) {
            User fromUser = (User) session.getAttribute("user");
            User toUser = userService.getManager();
            Feedback feedback = new Feedback();
            feedback.setFeedbackContent(feedbackContent);
            feedback.setFeedbackDate(new Date());
            feedback.setFromUser(fromUser);
            feedback.setToUser(toUser);
            feedback.setServiceQuotes(serviceQuotes);
            feedback = feedbackService.saveFeedback(feedback);
            if (statusId == 6) {
                notificationService.createNotification(serviceQuoteId, "serviceQuote", null, "manager", "Request service Quote has been rejected by Consultant: " + serviceQuotes.getStaff().getName());
            }
        }
        return "redirect:/consultant/serviceQuote/detail/" + serviceQuoteId;
    }
    
    public String checkValidation(ServiceQuotes newServiceQuotes, List<Integer> serviceIds,boolean isCreate, RedirectAttributes redirectAttributes ){
        String redirectLink;
        String flashAtrubute;
        if(isCreate){
            redirectLink = "redirect:/consultant/serviceQuote/create?consultantId=" + newServiceQuotes.getConsultant().getConsultantId();
            flashAtrubute = "newServiceQuote";
        }else{
            redirectLink = "redirect:/consultant/serviceQuote/update?serviceQuoteId=" + newServiceQuotes.getServiceQuotesId();
            flashAtrubute = "serviceQuote";
        }
        if (newServiceQuotes.getServiceQuotesName() == null || newServiceQuotes.getServiceQuotesName().trim().length() < 3) {
            redirectAttributes.addFlashAttribute("error", "Quote name must be at least 3 characters long.");
            redirectAttributes.addFlashAttribute(flashAtrubute, newServiceQuotes);
            return redirectLink;  
        }

        // Validate the quote content (must not be empty)
        if (newServiceQuotes.getServiceQuotesContent() == null || newServiceQuotes.getServiceQuotesContent().trim().isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Quote content is required.");
            redirectAttributes.addFlashAttribute(flashAtrubute, newServiceQuotes);
            return redirectLink;  
        }

        // Validate the area (must be a positive number greater than zero)
        if (newServiceQuotes.getServiceQuotesArea() <= 0) {
            redirectAttributes.addFlashAttribute("error", "Area must be a positive number greater than zero.");
            redirectAttributes.addFlashAttribute(flashAtrubute, newServiceQuotes);
            return redirectLink;  
        }

        if (newServiceQuotes.getServiceQuotesTotalPrice() <= 0) {
            redirectAttributes.addFlashAttribute("error", "Total price must be a positive number.");
            redirectAttributes.addFlashAttribute(flashAtrubute, newServiceQuotes);
            return redirectLink;
        }

        if (serviceIds == null || serviceIds.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "You must select at least one service.");
            redirectAttributes.addFlashAttribute(flashAtrubute, newServiceQuotes);
            return redirectLink;
        }
        return null;
    }

    //----------------------------------- CUSTOMER SECTION ----------------------------------------------
    @GetMapping("/customer/serviceQuote")
    public String listFilteredServiceQuoteCustomer(Model model, HttpSession session, RedirectAttributes redirectAttributes,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "serviceQuotesDate") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate) {

        User customer = (User) session.getAttribute("user");
        if (customer == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Please login.");
            return "redirect:/login";
        }
        List<ServiceQuotes> serviceQuoteses;
        long totalServiceQuotes;

        serviceQuoteses = serviceQuoteService.getFilteredServiceQuoteCustomer(page, size, sortBy, sortDirection, fromDate, toDate, customer.getId());
        totalServiceQuotes = serviceQuoteService.countFilteredServiceQuoteCustomer(fromDate, toDate, customer.getId());

        int totalPages = (int) Math.ceil((double) totalServiceQuotes / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("serviceQuote", serviceQuoteses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("fromDate", fromDate);  // Add fromDate to model
        model.addAttribute("toDate", toDate);  // Add toDate to model       
        return "customer/serviceQuote/serviceQuoteManage";  // JSP page to display the contract list
    }

    @PostMapping("/customer/serviceQuote/saveStatus")
    public String saveStatusUpdateCustomer(Model model, HttpSession session,
            @RequestParam("id") int serviceQuoteId,
            @RequestParam("status") int statusId,
            @RequestParam(name = "declineReason", required = false) String feedbackContent,
            @RequestParam(name = "toUserId", required = false) Integer toUserId) {
        ServiceQuotes serviceQuotes = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, statusId);
        if (feedbackContent != null && toUserId != null) {
            User fromUser = (User) session.getAttribute("user");
            User toUser = serviceQuotes.getStaff();
            Feedback feedback = new Feedback();
            feedback.setFeedbackContent(feedbackContent);
            feedback.setFeedbackDate(new Date());
            feedback.setFromUser(fromUser);
            feedback.setToUser(toUser);
            feedback.setServiceQuotes(serviceQuotes);
            feedback = feedbackService.saveFeedback(feedback);
        }
        if (statusId == 4) {
            notificationService.createNotification(serviceQuoteId, "serviceQuote", null, "manager", "Service quotes has been accepted by Customer: " + serviceQuotes.getCustomer().getName());
        } else if (statusId == 5) {
            notificationService.createNotification(serviceQuoteId, "serviceQuote", serviceQuotes.getConsultant().getStaff().getId(), "consultant", "Your service quotes has been denied by customer! Please edit it");

        }

        return "redirect:/customer/serviceQuote";
    }
    @GetMapping("/customer/serviceQuote/detail/{id}")
    public String redirectController(){
        return "redirect:/customer/serviceQuote";
    }
}
