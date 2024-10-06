package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.BluePrint;
import com.example.SWPKoiContructor.entities.Comment;
import com.example.SWPKoiContructor.entities.Contract;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.DesignStageDetail;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Quotes;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.DesignService;
import com.example.SWPKoiContructor.services.DesignStageDetailService;
import com.example.SWPKoiContructor.services.DesignStageService;
import com.example.SWPKoiContructor.services.BluePrintService;
import com.example.SWPKoiContructor.services.CommentService;
import com.example.SWPKoiContructor.utils.FileUtility;
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

    public DesignController(DesignService designService, DesignStageService designStageService, BluePrintService bluePrintService, DesignStageDetailService designStageDetailService, CommentService commentService) {
        this.designService = designService;
        this.designStageService = designStageService;
        this.bluePrintService = bluePrintService;
        this.designStageDetailService = designStageDetailService;
        this.commentService = commentService;
        fileUtility = new FileUtility();
    }

    @GetMapping("/manager/design")
    public String getListDesignWithCustomerName(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size) {
        List<Design> list = designService.getListDesignWithSortedAndPaginated(page, size);
        int totalPage = designService.getTotalOfAllDesigns(size);

        model.addAttribute("designList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPage);
        return "manager/design/designManage";
    }

    @GetMapping("/manager/design/viewDetail/{id}")
    public String viewDetailDetail(Model model, @PathVariable("id") int id) {
        Design design = designService.getDesignById(id);
        model.addAttribute("design", design);
        return "manager/design/designDetail";
    }

    @PostMapping("/manager/completePayment/")
    public String completePayment(@RequestParam(required = false) Integer detailId,
            @RequestParam(required = false) Integer newStatus,
            @RequestParam int designStageId,
            @RequestParam int designId,
            RedirectAttributes redirectAttributes) {

        if (detailId == null || newStatus == null) {
            redirectAttributes.addFlashAttribute("error", "Missing required parameters.");
            return "redirect:/manager/design/viewDetail/" + designId;
        }
        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }
        return "redirect:/manager/design/viewDetail/" + designId;
    }
//=========================Designer Controller====================================//

    @GetMapping("/designer/manage")
    public String listContractsByDesigner(Model model,
            HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "6") int size) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<Design> designs = designService.getSortedAndPaginatedByDesigner(user.getId(), page, size);
        int totalPages = designService.getTotalPagesByDesigner(user.getId(), size);

        model.addAttribute("designs", designs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "designer/designerManage";
    }

    @GetMapping("/designer/manage/viewDetail/{id}")
    public String designProject(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(id);
        boolean isAssignedToDesign = designService.isAssignedToDesign(id, user.getId());
        if (design == null || !isAssignedToDesign) {
            redirectAttributes.addFlashAttribute("errorMessage", "You do not have permission to access this project.");
            return "redirect:/error/error-403"; // Điều hướng đến trang lỗi
        }

        Project project = design.getProject();
        Contract contract = project.getContract();
        Quotes quote = contract.getQuote();
        Customer customer = project.getContract().getCustomer();
        model.addAttribute("desgin", design);
        model.addAttribute("customer", customer);
        model.addAttribute("project", project);
        model.addAttribute("quote", quote);
        return "designer/designProject";
    }

    @GetMapping("/designer/design/{id}")
    public String designDetail(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(id);

        boolean isAssignedToDesign = designService.isAssignedToDesign(id, user.getId());
        if (design == null || !isAssignedToDesign) {
            redirectAttributes.addFlashAttribute("errorMessage", "You do not have permission to access this project.");
            return "redirect:/error/error-403"; // Điều hướng đến trang lỗi
        }
        Project project = design.getProject();
        model.addAttribute("design", design);
        model.addAttribute("project", project);

        List<DesignStage> designStages = designStageService.getDesignStageByDesignId(id);
        model.addAttribute("designStages", designStages);
        model.addAttribute("designId", id);
        return "designer/designDetail";
    }

//=========================Designer design Blue Prints=================================//
    //View BluePrint, uploads image and update sumary file.
    @GetMapping("/designer/manage/blueprint/{designStageId}")
    public String manageBlueprint(@PathVariable("designStageId") int designStageId,
            Model model, HttpSession session, RedirectAttributes redirectAttributes) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        DesignStage designStage = designStageService.getDesignStageById(designStageId);
        boolean isAssignedToDesign = designStage.getDesign().getStaff().stream().anyMatch(
                staff -> staff.getId() == user.getId());

        if (!isAssignedToDesign) {
            redirectAttributes.addFlashAttribute("errorMessage", "You do not have permission to access this project.");
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
            @RequestParam("file") MultipartFile file) {

        DesignStage designStage = designStageService.getDesignStageById(designStageId);

        String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.DESIGN_BLUEPRINT_DIR);

        BluePrint blueprint = new BluePrint();
        blueprint.setDesignStage(designStage);
        blueprint.setBluePrintStatus(1);
        blueprint.setImgUrl(uploadedFilePath);
        blueprint.setDateCreate(new Date());

        bluePrintService.saveBluePrint(blueprint);

        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

    @PostMapping("/updateSummary/")
    public String updateSummaryFile(
            @RequestParam("designStageId") int designStageId,
            @RequestParam("file") MultipartFile file) {
        DesignStage designStage = designStageService.getDesignStageById(designStageId);

        // Handle file upload
        String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.DESIGN_SUM_DIR);

        // Update the design stage with the new summary file path
        designStage.setSummaryFile(uploadedFilePath);
        designStageService.updateDesignStage(designStage);

        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

    @GetMapping("/designer/delete/{bluePrintId}")
    public String deleteBlueprint(
            @PathVariable("bluePrintId") int bluePrintId,
            @RequestParam("designStageId") int designStageId) {
        // Delete the blueprint file and its record from the database
        BluePrint bluePrint = bluePrintService.getBluePrintById(bluePrintId);
        fileUtility.deleteFile(bluePrint.getImgUrl(), FileUtility.DESIGN_BLUEPRINT_DIR);
        bluePrintService.deleteBluePrint(bluePrintId);
        return "redirect:/designer/manage/blueprint/" + designStageId;
    }
//========================================End Design BluePrints=================================//

//===============================Update Status Design Detail=====================================//
    //update stage of design detail page
    @GetMapping("/designer/updateStatus/designStage/{id}")
    public String listDesignStageDetails(@PathVariable int id, Model model, @RequestParam int designId,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // Lấy thông tin thiết kế
        Design design = designService.getDesignById(designId);
        if (design == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Design not found.");
            return "redirect:/error/error-403";
        }

        // Kiểm tra xem user có phải là một trong các nhân viên của thiết kế không
        boolean isAssignedToDesign = design.getStaff().stream()
                .anyMatch(staff -> staff.getId() == user.getId());

        // Nếu người dùng không được gán vào thiết kế này, chuyển hướng đến trang lỗi
        if (!isAssignedToDesign) {
            redirectAttributes.addFlashAttribute("error", "You do not have permission to access this design stage.");
            return "redirect:/error/error-403";
        }

        // Lấy thông tin chi tiết giai đoạn thiết kế
        List<DesignStageDetail> details = designStageDetailService.getDesignStageDetailOfDesignStageId(id);
        if (details == null || details.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Design stage details not found.");
            return "redirect:/error/error-403";
        }

        model.addAttribute("designId", designId);
        model.addAttribute("details", details);
        model.addAttribute("id", id);
        return "designer/completeTask";
    }

    @PostMapping("/designStageDetail/updateStatus")
    public String updateStatus(@RequestParam(required = false) Integer detailId,
            @RequestParam(required = false) Integer newStatus,
            @RequestParam int designStageId,
            @RequestParam int designId,
            RedirectAttributes redirectAttributes) {
        if (detailId == null || newStatus == null) {
            redirectAttributes.addFlashAttribute("error", "Missing required parameters.");
            return "redirect:/updateStatus/designStage/" + designStageId + "?designId=" + designId;
        }
        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }
        return "redirect:/designer/updateStatus/designStage/" + designStageId + "?designId=" + designId;
    }
//===============================End Update Status Design Detail=====================================//

//====================================End for Designer======================================
    @GetMapping("/customer/project/design/{id}")
    public String customerViewDesign(@PathVariable("id") int id, Model model,
            HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(id);
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
    }

    @PostMapping("/customer/designStageDetail/updateStatus/")
    public String approveDesign(@RequestParam(required = false) Integer detailId,
            @RequestParam(required = false) Integer newStatus,
            @RequestParam int designStageId,
            @RequestParam int designId,
            RedirectAttributes redirectAttributes) {

        if (detailId == null || newStatus == null) {
            redirectAttributes.addFlashAttribute("error", "Missing required parameters.");
            return "redirect:/customer/project/design/" + designId;
        }
        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update status: " + e.getMessage());
        }
        return "redirect:/customer/project/design/" + designId;
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
        // Lấy thông tin user từ session
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            // Nếu chưa đăng nhập, yêu cầu đăng nhập
            redirectAttributes.addFlashAttribute("errorMessage", "Please login to submit feedback.");
            return "redirect:/login";
        }
        // Nếu có bluePrints đã được chọn
        if (blueprintsId != null && !blueprintsId.isEmpty()) {
            for (Integer bluePrintId : blueprintsId) {
                BluePrint bluePrint = bluePrintService.getBluePrintById(bluePrintId);
                // Tạo comment cho mỗi bluePrint
                Comment blueprintComment = new Comment();
                blueprintComment.setCommentContent(feedbackContent);
                blueprintComment.setBluePrint(bluePrint);
                blueprintComment.setCustomer(customer);
                blueprintComment.setDatePost(Calendar.getInstance());
                // Lưu comment cho các blueprint đã chọn
                commentService.saveComment(blueprintComment);
            }
        }
        // Thêm thông báo thành công vào FlashAttributes
        redirectAttributes.addFlashAttribute("successMessage", "Feedback has been submitted successfully!");
        return "redirect:/customer/project/design/blueprint/" + designStageId;
    }

}
