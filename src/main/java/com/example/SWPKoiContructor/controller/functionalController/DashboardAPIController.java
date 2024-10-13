package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.QuoteService;
import com.example.SWPKoiContructor.services.ServiceDetailService;
import com.example.SWPKoiContructor.services.ServiceService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.services.functionalService.DashboardService;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardAPIController {

    private final QuoteService quoteService;
    private final ProjectService projectService;
    private final ServiceService serviceService;
    private final ServiceDetailService serviceDetailService;
    private final StaffService staffService;
    private final DashboardService dashboardService;

    public DashboardAPIController(QuoteService quoteService, ServiceService serviceService, ProjectService projectService, StaffService staffService,ServiceDetailService serviceDetailService,DashboardService dashboardService) {
        this.quoteService = quoteService;
        this.projectService = projectService;
        this.serviceService = serviceService;
        this.staffService = staffService;
        this.serviceDetailService = serviceDetailService;
        this.dashboardService = dashboardService;
    }

    // Return the dashboard statistics as JSON for the frontend to consume
    @GetMapping("/upper-stats")
    public ResponseEntity<Map<String, Object>> getDashboardData() {
        int quotesPending = (int) quoteService.countQuotesPeding();
        int projectComplete = (int) projectService.countProjectComplete();
        int projectProcessing = (int) projectService.countProjectProcessing();
        int staffInWork = (int) staffService.countStaff();

        // Create a map to hold the data and return it as JSON
        Map<String, Object> dashboardData = new HashMap<>();
        dashboardData.put("quotesPending", quotesPending);
        dashboardData.put("projectComplete", projectComplete);
        dashboardData.put("projectProcessing", projectProcessing);
        dashboardData.put("staffInWork", staffInWork);

        return ResponseEntity.ok(dashboardData);
    }

    // API to get monthly earnings
    @GetMapping("/monthly-earnings")
    public ResponseEntity<Map<Integer, BigDecimal>> getMonthlyEarnings(@RequestParam int year) {
        Map<Integer, BigDecimal> monthlyEarnings = dashboardService.getTotalEarningsForCompletedProjectsPerMonth(year);
        return ResponseEntity.ok(monthlyEarnings);
    }

    @GetMapping("/service-booking-percentages")
    public ResponseEntity<Map<String, BigDecimal>> getServiceBookingPercentages() {
        Map<String, BigDecimal> servicePercentages = dashboardService.getServiceBookingPercentages();
        return ResponseEntity.ok(servicePercentages);
    }

    @GetMapping("/monthly-service-revenue")
    public Map<String, Map<Integer, BigDecimal>> getMonthlyServiceRevenue() {
        // Returns a map with BigDecimal instead of Double
        return dashboardService.getMonthlyServiceRevenue();
    }
    
     @GetMapping("/service-stats")
    public Map<String, Long> getServiceStats() {
        return dashboardService.getServiceStats();
    }

    @GetMapping("/project-contract-stats")
    public Map<String, Long> getProjectAndContractStats() {
        return dashboardService.getProjectAndContractStats();
    }

    @GetMapping("/consultant-quote-contract-stats")
    public Map<String, Long> getConsultantQuoteContractStats() {
        return dashboardService.getConsultantQuoteContractStats();
    }
}
