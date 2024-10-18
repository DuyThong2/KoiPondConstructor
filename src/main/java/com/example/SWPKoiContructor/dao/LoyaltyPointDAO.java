
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Customer;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.example.SWPKoiContructor.entities.LoyaltyPoint;
import java.util.Calendar;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class LoyaltyPointDAO {
    private EntityManager entityManager;

    public LoyaltyPointDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public long totalPoints(int customerId) {
        TypedQuery<Long> query = entityManager.createQuery(
                "select SUM(l.amount) from LoyaltyPoint l where l.customer.id = :customerId", Long.class);
        query.setParameter("customerId", customerId);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }
    
    
    public void insertLoyaltyPoint(Customer customer, int pointsEarned) {
        LoyaltyPoint loyaltyPoint = new LoyaltyPoint();
        loyaltyPoint.setCustomer(customer);
        loyaltyPoint.setDateApply(Calendar.getInstance());
        loyaltyPoint.setAmount(pointsEarned); // Positive value since points are gained

        entityManager.persist(loyaltyPoint);
    }

    // Method to insert point usage into the database (negative points for usage)
    
    public void insertLoyaltyPointUsage(Customer customer, int pointsUsed) {
        LoyaltyPoint loyaltyPoint = new LoyaltyPoint();
        loyaltyPoint.setCustomer(customer);
        loyaltyPoint.setDateApply(Calendar.getInstance());
        loyaltyPoint.setAmount(-pointsUsed); // Negative value since points are used

        entityManager.persist(loyaltyPoint);
    }

    
    
    
    
}
