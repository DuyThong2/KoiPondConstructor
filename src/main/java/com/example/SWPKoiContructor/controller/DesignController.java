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

    public DesignController(DesignService designService, DesignStageService designStageService, BluePrintService bluePrintService, DesignStageDetailService designStageDetailService, CommentService commentService,FileUtility fileUtility) {
        this.designService = designService;
        this.designStageService = designStageService;
        this.bluePrintService = bluePrintService;
        this.designStageDetailService = designStageDetailService;
        this.commentService = commentService;
        this.fileUtility = fileUtility;
    }

    @GetMapping("/manager/design")
    public String getListDesignWithCustomerName(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size,
            @RequestParam(required = false) Integer statusFilter, 
            @RequestParam(required = false) String searchName) {

        List<Design> list = designService.getListDesignWithSortedAndPaginated(page, size, statusFilter, searchName);
        int totalPage = designService.getTotalOfAllDesigns(size, statusFilter, searchName);

        model.addAttribute("designList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPage);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);
        return "manager/design/designManage";
    }

    @GetMapping("/manager/design/viewDetail/{id}")
    public String viewDetailDetail(Model model, @PathVariable("id") int id) {
        Design design = designService.getDesignById(id);
        if(design != null){
            model.addAttribute("design", design);
            return "manager/design/designDetail";
        }else{
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
            @RequestParam(defaultValue = "2") int size,
            @RequestParam(required = false) Integer statusFilter,
            @RequestParam(required = false) String searchName) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        List<Design> designs = designService.getSortedAndPaginatedByDesigner(user.getId(), page, size, statusFilter, searchName);
        int totalPages = designService.getTotalPagesByDesigner(user.getId(), size, statusFilter, searchName);

        model.addAttribute("designs", designs);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);
        return "designer/designerManage";
    }

    @GetMapping("/designer/manage/viewDetail/{id}")
    public String designProject(@PathVariable("id") int id, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null)
            return "redirect:/login";

        Design design = designService.getDesignById(id);
        boolean isAssignedToDesign = designService.isAssignedToDesign(id, user.getId());
        if (design == null || !isAssignedToDesign)
            return "redirect:/error/error-403";

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

    @GetMapping("/designer/design/{designId}")
    public String designDetail(@PathVariable("designId") int designId, Model model,
            HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        Design design = designService.getDesignById(designId);

        boolean isAssignedToDesign = designService.isAssignedToDesign(designId, user.getId());
        if (design == null || !isAssignedToDesign)
            return "redirect:/error/error-403";

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
        if (user == null)
            return "redirect:/login";

        DesignStage designStage = designStageService.getDesignStageById(designStageId);
        boolean isAssignedToDesign = designStage.getDesign().getStaff().stream().anyMatch(
                staff -> staff.getId() == user.getId());

        if (!isAssignedToDesign)
            return "redirect:/error/error-403";

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

        if(uploadedFilePath == null){
            redirectAttributes.addFlashAttribute("error", "Choose file to uploads!");
            return "redirect:/designer/manage/blueprint/" + designStageId;
        }
        BluePrint blueprint = new BluePrint();
        blueprint.setDesignStage(designStage);
        blueprint.setBluePrintStatus(1);
        blueprint.setImgUrl(uploadedFilePath);
        blueprint.setDateCreate(new Date());

        bluePrintService.saveBluePrint(blueprint);
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
        if (user == null)
            return "redirect:/login";

        Design design = designService.getDesignById(designId);
        if (design == null)
            return "redirect:/error/error-403";

        boolean isAssignedToDesign  = designService.isAssignedToDesign(designId, user.getId());

        if (!isAssignedToDesign)
            return "redirect:/error/error-403";

        List<DesignStageDetail> details = designStageDetailService.getDesignStageDetailOfDesignStageId(designStageId);
        if (details == null || details.isEmpty())
            return "redirect:/error/error-403";

        model.addAttribute("designId", designId);
        model.addAttribute("details", details);
        model.addAttribute("designStageId", designStageId);
        return "designer/completeTask";
    }

    @PostMapping("/designStageDetail/updateStatus")
    public String updateStatus(@RequestParam(required = false) int detailId,
                               @RequestParam(required = false) int newStatus,
                               @RequestParam int designStageId, @RequestParam int designId,
                               RedirectAttributes redirectAttributes) {

        DesignStageDetail detail = designStageDetailService.getDesignStageDetailById(detailId);
        if(detail.getStatus() == newStatus || detail.getStatus() > newStatus) {
            redirectAttributes.addFlashAttribute("error", "Progress is also updated!");
            return "redirect:/designer/updateStatus/designStage/" + designStageId + "?designId=" + designId;
        }

        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            redirectAttributes.addFlashAttribute("success", "Status updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update status!!");
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
        if (design != null){
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
        }else{
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
            return "redirect:/customer/project/design/" + designId;
        }

        List<BluePrint> blueprints = bluePrintService.findByDesignStageId(designStageId);

        try {
            designStageDetailService.updateDesignStageDetailStatus(detailId, newStatus);
            for (BluePrint blueprint : blueprints) {
                blueprint.setBluePrintStatus(3);
                bluePrintService.saveBluePrint(blueprint);
            }
            redirectAttributes.addFlashAttribute("success", "Updated successfully!");
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

        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            redirectAttributes.addFlashAttribute("message", "Please login to submit feedback.");
            return "redirect:/login";
        }
        if(blueprintsId == null || blueprintsId.isEmpty()){
            redirectAttributes.addFlashAttribute("error", "Please login to submit feedback.");
            return "redirect:/error/error-403";
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
