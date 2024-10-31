package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.PaymentHistoryDAO;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.PaymentHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
public class PaymentHistoryService {

    private final PaymentHistoryDAO paymentHistoryDAO;

    private NotificationService notificationService;
    @Autowired
    public PaymentHistoryService(PaymentHistoryDAO paymentHistoryDAO,@Lazy NotificationService notificationService) {
        this.paymentHistoryDAO = paymentHistoryDAO;
        this.notificationService = notificationService;
    }


    @Transactional
    public PaymentHistory createPayment(PaymentHistory payment) {
        PaymentHistory paymentHistory= paymentHistoryDAO.createPayment(payment);
        return paymentHistory ;

    }
    @Transactional
    public PaymentHistory updatePayment(PaymentHistory payment) {
        return paymentHistoryDAO.updatePayment(payment);
    }

    @Transactional
    public void deletePayment(UUID paymentId) {
        paymentHistoryDAO.deletePayment(paymentId);
    }

   
    public PaymentHistory getById(UUID paymentId) {
        return paymentHistoryDAO.getById(paymentId);
    }

    
    public List<PaymentHistory> getFilteredPayments(
        int page, int size, 
        String sortBy, String sortDirection, 
        String paymentMethod, 
        String searchDescription, 
        LocalDateTime fromDate, 
        LocalDateTime toDate,
        Integer customerId,
        String userRole
    ) {
        return paymentHistoryDAO.getFilteredPayments(
            page, size, sortBy, sortDirection, paymentMethod, 
            searchDescription, fromDate, toDate, customerId, userRole
        );
    }

    
    public long countFilteredPayments(
        String paymentMethod, 
        String searchDescription, 
        LocalDateTime fromDate, 
        LocalDateTime toDate,
        Integer customerId,
        String userRole
    ) {
        return paymentHistoryDAO.countFilteredPayments(
            paymentMethod, searchDescription, fromDate, toDate, 
            customerId, userRole
        );
    }
}
