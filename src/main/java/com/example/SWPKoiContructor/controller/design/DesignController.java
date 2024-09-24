package com.example.SWPKoiContructor.controller.design;

import com.example.SWPKoiContructor.entities.BluePrint;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.entities.DesignStage;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.DesignService;
import com.example.SWPKoiContructor.services.DesignStageDetailService;
import com.example.SWPKoiContructor.services.DesignStageService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.services.BluePrintService;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class DesignController {

    @Autowired
    private FileUtility fileUtility;

    @Autowired
    private DesignService designService;

    @Autowired
    private StaffService staffService;

    @Autowired
    private DesignStageService designStageService;

    @Autowired
    private DesignStageDetailService designStageDetailService;

    @Autowired
    private BluePrintService bluePrintService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CustomerService customerService;

    public DesignController(DesignService designService, StaffService staffService, DesignStageService designStageService, DesignStageDetailService designStageDetailService, BluePrintService bluePrintService, ProjectService projectService, CustomerService customerService) {
        this.designService = designService;
        this.staffService = staffService;
        this.designStageService = designStageService;
        this.designStageDetailService = designStageDetailService;
        this.bluePrintService = bluePrintService;
        this.projectService = projectService;
        this.customerService = customerService;
        fileUtility = new FileUtility();
    }

    @GetMapping("/manager/design")
    public String getListDesignWithCustomerName(Model model) {
        List<Object[]> list = designService.getListDesignWithCustomerName();
        model.addAttribute("designList", list);
        return "manager/design/designManage";
    }

    @GetMapping("/manager/design/viewDetail/{id}")
    public String viewDetailDetail(Model model, @PathVariable("id") int id) {
        Design design = designService.getDesignById(id);
        model.addAttribute("design", design);
        return "manager/design/designDetail";
    }

    @GetMapping("/designer/task")
    public String listContractsByDesigner(Model model,
            HttpSession session,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "8") int size) {
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

    @GetMapping("/designer/viewDetail/{id}")
    public String designDetail(@PathVariable("id") int id, Model model) {
        Design design = designService.getDesignById(id);
        Project project = design.getProject();
        Customer customer = project.getContract().getCustomer();
        model.addAttribute("desgin", design);
        model.addAttribute("customer", customer);
        model.addAttribute("project", project);
        return "designer/designProject";
    }

    @GetMapping("/designer/design/{id}")
    public String designProject(@PathVariable("id") int id, Model model) {
        Design design = designService.getDesignById(id);
        Project project = design.getProject();
        model.addAttribute("design", design);
        model.addAttribute("project", project);

        List<DesignStage> designStages = designStageService.getDesignStageByDesignId(id);
        model.addAttribute("designStages", designStages);

        return "designer/designDetail";
    }

    @GetMapping("/designer/design/stage")
    public String viewDesignStage(
            @RequestParam("designId") int designId,
            @RequestParam("stageName") String stageName,
            Model model) {

        Design design = designService.getDesignById(designId);
        model.addAttribute("design", design);
        model.addAttribute("project", design.getProject());

        List<DesignStage> designStages = designStageService.getDesignStageByDesignIdAndName(designId, stageName);
        model.addAttribute("designStages", designStages);
        model.addAttribute("currentStageName", stageName);

        return "designer/designStageDetail";
    }

    @GetMapping("/designer/manage/blueprint/{designStageId}")
    public String manageBlueprint(
            @PathVariable("designStageId") int designStageId,
            Model model) {
        // Get the design stage details
        DesignStage designStage = designStageService.getDesignStageById(designStageId);
        model.addAttribute("designStage", designStage);
        // Fetch existing blueprints for this stage
        List<BluePrint> blueprints = bluePrintService.findByDesignStageId(designStageId);
        model.addAttribute("blueprints", blueprints);

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
        blueprint.setImgUrl("/" + uploadedFilePath); 
        blueprint.setDateCreate(new Date());

        bluePrintService.saveBluePrint(blueprint);

        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

    
    @PostMapping("/updateSummary")
    public String updateSummaryFile(
            @RequestParam("designStageId") int designStageId,
            @RequestParam("file") MultipartFile file) {
        DesignStage designStage = designStageService.getDesignStageById(designStageId);

        // Handle file upload
        String uploadedFilePath = fileUtility.handleFileUpload(file, FileUtility.DESIGN_SUM_DIR);

        // Update the design stage with the new summary file path
        designStage.setSummaryFile("/" + uploadedFilePath);
        designStageService.updateDesignStage(designStage);

        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

    
    @GetMapping("/delete/{bluePrintId}")
    public String deleteBlueprint(
            @PathVariable("bluePrintId") int bluePrintId,
            @RequestParam("designStageId") int designStageId) {
        // Delete the blueprint file and its record from the database
        BluePrint bluePrint = bluePrintService.getBluePrintById(bluePrintId);
        fileUtility.deleteFile(bluePrint.getImgUrl(), FileUtility.DESIGN_BLUEPRINT_DIR);
        bluePrintService.deleteBluePrint(bluePrintId);

        return "redirect:/designer/manage/blueprint/" + designStageId;
    }

}
