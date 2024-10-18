package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.ServiceDetail;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.ServiceDetailService;
import com.example.SWPKoiContructor.services.ServiceQuoteService;
import com.example.SWPKoiContructor.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ServiceDetailController {

    @Autowired
    private ServiceDetailService serviceDetailService;

    @Autowired
    private StaffService staffService;
    
    @Autowired
    private ServiceQuoteService serviceQuoteService;

    @Autowired
    private ProjectService projectService;

    // Display list of service details with pagination and optional status filtering
    @GetMapping("/manager/serviceDetails")
    public String serviceDetailListManager(
            Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String sortType,
            @RequestParam(required = false) Integer statusFilter) {

        List<ServiceDetail> list;
        long serviceDetailNum;

        // Fetch service details with or without status filtering
        if (statusFilter != null) {
            list = serviceDetailService.getPaginationServiceDetailListByStatus(page, size, sortBy, sortType, statusFilter);
            serviceDetailNum = serviceDetailService.countServiceDetailFilter(statusFilter);
        } else {
            list = serviceDetailService.getPaginationServiceDetailList(page, size, sortBy, sortType);
            serviceDetailNum = serviceDetailService.countServiceDetails();
        }

        long totalPage = (long) Math.ceil(serviceDetailNum / (double) size);
        page = Math.max(page, 1);

        // Add attributes to the model for rendering in the view
        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceDetailsList", list);
        model.addAttribute("statusFilter", statusFilter);

        return "manager/service/serviceCustomerManage"; // Path to your JSP page for service details list
    }

    // Show detailed information about a specific service detail

    @GetMapping("/manager/serviceDetails/{serviceDetailId}")
    public String showServiceDetail(
            @PathVariable("serviceDetailId") int serviceDetailId, Model model) {
        ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

        if (serviceDetail == null) {
            return "redirect:/manager/serviceDetails"; // Redirect if service detail not found
        }

        // Add attributes to the model for rendering
        model.addAttribute("serviceDetail", serviceDetail);
        model.addAttribute("customer", serviceDetail.getCustomer());
        model.addAttribute("service", serviceDetail.getService());

        return "manager/service/serviceDetail"; // JSP page to show service detail information
    }
    
    @PostMapping("/manager/serviceDetails/create")
    public String createNewServiceDetail(@RequestParam("serviceQuoteId")int serviceQuoteId, Model model){
        try{
        ServiceQuotes serviceQuotes = serviceQuoteService.getServiceQuotesById(serviceQuoteId);
        ServiceDetail newServiceDetail = new ServiceDetail();
        newServiceDetail.setPrice(serviceQuotes.getServiceQuotesTotalPrice());
        newServiceDetail.setDateRegister(new Date());
        newServiceDetail.setServiceDetailStatus(1);
       
        newServiceDetail.setCustomer(serviceQuotes.getCustomer());
        newServiceDetail = serviceDetailService.createServiceDetail(newServiceDetail);
        return "redirect:/manager/serviceDetails";
        }catch(Exception e){
            return "redirect:/manager/serviceQuote/detail/" + serviceQuoteId;
        }
    }


    // Display page for assigning construction staff to a service detail
    @GetMapping("/manager/serviceDetails/assign/{serviceDetailId}")
    public String assignConstructionStaffPage(
            @PathVariable("serviceDetailId") int serviceDetailId,
            @RequestParam(name = "searchTerm", required = false) String searchTerm,
            @RequestParam(name = "size", required = false, defaultValue = "5") int size,
            @RequestParam(name = "currentPage", required = false, defaultValue = "1") int currentPage,
            Model model) {

        // Fetch the service detail by its ID
        ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

        if (serviceDetail == null) {
            return "redirect:/manager/serviceDetails"; // Redirect if service detail not found
        }

        // Load the currently assigned construction staff member for this service detail
        List<Staff> constructionStaff = new ArrayList<>();
        if (serviceDetail.getStaff() != null) {
            constructionStaff.add(serviceDetail.getStaff());
        }

        // Total number of staff that match the search term (or all staff)
        long totalStaff;

        // Fetch available construction staff based on search term or just fetch all
        List<Staff> availableStaff;
        List<String> departments = new ArrayList<>();
        departments.add("construction");

        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            availableStaff = staffService.getAllStaffSortedForServiceDetail(serviceDetailId, currentPage, size, departments);
            totalStaff = staffService.countTotalStaffByDepartmentsForServiceDetail(serviceDetailId, departments);
        } else {
            availableStaff = staffService.searchStaffByNameSortedForProject(searchTerm.trim(), serviceDetailId, currentPage, size, departments);
            totalStaff = staffService.countTotalStaffByDepartmentsSearchForServiceDetail(searchTerm.trim(), serviceDetailId, departments);
        }

        // Calculate total number of pages for pagination
        int totalPage = (int) Math.ceil((double) totalStaff / size);

        // Add data to the model
        model.addAttribute("serviceDetail", serviceDetail);
        model.addAttribute("constructionStaff", constructionStaff);
        model.addAttribute("availableStaff", availableStaff);
        model.addAttribute("searchTerm", searchTerm);
        model.addAttribute("totalPage", totalPage==0?1:totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("size", size);

        return "manager/service/serviceAssignStaff"; // JSP page to show the available staff for assignment
    }



    // Handle staff assignment to a service detail
    @PostMapping("/manager/serviceDetails/assignStaff")
    public String assignConstructionStaff(
            @RequestParam("staffId") int staffId,
            @RequestParam("serviceDetailId") int serviceDetailId,
            Model model) {

        try {
            Staff staff = staffService.getStaffById(staffId);
            ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

            if (serviceDetail != null && staff != null) {
                serviceDetail.setStaff(staff); // Assign staff to service detail
                if (serviceDetail.getServiceDetailStatus() == 1) {
                    serviceDetail.setServiceDetailStatus(2); // Set status to Processing (2)
                }
                serviceDetailService.updateServiceDetail(serviceDetail); // Update service detail
                return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;
            } else {
                model.addAttribute("errorMessage", "Invalid Service Detail or Staff.");
                return "manager/service/assignConstructionStaff"; // Return to the assignment page if error occurs
            }

        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error assigning staff: " + e.getMessage());
            return "manager/service/assignConstructionStaff"; // Return to the assignment page if error occurs
        }
    }

    // Handle removal of staff from a service detail
    @PostMapping("/manager/serviceDetails/deleteStaff")
    public String removeConstructionStaff(
            @RequestParam("staffId") int staffId,
            @RequestParam("serviceDetailId") int serviceDetailId,
            Model model) {

        try {
            ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

            // Validate that the service detail and staff assignment exist
            if (serviceDetail != null && serviceDetail.getStaff() != null && serviceDetail.getStaff().getId() == staffId) {
                serviceDetail.setStaff(null); // Remove staff
                if (serviceDetail.getServiceDetailStatus() == 2) {
                    serviceDetail.setServiceDetailStatus(1); // Set status to Processing (2)
                }
                serviceDetailService.updateServiceDetail(serviceDetail); // Update service detail
            } else {
                throw new IllegalArgumentException("Staff not assigned to this service detail.");
            }

            return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;

        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error removing staff: " + e.getMessage());
            return "manager/service/serviceAssignStaff"; // Return to the assignment page if error occurs
        }
    }

    // Handle status change for a service detail
    @PostMapping("/manager/serviceDetails/changeStatus")
    @ResponseBody
    public ResponseEntity<String> changeServiceDetailStatus(
            @RequestParam("serviceDetailId") int serviceDetailId,
            @RequestParam("newStatus") int newStatus) {

        try {
            ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);
            if (serviceDetail != null) {
                serviceDetail.setServiceDetailStatus(newStatus); // Update status
                serviceDetailService.updateServiceDetail(serviceDetail); // Save updated status
                return ResponseEntity.ok("Service detail status updated successfully.");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Service Detail not found.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating status: " + e.getMessage());
        }
    }
    @PostMapping("/manager/serviceDetails/assignStaffAjax")
    @ResponseBody
    public ResponseEntity<Staff> assignConstructionStaffAjax(
            @RequestParam("staffId") int staffId,
            @RequestParam("serviceDetailId") int serviceDetailId) {

        try {
            Staff staff = staffService.getStaffById(staffId);
            ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

            if (serviceDetail != null && staff != null) {
                serviceDetail.setStaff(staff); // Assign staff to service detail
                serviceDetailService.updateServiceDetail(serviceDetail); // Update service detail
                return ResponseEntity.ok(staff); // Return staff data as a JSON response
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    @GetMapping("/customer/serviceDetails/")
    public String serviceDetailListCustomer(
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "1") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String sortType) {

        Customer customer = (Customer) session.getAttribute("user");

        // Redirect to login page if the customer is not logged in
        if (customer == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Please login.");
            return "redirect:/login";
        }

        // Fetch paginated and sorted service details for the customer
        List<ServiceDetail> serviceDetailList = serviceDetailService.getPaginationServiceDetailListByCustomerId(
                customer.getId(), page, size, sortBy, sortType);
        long serviceDetailNum = serviceDetailService.countServiceDetailsByCustomerId(customer.getId());
        System.out.println("VAI CACHUONG" +serviceDetailNum);

        // Calculate total number of pages
        long totalPage = (long) Math.ceil((double) serviceDetailNum / size);

        // Ensure the current page is within valid range
        if (page > totalPage) {
            page = (int) totalPage;
        } else if (page < 1) {
            page = 1;

        }
        page = Math.max(page, 1);

        // Add attributes to the model for rendering in the view
        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceDetailsList", serviceDetailList);
        System.out.println("Hello:" + (totalPage*10));

        return "/customer/serviceDetail/serviceDetailPage"; // Path to your JSP page for customer service details
    }

}
