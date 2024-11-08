package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.*;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DesignController {

    private FileUtility fileUtility;
    private DesignService designService;
    private DesignStageService designStageService;
    private BluePrintService bluePrintService;
    private DesignStageDetailService designStageDetailService;
    private CommentService commentService;
    private PaymentHistoryService paymentHistoryService;

    private NotificationService notificationService;

    public DesignController(DesignService designService, DesignStageService designStageService, BluePrintService bluePrintService, DesignStageDetailService designStageDetailService, CommentService commentService, FileUtility fileUtility, PaymentHistoryService paymentHistoryService, NotificationService notificationService) {
        this.designService = designService;
        this.designStageService = designStageService;
        this.bluePrintService = bluePrintService;
        this.designStageDetailService = designStageDetailService;
        this.commentService = commentService;
        this.fileUtility = fileUtility;
        this.paymentHistoryService = paymentHistoryService;
        this.notificationService = notificationService;
    }

    @GetMapping("/manager/design")
    public String getListDesignWithCustomerName(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName) {
        int totalPage = designService.getTotalOfAllDesigns(size, statusFilter, searchName);
        if (page > totalPage) {
            page = 0;
        }
        List<Design> list = designService.getListDesignWithSortedAndPaginated(page, size, statusFilter, searchName);

        model.addAttribute("designList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPage);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);
        return "manager/design/designManage";
    }

    @GetMapping("/manager/design/detail/{id}")
    public String viewDetailDetail(Model model, @PathVariable("id") int id) {
        Design design = designService.getDesignById(id);
        if (design != null) {
            model.addAttribute("design", design);
            return "manager/design/designDetail";
        } else {
            return "redirect:/error/error-403";
        }

    }

    @PostMapping("/manager/updatePayment")
    public String completePayment(@RequestParam(required = false) Integer detailId,
            @RequestParam(required = false) Integer newStatus,
            @RequestParam int designStageId,
            @RequestParam int designId,
            RedirectAttributes redirectAttributes) {

        if (detailId == null || newStatus == null) {
            redirectAttributes.addFlashAttribute("error", "Missing required parameters.");
            return "redirect:/manager/design/detail/" + designId;
        }

        DesignStageDetail updatedDetail = designStageDetailService.getDesignStageDetailById(detailId);
        if (updatedDetail.getStatus() == 4) {
            return "redirect:/manager/design/detail/" + designId;
        }
        if (updatedDetail.getStatus() == newStatus) {
            redirectAttributes.addFlashAttribute("info", "Status is already up-to-date.");
            return "redirect:/manager/design/detail/" + designId;
        }

        updatedDetail = designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);

        if (newStatus == 4) {
            try {
                Customer customer = updatedDetail.getDesignStage().getDesign().getProject().getContract().getCustomer();
                BigDecimal amount = BigDecimal.valueOf(updatedDetail.getDesignStage().getDesignStagePrice());

                PaymentHistory paymentHistory = new PaymentHistory(
                        customer,
                        amount,
                        "Manual",
                        "Payment for " + updatedDetail.getDesignStage().getDesignStageName() + " of " + customer.getName()
                );
                notificationService.createNotification(designId, "design", customer.getId(), "customer", "We have noticed your payment. Aligator Godzillamatsu");
                paymentHistoryService.createPayment(paymentHistory);

            } catch (Exception e) {
                redirectAttributes.addFlashAttribute("error", "Failed to record payment: " + e.getMessage());
            }
        } else if (newStatus == 2) {
            Customer customer = updatedDetail.getDesignStage().getDesign().getProject().getContract().getCustomer();
            notificationService.createNotification(designId, "design", customer.getId(), "customer", "You are required to pay for design stage");
        }
        redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        return "redirect:/manager/design/detail/" + designId;
    }
//=========================Designer Controller====================================//

    @GetMapping("/designer/manage")
    public String listContractsByDesigner(Model model,
            HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        int totalPages = designService.getTotalPagesByDesigner(user.getId(), size, statusFilter, searchName);
        if (page > totalPages) {
            page = 0;
        }
        List<Design> designs = designService.getSortedAndPaginatedByDesigner(user.getId(), page, size, statusFilter, searchName);

        model.addAttribute("designs", designs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);
        return "designer/designerManage";
    }

    @GetMapping("/designer/project/detail/{id}")
    public String designProject(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(id);
        boolean isAssignedToDesign = designService.isAssignedToDesign(id, user.getId());
        if (design == null || !isAssignedToDesign) {
            return "redirect:/error/error-403";
        }

        Project project = design.getProject();
        Contract contract = project.getContract();
        Quotes quote = contract.getQuote();
        Customer customer = project.getContract().getCustomer();
        model.addAttribute("desgin", design);
        model.addAttribute("customer", customer);
        model.addAttribute("project", project);
        model.addAttribute("quote", quote);
        return "designer/projectDetail";
    }

    @GetMapping("/designer/design/detail/{designId}")
    public String designDetail(@PathVariable("designId") int designId, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(designId);

        boolean isAssignedToDesign = designService.isAssignedToDesign(designId, user.getId());
        if (design == null || !isAssignedToDesign) {
            return "redirect:/error/error-403";
        }

        Project project = design.getProject();
        model.addAttribute("design", design);
        model.addAttribute("project", project);
        Customer customer = project.getContract().getCustomer();
        List<DesignStage> designStages = designStageService.getDesignStageByDesignId(designId);
        model.addAttribute("designStages", designStages);
        model.addAttribute("designId", designId);
        model.addAttribute("customer", customer);
        return "designer/designDetail";
    }

//=========================Designer design Blue Prints=================================//
    //View BluePrint, uploads image and update sumary file.
    @GetMapping("/designer/manage/blueprint/{designStageId}")
    public String manageBlueprint(@PathVariable("designStageId") int designStageId,
            Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        DesignStage designStage = designStageService.getDesignStageById(designStageId);
        if (designStage == null) {
            return "redirect:/error/error-500";
        }
        boolean isAssignedToDesign = designStage.getDesign().getStaff().stream().anyMatch(
                staff -> staff.getId() == user.getId());

        if (!isAssignedToDesign) {
            return "redirect:/error/error-403";
        }

        List<BluePrint> allBlueprints = bluePrintService.findByDesignStageId(designStageId);
        model.addAttribute("allBlueprints", allBlueprints);

        List<BluePrint> feedbackBlueprints = bluePrintService.findByDesignStageIdWithComments(designStageId);
        model.addAttribute("feedbackBlueprints", feedbackBlueprints);

        model.addAttribute("designStage", designStage);

        return "designer/manageBlueprint";
    }

    @PostMapping("/designer/blueprint/upload")
    public String uploadBlueprint(
            @RequestParam("designStageId") int designStageId,
            @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {

        DesignStage designStage = designStageService.getDesignStageById(designStageId);

        String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.DESIGN_BLUEPRINT_DIR);

        if (uploadedFilePath == null) {
            redirectAttributes.addFlashAttribute("error", "Choose file to uploads!");
            return "redirect:/designer/manage/blueprint/" + designStageId;
        }
        BluePrint blueprint = new BluePrint();
        blueprint.setDesignStage(designStage);
        blueprint.setBluePrintStatus(1);
        blueprint.setImgUrl(uploadedFilePath);
        blueprint.setDateCreate(new Date());

        Design design = designStage.getDesign();
        bluePrintService.saveBluePrint(blueprint);
        Customer customer = design.getProject().getContract().getCustomer();
        int customerId = designService.getCustomerIdByDesignId(design.getDesignId());
        System.out.println("VAI CA CHUONG" + customerId);
        notificationService.createNotification(design.getDesignId(),
                "design",
                customerId,
                "customer",
                "You are required to pay for design stage");
        System.out.println("VAI CA L ANH THONG");
        redirectAttributes.addFlashAttribute("success", "Upload Successfully!");
        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

    @PostMapping("/updateSummary/")
    public String updateSummaryFile(
            @RequestParam("designStageId") int designStageId,
            @RequestParam("file") MultipartFile file,
            RedirectAttributes redirectAttributes) {
        DesignStage designStage = designStageService.getDesignStageById(designStageId);

        // Handle file upload
        String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.DESIGN_SUM_DIR);

        // Update the design stage with the new summary file path
        designStage.setSummaryFile(uploadedFilePath);
        designStageService.updateDesignStage(designStage);
        redirectAttributes.addFlashAttribute("success", "Upload Success!!");
        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

    @PostMapping("/delete/blueprint")
    public String deleteBlueprint(
            @RequestParam("bluePrintId") int bluePrintId,
            @RequestParam("designStageId") int designStageId, RedirectAttributes redirectAttributes) {
        // Delete the blueprint file and its record from the database
        BluePrint bluePrint = bluePrintService.getBluePrintById(bluePrintId);
        fileUtility.deleteFile(bluePrint.getImgUrl(), FileUtility.DESIGN_BLUEPRINT_DIR);
        bluePrintService.deleteBluePrint(bluePrintId);
        redirectAttributes.addFlashAttribute("success", "Delete Success!!");
        return "redirect:/designer/manage/blueprint/" + designStageId;
    }
//========================================End Design BluePrints=================================//

//===============================Update Status Design Detail=====================================//
    //update stage of design detail page
    @GetMapping("/designer/updateStatus/designStage/{designStageId}")
    public String listDesignStageDetails(@PathVariable("designStageId") int designStageId,
            Model model, @RequestParam int designId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(designId);
        if (design == null) {
            return "redirect:/error/error-403";
        }

        boolean isAssignedToDesign = designService.isAssignedToDesign(designId, user.getId());

        if (!isAssignedToDesign) {
            return "redirect:/error/error-403";
        }

        List<DesignStageDetail> details = designStageDetailService.getDesignStageDetailOfDesignStageId(designStageId);
        if (details == null || details.isEmpty()) {
            return "redirect:/error/error-403";
        }

        model.addAttribute("designId", designId);
        model.addAttribute("details", details);
        model.addAttribute("designStageId", designStageId);
        return "designer/completeTask";
    }

    @PostMapping("/designStageDetail/updateStatus")
    public String updateStatus(@RequestParam(required = false) int detailId,
            @RequestParam(required = false) int newStatus,
            @RequestParam int designStageId,
            @RequestParam int designId,
            RedirectAttributes redirectAttributes) {

        DesignStageDetail detail = designStageDetailService.getDesignStageDetailById(detailId);
        if (detail.getStatus() == newStatus || detail.getStatus() > newStatus) {
            redirectAttributes.addFlashAttribute("info", "No update needed as status is already up-to-date.");
            return "redirect:/designer/updateStatus/designStage/" + designStageId + "?designId=" + designId;
        }

        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            if (newStatus == 2 && "Editing".equalsIgnoreCase(detail.getName())) {
                Customer customer = detail.getDesignStage().getDesign().getProject().getContract().getCustomer();
                notificationService.createNotification(designId, "design", customer.getId(), "customer", "You can check your blueprint now!");
            }
            redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }

        return "redirect:/designer/updateStatus/designStage/" + designStageId + "?designId=" + designId;
    }

//===============================End Update Status Design Detail=====================================//
//====================================End for Designer======================================
    @GetMapping("/customer/design/detail/{id}")
    public String customerViewDesign(@PathVariable("id") int id, Model model,
            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(id);
        if (design != null) {
            Project project = design.getProject();

            Customer customer = project.getContract().getCustomer();
            if (customer == null || customer.getId() != user.getId()) {
                return "redirect:/error/error-403";
            }

            Contract contract = project.getContract();
            Quotes quote = contract.getQuote();
            model.addAttribute("design", design);
            model.addAttribute("project", project);
            model.addAttribute("quote", quote);
            List<DesignStage> designStages = designStageService.getDesignStageByDesignId(id);
            model.addAttribute("designStages", designStages);

            return "customer/design/processOfDesign";
        } else {
            return "redirect:/customer/projects/";
        }

    }

    @PostMapping("/customer/designStageDetail/updateStatus/")
    public String approveDesign(@RequestParam(required = false) Integer detailId,
            @RequestParam(required = false) Integer newStatus,
            @RequestParam int designStageId,
            @RequestParam int designId,
            RedirectAttributes redirectAttributes) {

        if (detailId == null || newStatus == null) {
            redirectAttributes.addFlashAttribute("error", "Missing required parameters.");
            return "redirect:/customer/design/detail/" + designId;
        }

        DesignStageDetail detail = designStageDetailService.getDesignStageDetailById(detailId);
        if (detail.getStatus() == newStatus) {
            redirectAttributes.addFlashAttribute("info", "Status is already up-to-date.");
            return "redirect:/customer/design/detail/" + designId;
        }

        List<BluePrint> blueprints = bluePrintService.findByDesignStageId(designStageId);

        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            for (BluePrint blueprint : blueprints) {
                blueprint.setBluePrintStatus(3);  // Assuming 3 is the status indicating 'approved' or similar
                bluePrintService.saveBluePrint(blueprint);
            }
            redirectAttributes.addFlashAttribute("success", "Status and blueprints updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }
        return "redirect:/customer/design/detail/" + designId;
    }

    @GetMapping("/customer/project/design/blueprint/{designStageId}")
    public String viewBlueprint(
            @PathVariable("designStageId") int designStageId, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        // Get the design stage details
        DesignStage designStage = designStageService.getDesignStageById(designStageId);
        Design design = designStage.getDesign();
        Project project = design.getProject();

        Customer customer = project.getContract().getCustomer();
        if (customer == null || customer.getId() != user.getId()) {
            return "redirect:/error/error-403";
        }

        model.addAttribute("designStage", designStage);
        // Fetch existing blueprints for this stage
        List<BluePrint> blueprints = bluePrintService.findByDesignStageId(designStageId);
        model.addAttribute("blueprints", blueprints);

        return "customer/design/viewBlueprint";
    }

    @PostMapping("/feedback/send/")
    public String submitFeedback(
            @RequestParam("feedback") String feedbackContent,
            @RequestParam("designStageId") int designStageId,
            @RequestParam(value = "blueprintsId", required = false) List<Integer> blueprintsId, // Lấy danh sách các bluePrint đã chọn
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            redirectAttributes.addFlashAttribute("message", "Please login to submit feedback.");
            return "redirect:/login";
        }

        if (blueprintsId == null || blueprintsId.isEmpty()) {
            redirectAttributes.addFlashAttribute("error", "Please choose image to submit feedback.");
            return "redirect:/customer/project/design/blueprint/" + designStageId;

        }

        for (Integer bluePrintId : blueprintsId) {
            BluePrint bluePrint = bluePrintService.getBluePrintById(bluePrintId);
            bluePrint.setBluePrintStatus(2);
            // Tạo comment cho mỗi bluePrint
            Comment blueprintComment = new Comment();
            blueprintComment.setCommentContent(feedbackContent);
            blueprintComment.setBluePrint(bluePrint);
            blueprintComment.setCustomer(customer);
            blueprintComment.setDatePost(Calendar.getInstance());
            // Lưu comment cho các blueprint đã chọn
            commentService.saveComment(blueprintComment);
        }
        redirectAttributes.addFlashAttribute("success", "Feedback has been submitted successfully!");
        return "redirect:/customer/project/design/blueprint/" + designStageId;
    }

}
