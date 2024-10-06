package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.LoyaltyPointDAO;
import org.springframework.stereotype.Service;

@Service
public class LoyaltyPointService {

    private LoyaltyPointDAO loyaltyPointDAO;

    public LoyaltyPointService(LoyaltyPointDAO loyaltyPointDAO) {
        this.loyaltyPointDAO = loyaltyPointDAO;
    }

    public long TotalPoints(int customerId) {
        return loyaltyPointDAO.TotalPoints(customerId);
    }
}
