package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.entities.ConstructionStage;
import com.example.SWPKoiContructor.entities.ConstructionStageDetail;
import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Quotes;

import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.ConstructionService;
import com.example.SWPKoiContructor.services.ConstructionStageDetailService;
import com.example.SWPKoiContructor.services.ConstructionStageService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ConstructionController {

    
    private ConstructionService constructionService;
    private ConstructionStageService constructionStageService;
    private ConstructionStageDetailService constructionStageDetailService;

    public ConstructionController(ConstructionService constructionService, ConstructionStageService ConstructionStageService, ConstructionStageDetailService ConstructionStageDetailService) {
        this.constructionService = constructionService;
        this.constructionStageService = ConstructionStageService;
        this.constructionStageDetailService = ConstructionStageDetailService;
        
    }

    @GetMapping("/manager/construction")
    public String getListConstructionByCusName(Model model) {
        List<Construction> list = constructionService.getListConstructionByCustomerName();
        model.addAttribute("constructionList", list);
        return "manager/construction/constructionManage";
    }

    @GetMapping("/manager/construction/viewDetail/{id}")
    public String viewConstructionStage(Model model, @PathVariable("id") int id) {
        Construction construction = constructionService.getConstructionById(id);
        if (construction != null) {
            model.addAttribute("construction", construction);
            return "manager/construction/constructionDetail";
        } else {
            return "redirect:/manager/construction";
        }

    }


    @GetMapping("/constructor/manage")
    public String listConstructionsByStaff(Model model, HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "1") int size) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // Get paginated and sorted list of constructions by staffId
        List<Construction> constructions = constructionService.getSortedAndPaginatedByStaff(user.getId(), page, size);
        int totalPages = constructionService.getTotalPagesByStaff(user.getId(), size);

        // Add data to the model to pass to the JSP
        model.addAttribute("constructions", constructions);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "constructor/constructionManage"; // Return the view for managing constructions
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

        // Check if the current user is assigned to the construction project
        boolean isAssignedToConstruction = construction.getConstructionStaffs().stream()
                .anyMatch(constructionStaff -> constructionStaff.getStaff().getId() == user.getId());

        if (!isAssignedToConstruction) {
            redirectAttributes.addFlashAttribute("errorMessage", "You do not have permission to access this project.");
            return "redirect:/error/error-403"; // Redirect to error page
        }

        // Fetch the project associated with the construction
        Project project = construction.getProject();
        model.addAttribute("construction", construction);
        model.addAttribute("project", project);

        // Fetch the construction stages related to the construction project
        List<ConstructionStage> constructionStages = constructionStageService.getListConstructionStage(id);
        model.addAttribute("constructionStages", constructionStages);
        model.addAttribute("constructionId", id);

        return "constructor/constructionDetail"; // Return the view for construction details
    }

    @GetMapping("/updateStatus/constructionStage/{id}")
    public String listConstructionStageDetails(@PathVariable int id, Model model, @RequestParam int constructionId,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // Fetch construction by constructionId
        Construction construction = constructionService.getConstructionById(constructionId);

        // Check if the user is assigned to the construction project
        boolean isAssignedToConstruction = construction.getConstructionStaffs().stream()
                .anyMatch(constructionStaff -> constructionStaff.getStaff().getId() == user.getId());

        if (!isAssignedToConstruction) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to access this construction stage.");
            return "redirect:/error/error-403";
        }

        // Fetch the construction stage details by constructionStageId
        List<ConstructionStageDetail> details = constructionStageDetailService.getConstructionStageDetailByStageId(id);

        // Add attributes to the model to render in the JSP
        model.addAttribute("constructionId", constructionId);
        model.addAttribute("details", details);
        model.addAttribute("id", id);  // constructionStageId

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
            return "redirect:/updateStatus/constructionStage/" + constructionStageId + "?constructionId=" + constructionId;
        }
        try {
            // Update the construction stage detail status
            constructionStageDetailService.updateConstructionStageDetailStatus(detailId, newStatus);
            redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }

        // Redirect back to the construction stage details page
        return "redirect:/updateStatus/constructionStage/" + constructionStageId + "?constructionId=" + constructionId;
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
            redirectAttributes.addFlashAttribute("errorMessage", "You do not have permission to access this project.");
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
        Project project = construction.getProject();

        Customer customer = project.getContract().getCustomer();
        if (customer == null || customer.getId() != user.getId()) {
            return "redirect:/error/error-403";
        }

        Contract contract = project.getContract();
        Quotes quote = contract.getQuote();
        model.addAttribute("construction", construction);
        model.addAttribute("project", project);
        model.addAttribute("quote", quote);
        List<ConstructionStage> designStages = constructionStageService.getListConstructionStage(id);
        model.addAttribute("constructionStages", designStages);

        return "customer/construction/processOfConstruction";
    }

}
