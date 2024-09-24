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
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DesignController {

    private FileUtility fileUtility;
    private DesignService designService;
    private StaffService staffService;
    private DesignStageService designStageService;
    private DesignStageDetailService designStageDetailService;
    private BluePrintService bluePrintService;
    private ProjectService projectService;
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

        // Lấy danh sách thiết kế phân trang
        List<Design> designs = designService.getSortedAndPaginatedByDesigner(user.getId(), page, size);
        int totalPages = designService.getTotalPagesByDesigner(user.getId(), size); // Tổng số trang

        // Đưa dữ liệu vào model để sử dụng trong trang JSP
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
        return "designer/designDetail";
    }

    @GetMapping("/designer/design/{id}")
public String designBluePrint(@PathVariable("id") int id, Model model) {
    Design design = designService.getDesignById(id);
    Project project = design.getProject();
    Customer customer = project.getContract().getCustomer();
    model.addAttribute("design", design);
    model.addAttribute("customer", customer);
    model.addAttribute("project", project);

    // Fetch design stages for the project
    List<DesignStage> ds = designStageService.getDesignStageByDesignId(id);
    model.addAttribute("designStage", ds);
    
    // Determine the current stage based on status
    String currentStage = "conceptual"; // default to conceptual if none are in progress
    for (DesignStage stage : ds) {
        if (stage.getDesignStageStatus() == 1) { // Status 1 is Pending
            currentStage = stage.getDesignStageName().toLowerCase(); // e.g., conceptual, basic, or detail
            break;
        }
    }
    model.addAttribute("currentStage", currentStage);
    
    return "designer/designProject";
}

}
