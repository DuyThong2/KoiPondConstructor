/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dao.CustomerDAO;
import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.*;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDateTime;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.joda.time.LocalDateTime.now;

/**
 *
 * @author HP
 */
@Controller
public class ConsultantController {
    
    private ConsultantService consultantService;
    private StaffService staffService;
    private CustomerService customerService;
    private NotificationService notificationService;

    private final SimpMessagingTemplate simpMessagingTemplate;

    public ConsultantController(ConsultantService consultantService,
                                StaffService staffService,
                                CustomerService customerService,
                                SimpMessagingTemplate simpMessagingTemplate,
                                NotificationService notificationService) {
        this.consultantService = consultantService;
        this.staffService = staffService;
        this.customerService = customerService;
        this.simpMessagingTemplate = simpMessagingTemplate;
        this.notificationService =notificationService;
    }

        
    //MANAGER SITE   
    @GetMapping("/manager/consultant")
    public String getConsultantList(Model model,
                                    @RequestParam(defaultValue = "0")int page,
                                    @RequestParam(defaultValue = "8")int size,
                                    @RequestParam(defaultValue = "consultantDateTime")String sortBy,
                                    @RequestParam(defaultValue = "asc")String sortDirection,
                                    @RequestParam(required = false)Integer statusFilter){
        List<Consultant> consultants;
        long totalConsultants;
        
        if(statusFilter != null){
            consultants = consultantService.getConsultantListByOrderSortFilter(page, size, sortBy, sortDirection, statusFilter);
            totalConsultants = consultantService.countConsultantByStatus(statusFilter);
        }else{
            consultants = consultantService.getConsultantListOrderByAndSort(page, size, sortBy, sortDirection);
            totalConsultants = consultantService.countConsultant();
        }
        int totalPages = (int) Math.ceil((double) totalConsultants / size);
        
        model.addAttribute("consultants", consultants);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        
        return "manager/consultant/consultantManage";
    }
    
    @GetMapping("/manager/consultant/detail/{id}")
    public String getConsultantById(@PathVariable("id")int consultantId, Model model){
        Consultant consultant = consultantService.getConsultantById(consultantId);
        model.addAttribute("consultant", consultant);
        return "manager/consultant/consultantDetail";
    }
    
    @GetMapping("/manager/consultant/viewConsultantStaffList/{id}")
    public String getConsultantStaffList(@PathVariable("id")int id,Model model){
        List<Staff> list = staffService.getStaffListByRole("Consulting");
        model.addAttribute("consultantStaffList",list);
        model.addAttribute("consultant", consultantService.getConsultantById(id));
        return "manager/consultant/addConsultantStaff";
    }
    
    @PostMapping("/manager/consultant/viewConsultantStaffList/editConsultantStaff")
    public String updateConsultantStaff(@RequestParam("id")int id, @RequestParam("staffId")int staffId,Model model){
        Staff consultantStaff = staffService.getStaffById(staffId);
        Consultant consultant = consultantService.updateConsultantStaff(id, consultantStaff);
        return "redirect:/manager/consultant/detail/" + id;
    }
    
    
    
    
    //CONSULTANT SITE
//    @GetMapping("/consultant/viewConsultantList")
//    public String getConsultantListByStaffId(Model model, HttpSession session){      
//        User user = (User) session.getAttribute("user");
//        List<Consultant> list = consultantService.getConsultantListByStaffId(user.getId());
//        model.addAttribute("consultantList", list);
//        return "consultant/consultantManage";
//    }
    
    @GetMapping("/consultant/viewConsultantList")
    public String getConsultantListByStaffId(Model model, HttpSession session,
                                            @RequestParam(defaultValue = "0")int page,
                                            @RequestParam(defaultValue = "2")int size,
                                            @RequestParam(defaultValue = "consultantDateTime")String sortBy,
                                            @RequestParam(defaultValue = "asc")String sortDirection,
                                            @RequestParam(required = false)Integer statusFilter){
        List<Consultant> consultants;
        User user = (User) session.getAttribute("user");
        long totalConsultants;
        
        if(statusFilter != null){
            consultants = consultantService.getConsultantListByStaffIdOrderSortFilter(user.getId(), page, size, sortBy, sortDirection, statusFilter);
            totalConsultants = consultantService.countConsultantByStaffIdAndStatus(user.getId(), statusFilter);
        }else{
            consultants = consultantService.getConsultantListByStaffIdOrderSort(user.getId(), page, size, sortBy, sortDirection);
            totalConsultants = consultantService.countConsultantByStaffId(user.getId());
        }
        int totalPages = (int) Math.ceil((double) totalConsultants / size);
        
        model.addAttribute("consultants", consultants);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        
        return "consultant/consultantManage";
    }
    
    @GetMapping("/consultant/viewConsultantDetail/{id}")
    public String getConsultantDetail(@PathVariable("id")int consultantId, Model model){
        Consultant consultant = consultantService.getConsultantById(consultantId);
        model.addAttribute("consultant", consultant);
        return "consultant/consultantDetail";
    }
    
    @GetMapping("/consultant/viewConsultantDetail/updateStatus")
    public String updateConsultantStatus(@RequestParam("consultantId")int consultantId, @RequestParam("statusId")int statusId, Model model){
        Consultant consultant = consultantService.updateConsultantStatus(consultantId, statusId);
        return "redirect:/consultant/viewConsultantDetail/" + consultantId;
    }
    
    
    

    //CUSTOMER SITE        

    @PostMapping("/save")
    public String saveConsultantInWeb(@RequestParam("name") String name,
                                      @RequestParam("phone") String phone,
                                      @RequestParam("email") String email,
                                      @RequestParam("content") String content,
                                      @RequestParam("type") String type,
                                      HttpSession session,  RedirectAttributes redirectAttributes) {

        Consultant newConsultant = new Consultant();
        newConsultant.setConsultantCustomerName(name);
        newConsultant.setConsultantPhone(phone);
        newConsultant.setConsultant_email(email);
        newConsultant.setConsultantContent(content);
        newConsultant.setConsultantType(type);
        newConsultant.setConsultantDateTime(Calendar.getInstance());
        newConsultant.setConsultantStatus(1);


        // Save the consultant

        User user = (User) session.getAttribute("user");       
        if(user != null){
            Customer cus = customerService.getCustomerById(user.getId());
            newConsultant.setCustomer(cus);
        }

        newConsultant = consultantService.createConsultant(newConsultant);
        redirectAttributes.addFlashAttribute("success", "Consultant created successfully! ");
        // Call the private method to handle notification
        sendConsultantCreationNotification(newConsultant);

        return "redirect:/";
    }


    // Private method to send notification
    private void sendConsultantCreationNotification(Consultant newConsultant) {
        Notification notification = new Notification();
        notification.setMessage("New consultant created: " + newConsultant.getConsultantCustomerName());
        notification.setRelatedId(newConsultant.getConsultantId());  // Assuming getConsultantId() exists
        notification.setReceiverType("manager"); // Assuming manager is notified
        notification.setFromTable("consultant");
        notification.setCreatedAt(java.time.LocalDateTime.now());
        notificationService.saveNotification(notification);
        // Broadcast notification to /topic/notifications
        simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
    }
    
    @GetMapping("/customer/consultant")
    public String listFilteredServiceQuoteCustomer(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "consultantDateTime") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter){
        User customer = (User) session.getAttribute("user");      
        List<Consultant> consultants;
        long totalConsultant;
        
        // Apply filtering based on the name, date range, and status
        consultants = consultantService.getConsultantListOrderByAndSortCustomer(page, size, sortBy, sortDirection, statusFilter, customer);
        totalConsultant = consultantService.countConsultantListOrderByAndSortCustomer(page, size, sortBy, sortDirection, statusFilter, customer);

        int totalPages = (int) Math.ceil((double) totalConsultant / size);
        
        if (page > totalPages) {
            page = (int) totalPages;
        } else if (page < 1) {
            page = 1;

        }
        page = Math.max(page, 1);

        // Add attributes to the model for JSP rendering
        model.addAttribute("consultant", consultants);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);        

        return "customer/consultant/consultantManage";  // JSP page to display the contract list
    }
    
    @GetMapping("/customer/consultant/updateStatus")
    public String updateConsultantStatusCustomer(@RequestParam("consultantId")int consultantId, 
                                                 @RequestParam("statusId")int statusId, Model model, HttpSession session){
        User customer = (User) session.getAttribute("user");
        Consultant check = consultantService.getConsultantById(consultantId);
        if(check != null && check.getCustomer().getId() == customer.getId()){
            check = consultantService.updateConsultantStatus(consultantId, statusId);           
        }        
        return "redirect:/customer/consultant";

    }
}
