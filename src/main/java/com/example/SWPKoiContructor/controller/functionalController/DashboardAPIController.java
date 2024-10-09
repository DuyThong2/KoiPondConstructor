package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.QuoteService;
import com.example.SWPKoiContructor.services.StaffService;
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
    private final ContractService contractService;
    private final StaffService staffService;

    public DashboardAPIController(QuoteService quoteService, ProjectService projectService, ContractService contractService, StaffService staffService) {
        this.quoteService = quoteService;
        this.projectService = projectService;
        this.contractService = contractService;
        this.staffService = staffService;
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
        Map<Integer, BigDecimal> monthlyEarnings = projectService.getTotalEarningsForCompletedProjectsPerMonth(year);
        return ResponseEntity.ok(monthlyEarnings);
    }
}
