package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Service;
import com.example.SWPKoiContructor.entities.ServiceDetail;
import com.example.SWPKoiContructor.entities.ServicePrice;
import com.example.SWPKoiContructor.entities.ServiceQuotes;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import static java.util.Date.*;

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
    
    @Autowired
    private LoyaltyPointService loyaltyPointService;

    @Autowired
    private NotificationService notificationService;

    // Display list of service details with pagination and optional status filtering
    @GetMapping("/manager/serviceDetails")
    public String serviceDetailListManager(
            Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "serviceDetailStatus") String sortBy,
            @RequestParam(defaultValue = "asc") String sortType,
            @RequestParam(name="statusFilter",required = false) Integer statusFilter,
            @RequestParam(name = "fromDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate getFromDate,
            @RequestParam(name = "endDate", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate getEndDate,
            @RequestParam(name="searchName",required = false) String searchName) {

        List<ServiceDetail> list;
        Date fromDate = (getFromDate != null) ? Date.valueOf(getFromDate) : null;
        Date endDate = (getEndDate != null) ? Date.valueOf(getEndDate) : null;
        long serviceDetailNum;

        // Apply filters if any are provided
        if (statusFilter != null || fromDate != null || endDate != null || searchName != null) {
            list = serviceDetailService.getPaginationServiceDetailListByStatus(page, size, sortBy, sortType, statusFilter, fromDate, endDate, searchName);
            serviceDetailNum = serviceDetailService.countServiceDetailFilter(statusFilter, fromDate, endDate, searchName);
        } else {
            list = serviceDetailService.getPaginationServiceDetailList(page, size, sortBy, sortType);
            serviceDetailNum = serviceDetailService.countServiceDetails();
        }

        long totalPage = (long) Math.ceil(serviceDetailNum / (double) size);
        page = Math.max(page, 1);

        // Format dates for display
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedFromDate = (getFromDate != null) ? getFromDate.format(formatter) : "";
        String formattedEndDate = (getEndDate != null) ? getEndDate.format(formatter) : "";

        // Add attributes to the model for rendering in the view
        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceDetailsList", list);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("fromDate", formattedFromDate);
        model.addAttribute("endDate", formattedEndDate);
        model.addAttribute("searchName", searchName);

        return "manager/service/serviceDetailManage"; // Path to your JSP page for service details list
    }


    // Show detailed information about a specific service detail

    @GetMapping("/manager/serviceDetail/detail/{serviceDetailId}")
    public String showServiceDetail(
            @PathVariable("serviceDetailId") int serviceDetailId, Model model) {
        ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

        if (serviceDetail == null) {
            return "redirect:/manager/serviceDetails"; // Redirect if service detail not found
        }

        // Add attributes to the model for rendering
        model.addAttribute("serviceDetail", serviceDetail);
        model.addAttribute("customer", serviceDetail.getCustomer());
        model.addAttribute("staff", serviceDetail.getStaff());
        model.addAttribute("service", serviceDetail.getService());

        return "manager/service/serviceDetailInfo"; // JSP page to show service detail information
    }

    @PostMapping("/manager/serviceDetails/create")
    public String createNewServiceDetail(@RequestParam("serviceQuoteId") int serviceQuoteId,
                                         @RequestParam("statusId") int statusId, Model model) {
        try {
            ServiceQuotes serviceQuotes = serviceQuoteService.getServiceQuotesById(serviceQuoteId);
            if (serviceQuotes != null) {
                for (Service i : serviceQuotes.getService()) {
                    ServiceDetail newServiceDetail = new ServiceDetail();
                    for(ServicePrice p : i.getServicePrice()){
                        if(p.getService().getServiceId() == i.getServiceId()){
                            double price =(double) p.getValue() * serviceQuotes.getServiceQuotesArea();
                            newServiceDetail.setPrice(price);
                            break;
                        }
                    }
                    newServiceDetail.setServiceQuotes(serviceQuotes);
                    newServiceDetail.setDateRegister(new java.util.Date());
                    newServiceDetail.setServiceDetailStatus(1);
                    newServiceDetail.setService(i);
                    newServiceDetail.setCustomer(serviceQuotes.getCustomer());
                    newServiceDetail = serviceDetailService.createServiceDetail(newServiceDetail);
                    notificationService.createNotification(newServiceDetail.getId(), "serviceDetail",newServiceDetail.getCustomer().getId(),"customer","Your Service Orders has been started! Please check it!");
                }
                    if(serviceQuotes.getServiceQuotesStatus() == 4 && serviceQuotes.isFree()) 
                        loyaltyPointService.useLoyaltyPoints(serviceQuotes.getCustomer(), serviceQuotes.getUsedPoint());
                    serviceQuotes = serviceQuoteService.saveStatusUpdateManager(serviceQuoteId, statusId);
            }
            return "redirect:/manager/serviceDetails";
        } catch (Exception e) {
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


        // Total number of staff that match the search term (or all staff)
        long totalStaff;

        // Fetch available construction staff based on search term or just fetch all
        List<Staff> availableStaff;
        List<String> departments = new ArrayList<>();
        departments.add("construction");

        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            availableStaff = staffService.getAllStaffSortedForServiceDetail(serviceDetailId, currentPage, size,
                    departments);
            totalStaff = staffService.countTotalStaffByDepartmentsForServiceDetail(serviceDetailId, departments);
        } else {
            availableStaff = staffService.searchStaffByNameSortedForProject(searchTerm.trim(), serviceDetailId,
                    currentPage, size, departments);
            totalStaff = staffService.countTotalStaffByDepartmentsSearchForServiceDetail(searchTerm.trim(),
                    serviceDetailId, departments);
        }

        // Calculate total number of pages for pagination
        int totalPage = (int) Math.ceil((double) totalStaff / size);

        // Add data to the model
        model.addAttribute("serviceDetail", serviceDetail);
        model.addAttribute("availableStaff", availableStaff);
        model.addAttribute("searchTerm", searchTerm);
        model.addAttribute("totalPage", totalPage == 0 ? 1 : totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("size", size);

        return "manager/service/serviceAssignStaff"; // JSP page to show the available staff for assignment
    }

    // Handle staff assignment to a service detail
    @PostMapping("/manager/serviceDetails/assignStaff")
    public String assignConstructionStaff(
            @RequestParam("staffId") int staffId,
            @RequestParam("serviceDetailId") int serviceDetailId,
            RedirectAttributes redirectAttributes) {

        try {
            Staff staff = staffService.getStaffById(staffId);
            ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

            if (serviceDetail != null && staff != null) {
                if (serviceDetail.getServiceDetailStatus() == 3 || serviceDetail.getServiceDetailStatus() == 4
                        || serviceDetail.getServiceDetailStatus() == 5) {
                    redirectAttributes.addFlashAttribute("errorMessage", "Can't assign staff to a completed, cancelled, or requesting cancellation service.");
                    return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;
                }
                if (serviceDetail.getStaff() != null) {
                    redirectAttributes.addFlashAttribute("errorMessage", "Staff have already been assigned to this service.");
                    return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;
                }
                serviceDetail.setStaff(staff);
                if (serviceDetail.getServiceDetailStatus() == 1) {
                    serviceDetail.setServiceDetailStatus(2);
                }
                serviceDetailService.updateServiceDetail(serviceDetail);
                notificationService.createNotification(serviceDetailId,"serviceDetail",staffId,"constructor","You have been assigned to new service!");
                redirectAttributes.addFlashAttribute("successMessage", "Staff assigned successfully.");
                return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Invalid Service Detail or Staff.");
                return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;
            }

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error assigning staff: " + e.getMessage());
            return "redirect:/manager/serviceDetails/assign/" + serviceDetailId;
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
            if (serviceDetail != null && serviceDetail.getStaff() != null
                    && serviceDetail.getStaff().getId() == staffId) {
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
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error updating status: " + e.getMessage());
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

    @GetMapping("/customer/serviceDetails")
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
        System.out.println("Hello:" + (totalPage * 10));

        return "/customer/serviceDetail/serviceDetailPage"; // Path to your JSP page for customer service details
    }

    @PostMapping("/construction/serviceDetail/acceptCancelRequest")
    public ResponseEntity<String> acceptCancelRequest(@RequestParam("serviceDetailId") int serviceDetailId) {
        try {
            // Update the service detail status to 5 (Canceled)
            ServiceDetail serviceDetail = serviceDetailService.updateServiceDetailStatus(serviceDetailId, 5); // 5 for
                                                                                                              // "Canceled"

            if (serviceDetail != null) {
                return ResponseEntity.ok("{\"status\":\"success\"}");
            } else {
                return ResponseEntity.badRequest()
                        .body("{\"status\":\"error\",\"message\":\"Could not update status to Canceled\"}");
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body(
                    "{\"status\":\"error\",\"message\":\"An error occurred while accepting the cancellation request\"}");
        }
    }

    @PostMapping("/construction/serviceDetail/denyCancelRequest")
    public ResponseEntity<String> cancelCancelRequest(@RequestParam("serviceDetailId") int serviceDetailId) {
        try {
            ServiceDetail serviceDetail = serviceDetailService.updateServiceDetailStatus(serviceDetailId, 2);
            if (serviceDetail != null) {
                return ResponseEntity.ok("{\"status\":\"success\"}");
            } else {
                return ResponseEntity.badRequest()
                        .body("{\"status\":\"error\",\"message\":\"Could not update status to Canceled\"}");
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body(
                    "{\"status\":\"error\",\"message\":\"An error occurred while accepting the cancellation request\"}");
        }
    }

    @GetMapping("/customer/serviceDetail/detail/{id}")
    public String customerServiceDetailInfo(Model model, @PathVariable("id") int id, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            return "redirect:/login";
        }
        ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(id);
        if (serviceDetail == null || serviceDetail.getCustomer().getId() != customer.getId()) {
            return "redirect:/customer/serviceDetails";
        }
        model.addAttribute("serviceDetail", serviceDetail);

        return "/customer/serviceDetail/serviceDetailInfo";
    }

    @PostMapping("/customer/serviceDetail/feedback")
    public String submitFeedback(
            @RequestParam("serviceDetailId") int serviceDetailId,
            @RequestParam("rating") int rating,
            @RequestParam("feedback") String feedback,
            Model model, RedirectAttributes redirectAttributes) {
        // Fetch the service detail entity by its ID
        ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

        // Update the service detail with feedback and rating
        serviceDetail.setFeedback(feedback);
        serviceDetail.setRating(rating);
        serviceDetail.setFeedbackDate(new java.util.Date()); // Set the current date as feedback date

        // Save the updated service detail
        serviceDetailService.updateServiceDetail(serviceDetail);
        redirectAttributes.addFlashAttribute("success", "You have been sent feedback successfully!");
        // Redirect or load th page where feedback was submitted
        return "redirect:/customer/serviceDetail/detail/" + serviceDetailId;
    }

    @GetMapping("/construction/serviceDetail/getCancelMessage")
    @ResponseBody
    public String getCancelMessage(@RequestParam int serviceDetailId) {
        try {
            ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);
            if (serviceDetail != null && serviceDetail.getServiceCancelMessage() != null) {
                return serviceDetail.getServiceCancelMessage() + "@serviceDetailManage.jsp";
            } else {
                return "No cancellation message found.@serviceDetailManage.jsp";
            }
        } catch (Exception e) {
            return "Error retrieving cancellation message: " + e.getMessage() + "@serviceDetailManage.jsp";
        }
    }

}
