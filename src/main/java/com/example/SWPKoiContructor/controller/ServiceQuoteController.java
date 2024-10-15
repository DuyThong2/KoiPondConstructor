/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.ConsultantService;
import com.example.SWPKoiContructor.services.ServiceQuoteService;
import com.example.SWPKoiContructor.services.ServiceService;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
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

/**
 *
 * @author HP
 */
@Controller
public class ServiceQuoteController {
    private ServiceQuoteService serviceQuoteService;
    private ServiceService serviceService;
    private ConsultantService consultantService;

    public ServiceQuoteController(ServiceQuoteService serviceQuoteService, ServiceService serviceService, ConsultantService consultantService) {
        this.serviceQuoteService = serviceQuoteService;
        this.serviceService = serviceService;
        this.consultantService = consultantService;
    }
    
    //----------------------------------- STAFF SECTION ----------------------------------------------
    
    @GetMapping("/consultant/serviceQuote/detail/{id}")
    public String getDetailServiceQuote(@PathVariable("id")int id, Model model, HttpSession session){
        ServiceQuotes serviceQuote = serviceQuoteService.getServiceQuotesById(id);
        Staff staff = (Staff) session.getAttribute("user");
        if(serviceQuote != null && serviceQuote.isServiceQuoteBelongToStaff(staff, serviceQuote)){
            model.addAttribute("serviceQuote", serviceQuote);
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
    public String createNewServiceQuote(@RequestParam("consultantId")int consultantId, Model model, HttpSession session){
        ServiceQuotes newServiceQuotes = new ServiceQuotes();
        Consultant consultant = consultantService.getConsultantById(consultantId);
        if(consultant.getServiceQuotes() == null){
            model.addAttribute("consultant", consultant);
            model.addAttribute("customer", consultant.getCustomer());        
            model.addAttribute("newServiceQuote", newServiceQuotes);
            List<Service> services = serviceService.getServiceList(20);
            model.addAttribute("service", services);
            User user = (User) session.getAttribute("user");
            model.addAttribute("staff", user);
            return "consultant/serviceQuote/serviceQuoteCreate";
        }
        model.addAttribute("newServiceQuote", newServiceQuotes);
        return "redirect:/consultant/viewConsultantDetail/" + consultantId;
    }
    
    @PostMapping("/consultant/serviceQuote/save")
    public String saveServiceQuote(@ModelAttribute("newServiceQuote") ServiceQuotes newServiceQuotes) {
        newServiceQuotes.setServiceQuotesStatus(1);
        newServiceQuotes.setServiceQuotesDate(new Date());
        newServiceQuotes = serviceQuoteService.saveNewServiceQuote(newServiceQuotes);
        return "redirect:/consultant/serviceQuote";
    }
    
    @GetMapping("/consultant/serviceQuote/update")
    public String updateServiceQuote(@RequestParam("serviceQuoteId")int serviceQuoteId, Model model, HttpSession session){
        ServiceQuotes serviceQuote = serviceQuoteService.getServiceQuotesById(serviceQuoteId);
        Staff staff = (Staff) session.getAttribute("user");
        if(serviceQuote != null && serviceQuote.isServiceQuoteBelongToStaff(staff, serviceQuote)){
            model.addAttribute("consultant", serviceQuote.getConsultant());
            model.addAttribute("customer", serviceQuote.getCustomer());        
            model.addAttribute("serviceQuote", serviceQuote);
            model.addAttribute("service", serviceService.getServiceList(20));
            User user = (User) session.getAttribute("user");
            model.addAttribute("staff", user);
            return "consultant/serviceQuote/serviceQuoteUpdate";
        }
        return "redirect:/consultant/serviceQuote/detail/" + serviceQuoteId;
    }
    
    @PostMapping("/consultant/serviceQuote/saveUpdate")
    public String saveUpdateServiceQuote(@ModelAttribute("serviceQuote") ServiceQuotes serviceQuote){
        serviceQuote.setServiceQuotesStatus(1);
        serviceQuote.setServiceQuotesDate(new Date());
        serviceQuote = serviceQuoteService.saveNewServiceQuote(serviceQuote);        
        return "redirect:/consultant/serviceQuote/detail/" + serviceQuote.getServiceQuotesId();
    }
}