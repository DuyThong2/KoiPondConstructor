/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services.functionalService;

import com.example.SWPKoiContructor.dao.ConsultantDAO;
import com.example.SWPKoiContructor.dao.ContractDAO;
import com.example.SWPKoiContructor.dao.ProjectDAO;
import com.example.SWPKoiContructor.dao.QuoteDAO;
import com.example.SWPKoiContructor.dao.ServiceDAO;
import com.example.SWPKoiContructor.dao.ServiceDetailDAO;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Tuple;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */

@Service
public class DashboardService {
    
    private final ServiceDetailDAO serviceDetailDAO;
    private final ContractDAO contractDAO;
    private final ProjectDAO projectDAO;
    private final ConsultantDAO consultantDAO;
    private final QuoteDAO quoteDAO;
    private final ServiceDAO serviceDAO;

    public DashboardService(ServiceDetailDAO serviceDetailDAO, ContractDAO contractDAO, ProjectDAO projectDAO, ConsultantDAO consultantDAO, QuoteDAO quoteDAO, ServiceDAO serviceDAO) {
        this.serviceDetailDAO = serviceDetailDAO;
        this.contractDAO = contractDAO;
        this.projectDAO = projectDAO;
        this.consultantDAO = consultantDAO;
        this.quoteDAO = quoteDAO;
        this.serviceDAO = serviceDAO;
    }
    
    
    
    
    
    
    
    public Map<String, Long> getServiceStats() {
        Map<String, Long> stats = new HashMap<>();
        Long totalServicesBooked = serviceDetailDAO.countServiceDetails(); // Assuming 1 = Booked
        Long totalServicesCompleted = serviceDetailDAO.countByStatus(3); // Assuming 3 = Completed
        stats.put("totalServicesBooked", totalServicesBooked);
        stats.put("totalServicesCompleted", totalServicesCompleted);
        return stats;
    }

    public Map<String, Long> getProjectAndContractStats() {
        Map<String, Long> stats = new HashMap<>();
        int totalContractsSigned = contractDAO.getTotalContracts();

        Long totalProjectsInPlanning = projectDAO.countByStage(1);
        Long totalProjectsInDesign = projectDAO.countByStage(2);
        Long totalProjectsInConstruction = projectDAO.countByStage(3);
        Long totalProjectsInMaintenance = projectDAO.countByStage(4);
        Long totalProjectsCompleted = projectDAO.countByStage(5);

        stats.put("totalContractsSigned",(long) totalContractsSigned);
        stats.put("totalProjectsInPlanning", totalProjectsInPlanning);
        stats.put("totalProjectsInDesign", totalProjectsInDesign);
        stats.put("totalProjectsInConstruction", totalProjectsInConstruction);
        stats.put("totalProjectsInMaintenance", totalProjectsInMaintenance);
        stats.put("totalProjectsCompleted", totalProjectsCompleted);
        return stats;
    }

    // 3. Fetch Consultant, Quote, and Contract Stats
    public Map<String, Long> getConsultantQuoteContractStats() {
        Map<String, Long> stats = new HashMap<>();
        Long totalConsultantsReceived = consultantDAO.countConsultant();
        Long totalQuotesCreated = quoteDAO.countQuotes();
        int totalContractsCreated = contractDAO.getTotalContracts();
        stats.put("totalConsultantsReceived", totalConsultantsReceived);
        stats.put("totalQuotesCreated", totalQuotesCreated);
        stats.put("totalContractsCreated",(long) totalContractsCreated);
        return stats;
    }
    
    
    public Map<String, BigDecimal> getServiceBookingPercentages() {
        // Fetch total bookings and bookings per service
        Long totalBookings = serviceDetailDAO.countServiceDetails();
        List<Tuple> serviceBookingCounts = serviceDetailDAO.countBookingsPerService();

        Map<String, BigDecimal> servicePercentages = new HashMap<>();

        // Loop through each tuple and calculate percentages
        for (Tuple tuple : serviceBookingCounts) {
            String serviceName = tuple.get("serviceName", String.class);
            Long bookingCount = tuple.get("bookingCount", Long.class);

            // Calculate percentage
            BigDecimal percentage = BigDecimal.valueOf((bookingCount * 100.0) / totalBookings);
            servicePercentages.put(serviceName, percentage);
        }

        return servicePercentages;
    }
    
    
   public Map<String, Map<Integer, BigDecimal>> getMonthlyServiceRevenue() {
        List<Tuple> results = serviceDAO.getMonthlyRevenueForActiveServices();
        
        // Prepare a nested map where:
        // Outer map key is service name
        // Inner map key is the month (1-12), and value is the total revenue for that month
        Map<String, Map<Integer, BigDecimal>> serviceRevenueMap = new HashMap<>();

        for (Tuple row : results) {
            String serviceName = row.get("serviceName", String.class);
            int month = row.get("month", Integer.class);  // Month
            BigDecimal revenue = row.get("totalRevenue", BigDecimal.class); // Total Revenue

            // If service is not already in the map, add it
            serviceRevenueMap.putIfAbsent(serviceName, new HashMap<>());

            // Add the revenue for this month
            serviceRevenueMap.get(serviceName).put(month, revenue);
        }

        return serviceRevenueMap;
    }
   
   
   //USE FOR DASHBOARD ONLY
    public Map<Integer, BigDecimal> getTotalEarningsForCompletedProjectsPerMonth(int year) {
        List<Tuple> results = projectDAO.getTotalEarningsForCompletedProjectsPerMonth(year);
        Map<Integer, BigDecimal> earningsPerMonth = new HashMap<>();
        
        // Populate the map with month and total earnings
        for (Tuple tuple : results) {
            Integer month = tuple.get("month", Integer.class);
            Double earningsAsDouble = tuple.get("totalEarnings", Double.class);  // Fetch as Double
            BigDecimal totalEarnings = BigDecimal.valueOf(earningsAsDouble);  // Convert to BigDecimal
            earningsPerMonth.put(month, totalEarnings);
        }
        
        return earningsPerMonth;
    }
}
