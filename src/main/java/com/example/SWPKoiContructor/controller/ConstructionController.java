package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.*;

import com.example.SWPKoiContructor.services.*;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpSession;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ConstructionController {

    private final CommentService commentService;
    private ConstructionService constructionService;
    private ConstructionStageService constructionStageService;
    private ConstructionStageDetailService constructionStageDetailService;
    private DesignService designService;
    private PaymentHistoryService paymentHistoryService;
    private ServiceDetailService serviceDetailService;

    public ConstructionController(PaymentHistoryService paymentHistoryService, DesignService designService, ConstructionService constructionService, ConstructionStageService ConstructionStageService, ConstructionStageDetailService ConstructionStageDetailService, CommentService commentService, ServiceDetailService serviceDetailService) {
        this.designService = designService;
        this.constructionService = constructionService;
        this.constructionStageService = ConstructionStageService;
        this.constructionStageDetailService = ConstructionStageDetailService;
        this.commentService = commentService;
        this.serviceDetailService = serviceDetailService;
        this.paymentHistoryService = paymentHistoryService;
    }

    @GetMapping("/manager/construction")
    public String getListConstructionByCusName(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName) {
        // Fetch all constructions with optional filters
        int totalPages = constructionService.getTotalPages(null, size, statusFilter, searchName);

        if (page > totalPages) {
            page = 0;
        }
        List<Construction> list = constructionService.getListConstruction(null, page, size, statusFilter, searchName);
        
        model.addAttribute("constructionList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);

        return "manager/construction/constructionManage";
    }

    @GetMapping("/constructor/manage")
    public String listConstructionsByStaff(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        int totalPages = constructionService.getTotalPages(user.getId(), size, statusFilter, searchName);
        if (page > totalPages) {
            page = 0;
        }
        // Fetch constructions filtered by the logged-in user's ID, status, and search name
        List<Construction> constructions = constructionService.getListConstruction(user.getId(), page, size, statusFilter, searchName);
        
        model.addAttribute("constructions", constructions);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);

        return "constructor/constructionManage";
    }

    @GetMapping("/manager/construction/viewDetail/{id}")
    public String viewConstructionStage(Model model, @PathVariable("id") int id) {
        Construction construction = constructionService.getConstructionById(id);

        if (construction != null) {
            // Filter raw construction stages and complete construction stages
            List<ConstructionStage> list = constructionStageService.getListConstructionStage(id);
            List<ConstructionStage> rawConstructionStages = list.stream()
                    .filter(stage -> stage.getConstructionStageName().toLowerCase().contains("raw"))
                    .collect(Collectors.toList());

            List<ConstructionStage> completeConstructionStages = list.stream()
                    .filter(stage -> stage.getConstructionStageName().toLowerCase().contains("complete"))
                    .collect(Collectors.toList());

            // Check if raw construction is completed
            boolean isRawConstructionCompleted = rawConstructionStages.stream()
                    .allMatch(stage -> stage.getConstructionStageStatus() == 4); // 4 means 'Completed'

            // Add construction details to the model
            model.addAttribute("construction", construction);
            model.addAttribute("rawConstructionStages", rawConstructionStages);
            model.addAttribute("completeConstructionStages", completeConstructionStages);
            model.addAttribute("isRawConstructionCompleted", isRawConstructionCompleted);

            // Add the project associated with the construction
            model.addAttribute("project", construction.getProject());

            return "manager/construction/constructionDetail";
        } else {
            return "redirect:/manager/construction";
        }
    }

    @GetMapping("/constructor/construction/{id}")
    public String constructionDetail(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // Fetch the construction project by ID
        Construction construction = constructionService.getConstructionById(id);
        if (construction != null) {
            boolean isAssignedToConstruction = construction.getConstructionStaffs().stream()
                    .anyMatch(constructionStaff -> constructionStaff.getStaff().getId() == user.getId());

            if (!isAssignedToConstruction) {
                redirectAttributes.addFlashAttribute("error", "You do not have permission to access this project.");
                return "redirect:/error/error-403"; // Redirect to error page
            }

            List<Comment> comments = commentService.getCommentByConstructionId(id);
            model.addAttribute("comments", comments);

            // Fetch the project associated with the construction
            Project project = construction.getProject();
            model.addAttribute("construction", construction);
            model.addAttribute("project", project);

            // Fetch the construction stages related to the construction project
            List<ConstructionStage> constructionStages = constructionStageService.getListConstructionStage(id);
            model.addAttribute("constructionStages", constructionStages);
            model.addAttribute("constructionId", id);

            return "constructor/constructionDetail";
        } else {
            return "/constructor/manage";
        }

    }

    @GetMapping("/staff/updateStatus/constructionStage/{id}")
    public String listConstructionStageDetails(@PathVariable int id, Model model, @RequestParam int constructionId,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getAuthority().getAuthority().equalsIgnoreCase("ROLE_MANAGER")) {
            return "redirect:/manager/construction/viewDetail/" + constructionId;
        }

        // Fetch the construction stage details by constructionStageId
        List<ConstructionStageDetail> details = constructionStageDetailService.getConstructionStageDetailByStageId(id);
        if (details != null) {
            model.addAttribute("constructionId", constructionId);
            model.addAttribute("details", details);
            model.addAttribute("id", id);  // constructionStageId
        }
        // Add attributes to the model to render in the JSP

        return "constructor/constructionCompleteTask";  // Adjust the view to your construction task view

    }

    @PostMapping("/constructionStageDetail/updateStatus")
    public String updateStatus(@RequestParam(required = false) Integer detailId,
            @RequestParam(required = false) Integer newStatus,
            @RequestParam int constructionStageId,
            @RequestParam int constructionId,
            RedirectAttributes redirectAttributes) {
        if (detailId == null || newStatus == null) {
            redirectAttributes.addFlashAttribute("error", "Missing required parameters.");
            return "redirect:/staff/updateStatus/constructionStage/" + constructionStageId + "?constructionId=" + constructionId;
        }

        try {
            // Update the construction stage detail status
            ConstructionStageDetail updatedDetail = constructionStageDetailService.updateConstructionStageDetailStatus(detailId, newStatus);
            System.out.println("here asdddddddddddddddddd");
            // Check if the updated detail is related to a payment and the new status is set to 4 (Completed)
            if (updatedDetail != null
                    && "Payment".equalsIgnoreCase(updatedDetail.getConstructionStageDetailName())
                    && newStatus == 4) {
                System.out.println("got it inside !!!!!!!!!!!!!!!!1");
                // Step 1: Retrieve the Project ID from the constructionId
                Customer customer = updatedDetail.getConstructionStage().getConstruction().getProject().getContract().getCustomer();
                BigDecimal amount = BigDecimal.valueOf(updatedDetail.getConstructionStage().getConstructionStagePrice());
                // Step 4: Create a new PaymentHistory record using the streamlined constructor
                PaymentHistory paymentHistory = new PaymentHistory(
                        customer,
                        amount, // Replace with the actual amount from the detail
                        "Manual", // Indicate that this payment is manual or any relevant method
                        "Payment for " + updatedDetail.getConstructionStage().getConstructionStageName() + " of " + customer.getName()
                );

                // Save the payment history
                paymentHistoryService.createPayment(paymentHistory);
                redirectAttributes.addFlashAttribute("success", "Status updated and payment recorded successfully!");
            } else {
                redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }

        // Redirect back to the construction stage details page
        return "redirect:/staff/updateStatus/constructionStage/" + constructionStageId + "?constructionId=" + constructionId;
    }

    @GetMapping("/constructor/manage/viewDetail/{id}")
    public String constructionProject(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // Retrieve the construction project by its ID
        Construction construction = constructionService.getConstructionById(id);

        // Check if the current user is part of the construction staff
        boolean isAssignedToConstruction = construction.getConstructionStaffs().stream()
                .anyMatch(staff -> staff.getStaff().getId() == user.getId());

        // If the user is not assigned to the construction, redirect to the error page
        if (!isAssignedToConstruction) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to access this project.");
            return "redirect:/error/error-403"; // Redirect to an error page
        }

        // Retrieve project, contract, quotes, and customer information
        Project project = construction.getProject();
        Contract contract = project.getContract();
        Quotes quote = contract.getQuote();
        Customer customer = contract.getCustomer();

        // Add necessary attributes to the model for the view
        model.addAttribute("construction", construction);
        model.addAttribute("customer", customer);
        model.addAttribute("project", project);
        model.addAttribute("quote", quote);

        return "constructor/constructionProject";
    }

    @GetMapping("/customer/project/construction/{id}")
    public String customerViewConstruction(@PathVariable("id") int id, Model model,
            HttpSession session) {
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        if (user == null) {
            return "redirect:/login";
        }

        Construction construction = constructionService.getConstructionById(id);
        if (construction != null) {
            Project project = construction.getProject();

            Customer customer = project.getContract().getCustomer();
            if (customer == null || customer.getId() != user.getId()) {
                return "redirect:/error/error-403";
            }

            List<Comment> comments = commentService.getCommentByConstructionId(id);
            model.addAttribute("comments", comments);

            Contract contract = project.getContract();
            Quotes quote = contract.getQuote();
            model.addAttribute("construction", construction);
            model.addAttribute("project", project);
            model.addAttribute("quote", quote);
            List<ConstructionStage> designStages = constructionStageService.getListConstructionStage(id);
            model.addAttribute("constructionStages", designStages);

            return "customer/construction/processOfConstruction";
        } else {
            return "redirect:/customer/projects/";
        }

    }

    // Method to approve the inspection stage
    @PostMapping("/customer/approveInspection")
    public String approveInspection(
            @RequestParam("detailId") int constructionStageDetailId,
            @RequestParam("constructionStageId") int constructionStageId,
            @RequestParam("constructionId") int constructionId,
            RedirectAttributes redirectAttributes) {

        try {
            // Approve the inspection stage
            constructionStageDetailService.updateConstructionStageDetailStatus(constructionStageDetailId, 4); // Assuming 4 is 'approved' status
            redirectAttributes.addFlashAttribute("success", "Inspection approved successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to approve inspection: " + e.getMessage());
        }

        // Redirect back to the construction stage details page
        return "redirect:/customer/project/construction/" + constructionId;
    }

    // Method to reject the inspection stage
    @PostMapping("/customer/rejectInspection")
    public String rejectInspection(
            @RequestParam("detailId") int constructionStageDetailId,
            @RequestParam("constructionStageId") int constructionStageId,
            @RequestParam("constructionId") int constructionId,
            RedirectAttributes redirectAttributes) {

        try {
            // Reject the inspection stage
            constructionStageDetailService.updateConstructionStageDetailStatus(constructionStageDetailId, 3); // Assuming 3 is 'rejected' status

            // Optionally reset the previous stage detail to 'processing' status
            ConstructionStageDetail previousDetail = constructionStageDetailService.getPreviousStageDetail(constructionStageId);
            if (previousDetail != null) {
                constructionStageDetailService.updateConstructionStageDetailStatus(previousDetail.getConstructionStageDetailId(), 2); // Assuming 2 is 'processing' status
            }

            redirectAttributes.addFlashAttribute("success", "Inspection rejected and previous stage reset to processing.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to reject inspection: " + e.getMessage());
        }

        // Redirect back to the construction stage details page
        return "redirect:/customer/project/construction/" + constructionId;
    }

    @PostMapping("/customer/feedback/send")
    public String submitFeedbackByCustomer(
            @RequestParam("feedback") String feedbackContent,
            @RequestParam("constructionId") int constructionId,
            HttpSession session, RedirectAttributes redirectAttributes) {

        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            return "redirect:/login";
        }

        Comment comment = new Comment();
        comment.setCommentContent(feedbackContent);
        comment.setCustomer(customer);
        comment.setConstruction(constructionService.getConstructionById(constructionId));
        comment.setDatePost(Calendar.getInstance());

        commentService.saveComment(comment);
        redirectAttributes.addFlashAttribute("success", "Feedback has been submitted successfully!");
        return "redirect:/customer/project/construction/" + constructionId;
    }

    @PostMapping("/customer/feedback/delete")
    public String deleteCommentByCustomer(@RequestParam("commentId") int commentId,
            HttpSession session, RedirectAttributes redirectAttributes) {
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            return "redirect:/login";
        }

        Comment comment = commentService.getCommentById(commentId);

        if (comment == null || comment.getCustomer().getId() != customer.getId()) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to edit this comment.");
            return "redirect:/customer/project/construction/" + comment.getConstruction().getConstructionId();
        }

        commentService.deleteComment(commentId);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully.");
        return "redirect:/customer/project/construction/" + comment.getConstruction().getConstructionId();
    }

    @PostMapping("/customer/feedback/update")
    public String updateCommentByCustomer(@RequestParam("commentId") int commentId,
            @RequestParam("newContent") String commentContent,
            HttpSession session, RedirectAttributes redirectAttributes) {
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            return "redirect:/login";
        }

        Comment comment = commentService.getCommentById(commentId);

        if (comment == null || comment.getCustomer().getId() != customer.getId()) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to edit this comment.");
            return "redirect:/customer/project/construction/" + comment.getConstruction().getConstructionId();
        }

        comment.setCommentContent(commentContent);
        commentService.saveComment(comment);
        redirectAttributes.addFlashAttribute("success", "Comment updated successfully.");
        return "redirect:/customer/project/construction/" + comment.getConstruction().getConstructionId();
    }

    @PostMapping("/staff/feedback/send")
    public String submitFeedbackByStaff(
            @RequestParam("feedback") String feedbackContent,
            @RequestParam("constructionId") int constructionId,
            HttpSession session, RedirectAttributes redirectAttributes) {

        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null) {
            return "redirect:/login";
        }

        Comment comment = new Comment();
        comment.setCommentContent(feedbackContent);
        comment.setStaff(staff);
        comment.setConstruction(constructionService.getConstructionById(constructionId));
        comment.setDatePost(Calendar.getInstance());

        commentService.saveComment(comment);
        redirectAttributes.addFlashAttribute("success", "Feedback has been submitted successfully!");
        return "redirect:/constructor/construction/" + constructionId;
    }

    @PostMapping("/staff/feedback/delete")
    public String deleteCommentByStaff(@RequestParam("commentId") int commentId,
            HttpSession session, RedirectAttributes redirectAttributes) {
        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null) {
            return "redirect:/login";
        }

        Comment comment = commentService.getCommentById(commentId);
        if (comment == null || comment.getStaff().getId() != staff.getId()) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to edit this comment.");
            return "redirect:/customer/project/construction/" + comment.getConstruction().getConstructionId();
        }
        commentService.deleteComment(commentId);
        redirectAttributes.addFlashAttribute("success", "Comment deleted successfully.");
        return "redirect:/constructor/construction/" + comment.getConstruction().getConstructionId();
    }

    @PostMapping("/staff/feedback/update")
    public String updateCommentByStaff(@RequestParam("commentId") int commentId,
            @RequestParam("newContent") String commentContent,
            HttpSession session, RedirectAttributes redirectAttributes) {
        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null) {
            return "redirect:/login";
        }

        Comment comment = commentService.getCommentById(commentId);

        if (comment == null || comment.getStaff().getId() != staff.getId()) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to edit this comment.");
            return "redirect:/customer/project/construction/" + comment.getConstruction().getConstructionId();
        }

        comment.setCommentContent(commentContent);
        commentService.saveComment(comment);
        redirectAttributes.addFlashAttribute("success", "Comment updated successfully.");
        return "redirect:/constructor/construction/" + comment.getConstruction().getConstructionId();
    }

    @GetMapping("/constructor/serviceDetailManage/")
    public String constructionServiceDetailManagePage(
            Model model,
            HttpSession session,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String sortType,
            @RequestParam(required = false) Integer statusFilter) {

        // Retrieve the logged-in staff from session
        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        List<ServiceDetail> serviceDetails;
        long totalServiceDetails;

        // Fetch service details based on whether a status filter is applied
        if (statusFilter != null) {
            serviceDetails = serviceDetailService.getServiceDetailsByStaffIdAndStatus(staff.getId(), page, size, sortBy, sortType, statusFilter);
            totalServiceDetails = serviceDetailService.countServiceDetailsByStaffIdAndStatus(staff.getId(), statusFilter);
        } else {
            serviceDetails = serviceDetailService.getServiceDetailsByStaffId(staff.getId(), page, size, sortBy, sortType);
            totalServiceDetails = serviceDetailService.countServiceDetailsByStaffId(staff.getId());
        }

        long totalPage = (long) Math.ceil(totalServiceDetails / (double) size);
        page = Math.max(page, 1);

        // Add attributes to the model for rendering in the view
        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceDetailsList", serviceDetails);
        model.addAttribute("statusFilter", statusFilter);

        return "constructor/constructionServiceManage"; // JSP page path
    }

    @GetMapping("/constructor/serviceDetail/{serviceDetailId}")
    public String getServiceDetail(
            @PathVariable("serviceDetailId") int serviceDetailId,
            Model model,
            HttpSession session) {

        // Retrieve the service detail by ID
        Staff staff = (Staff) session.getAttribute("user");
        if (staff == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }

        ServiceDetail serviceDetail = serviceDetailService.getServiceDetailById(serviceDetailId);

        // If the service detail is not found, redirect to the service detail management page
        if (serviceDetail == null) {
            return "redirect:/constructor/serviceDetailManage/";
        }
        if (serviceDetail.getStaff().getId() != staff.getId()) {
            return "redirect:/constructor/serviceDetailManage/";
        }

        // Retrieve the related customer information
        Customer customer = serviceDetail.getCustomer();

        // Add attributes to the model to render in the JSP
        model.addAttribute("serviceDetail", serviceDetail);
        model.addAttribute("customer", customer);

        // Retrieve comments/feedback related to the service
//        List<Comment> comments = serviceDetailService.getCommentsByServiceDetailId(serviceDetailId);
//        model.addAttribute("comments", comments);
        return "constructor/constructorServiceDetailInfo"; // Path to the JSP page
    }

    @PostMapping("construction/serviceDetail/update")
    public ResponseEntity<String> updateServiceDetailStatus(@RequestParam("serviceDetailId") int serviceDetailId) {
        try {
            // Attempt to update the service detail status
            ServiceDetail serviceDetail = serviceDetailService.updateServiceDetailStatus(serviceDetailId, 3);  // 3 for "Complete" status

            if (serviceDetail != null) {
                // Return success JSON string wrapped in ResponseEntity with 200 OK
                return ResponseEntity.ok("{\"status\":\"success\"}");
            } else {
                // Return error JSON string with 400 Bad Request status
                return ResponseEntity.badRequest().body("{\"status\":\"error\",\"message\":\"Could not update status\"}");
            }
        } catch (Exception e) {
            // Return error JSON string with 500 Internal Server Error status
            return ResponseEntity.status(500).body("{\"status\":\"error\",\"message\":\"An error occurred\"}");
        }
    }

    @PostMapping("construction/serviceDetail/cancelRequest")
    public ResponseEntity<String> cancelServiceDetailStatus(
            @RequestParam("serviceDetailId") int serviceDetailId,
            @RequestParam("cancelMessage") String cancelMessage) {
        try {
            // Attempt to update the service detail status to 4 (Canceled)
            ServiceDetail serviceDetail = serviceDetailService.updateServiceDetailStatus(serviceDetailId, 4);  // 4 for "Canceled" status

            if (serviceDetail != null) {
                // Optionally, you may want to save the cancellation message
//                serviceDetailService.saveCancellationMessage(serviceDetailId, cancelMessage);

                // Return success JSON string wrapped in ResponseEntity with 200 OK
                return ResponseEntity.ok("{\"status\":\"success\"}");
            } else {
                // Return error JSON string with 400 Bad Request status
                return ResponseEntity.badRequest().body("{\"status\":\"error\",\"message\":\"Could not update status to Canceled\"}");
            }
        } catch (Exception e) {
            // Return error JSON string with 500 Internal Server Error status
            return ResponseEntity.status(500).body("{\"status\":\"error\",\"message\":\"An error occurred during cancellation\"}");
        }
    }

    @GetMapping("/constructor/manage/viewDetail/viewDesign/{projectId}")
    public String manageBlueprint(@PathVariable("projectId") int designStageId,
            Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Design design = designService.getDesignById(designStageId);
        List<DesignStage> designStage = design.getDesignStage();

        model.addAttribute("design", design);
        model.addAttribute("designStage", designStage);

        return "constructor/viewAllDesign";
    }

}
