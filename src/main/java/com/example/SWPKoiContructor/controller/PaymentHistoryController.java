package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.PaymentHistory;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.PaymentHistoryService;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class PaymentHistoryController {

    private final PaymentHistoryService paymentHistoryService;

    @Autowired
    public PaymentHistoryController(PaymentHistoryService paymentHistoryService) {
        this.paymentHistoryService = paymentHistoryService;
    }

    @GetMapping("/manager/payment")
    public String listManagerPayments(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "paymentDate") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) String paymentMethod,
            @RequestParam(required = false) String searchDescription,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            @RequestParam(required = false) Integer customerId, 
            Model model,
            HttpSession session
    ) {
        User user = (User) session.getAttribute("user");
        String userRole = user.getAuthority().getAuthority();

        int totalPage = (int) Math.ceil((double) paymentHistoryService.countFilteredPayments(
                paymentMethod, searchDescription,
                fromDate != null ? fromDate.atStartOfDay() : null,
                toDate != null ? toDate.atTime(LocalTime.MAX) : null,
                customerId, userRole)
                / size);
        if(page > totalPage){
            page = 0;
        }
        List<PaymentHistory> payments = paymentHistoryService.getFilteredPayments(
                page, size, sortBy, sortDirection,
                paymentMethod, searchDescription,
                fromDate != null ? fromDate.atStartOfDay() : null,
                toDate != null ? toDate.atTime(LocalTime.MAX) : null,
                customerId, userRole
        );

        
        model.addAttribute("totalPages", totalPage);
        model.addAttribute("payments", payments);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", size);
        model.addAttribute("customerId", customerId);  // Pass the customerId back to the view if needed

        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("paymentMethod", paymentMethod);
        model.addAttribute("searchDescription", searchDescription);
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);

        return "manager/payment/paymentManage";
    }

// Adjusted method for customer
    @GetMapping("/customer/payment")
    public String listCustomerPayments(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "paymentDate") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) String paymentMethod,
            @RequestParam(required = false) String searchDescription,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            Model model,
            HttpSession session
    ) {
        
        if (searchDescription != null) {
            searchDescription = searchDescription.trim();
        }
        if (paymentMethod != null) {
            paymentMethod = paymentMethod.trim();
        }

        User user = (User) session.getAttribute("user");
        String userRole = user.getAuthority().getAuthority();
        Integer customerId = user.getId();
        int totalPage = (int) Math.ceil((double) paymentHistoryService.countFilteredPayments(
                paymentMethod, searchDescription,
                fromDate != null ? fromDate.atStartOfDay() : null,
                toDate != null ? toDate.atTime(LocalTime.MAX) : null,
                customerId, userRole
        ) / size);
        if(page > totalPage){
            page = 0;
        }
        // Fetch filtered payments
        List<PaymentHistory> payments = paymentHistoryService.getFilteredPayments(
                page, size, sortBy, sortDirection,
                paymentMethod, searchDescription,
                fromDate != null ? fromDate.atStartOfDay() : null,
                toDate != null ? toDate.atTime(LocalTime.MAX) : null,
                customerId, userRole
        );

        
        model.addAttribute("totalPages", totalPage);
        model.addAttribute("payments", payments);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("paymentMethod", paymentMethod);
        model.addAttribute("searchDescription", searchDescription);
        model.addAttribute("fromDate", fromDate);
        model.addAttribute("toDate", toDate);

        return "customer/payment/paymentManage";
    }

    @GetMapping("/payment/{id}")
    public String getPaymentById(
            @PathVariable UUID id,
            Model model,
            HttpSession session
    ) {
        User user = (User) session.getAttribute("user");
        String userRole = user.getAuthority().getAuthority();
        PaymentHistory payment = paymentHistoryService.getById(id);

        if (payment != null && ("ROLE_MANAGER".equals(userRole)
                || ("ROLE_CUSTOMER".equals(userRole) && payment.isPaymentBelongToUser(user.getId())))) {
            model.addAttribute("payment", payment);
            return "payment/details";
        } else {
            if (null == userRole) {
                return "error/error-403";
            } else {
                switch (userRole) {
                    case "ROLE_MANAGER":
                        return "redirect:/manager/payment"; // Redirect if the payment is not found.
                    case "ROLE_CUSTOMER":
                        return "redirect:/customer/payment";
                    default:
                        return "error/error-403";
                }
            }
        }

    }

}
