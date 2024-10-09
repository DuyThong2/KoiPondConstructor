package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.LoyaltyPointDAO;
import com.example.SWPKoiContructor.entities.Customer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoyaltyPointService {

    private LoyaltyPointDAO loyaltyPointDAO;

    public LoyaltyPointService(LoyaltyPointDAO loyaltyPointDAO) {
        this.loyaltyPointDAO = loyaltyPointDAO;
    }

    public long TotalPoints(int customerId) {
        return loyaltyPointDAO.totalPoints(customerId);
    }

    @Transactional
    public void gainLoyaltyPoints(Customer customer, double moneySpent) {
        int pointsToGain = (int) (moneySpent * 0.01);
        loyaltyPointDAO.insertLoyaltyPoint(customer, pointsToGain);
    }

    @Transactional
    public double useLoyaltyPoints(Customer customer, double moneyToBeReduced) {

        long totalAvailablePoints = loyaltyPointDAO.totalPoints(customer.getId());
        double pointsValue = totalAvailablePoints;

        if (pointsValue >= moneyToBeReduced) {
            loyaltyPointDAO.insertLoyaltyPointUsage(customer, (int) moneyToBeReduced);
            return moneyToBeReduced;
        } else {
            loyaltyPointDAO.insertLoyaltyPointUsage(customer, (int) pointsValue);
            return pointsValue;
        }
    }
}
