
package com.example.SWPKoiContructor.controller.construction;

import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.services.ConstructionService;
import com.example.SWPKoiContructor.services.ConstructionStageDetailService;
import com.example.SWPKoiContructor.services.ConstructionStageService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ConstructionController {
    
    private FileUtility fileUlibity;
    private ConstructionService ConstructionService;
    private StaffService staffService;
    private ConstructionStageService ConstructionStageService;
    private ConstructionStageDetailService ConstructionStageDetailService;

    public ConstructionController(ConstructionService ConstructionService, StaffService staffService, ConstructionStageService ConstructionStageService, ConstructionStageDetailService ConstructionStageDetailService) {
        this.ConstructionService = ConstructionService;
        this.staffService = staffService;
        this.ConstructionStageService = ConstructionStageService;
        this.ConstructionStageDetailService = ConstructionStageDetailService;
        fileUlibity = new FileUtility();
    }


    
    @GetMapping("/manager/construction")
    public String getListConstructionByCusName(Model model){
        List<Object[]> list = ConstructionService.getListConstructionByCustomerName();
        model.addAttribute("CONSTRUCTIONLIST", list);
        return "manager/construction/constructionManage";
    }
    
    @GetMapping("/manager/construction/view/{id}")
    public String viewConstructionStage(Model model, @PathVariable("id") int id){
        Construction list = ConstructionService.getConstructionById(id);
        model.addAttribute("CONSTRUCTIONSTAGE", list);
        return "manager/construction/constructionDetail";
    }
    
    @GetMapping("/manager/construction/detail/{id}")
    public String viewConstructionStageDetail(Model model, @PathVariable("id")int id){
        Construction detail = ConstructionService.getConstructionById(id);
        model.addAttribute("DETAIL", detail);
        return "manager/construction/constructionStageDetail";
                
    }
}
