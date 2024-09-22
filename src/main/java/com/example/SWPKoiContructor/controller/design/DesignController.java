package com.example.SWPKoiContructor.controller.design;

import com.example.SWPKoiContructor.entities.BluePrint;
import com.example.SWPKoiContructor.entities.Design;
import com.example.SWPKoiContructor.services.DesignService;
import com.example.SWPKoiContructor.services.DesignStageDetailService;
import com.example.SWPKoiContructor.services.DesignStageService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.services.BluePrintService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class DesignController {

    private FileUtility fileUtility;
    private DesignService designService;
    private StaffService staffService;
    private DesignStageService designStageService;
    private DesignStageDetailService designStageDetailService;
    private BluePrintService bluePrintService;

    public DesignController(DesignService designService, StaffService staffService, DesignStageService designStageService, DesignStageDetailService designStageDetailService, BluePrintService bluePrintService) {
        this.designService = designService;
        this.staffService = staffService;
        this.designStageService = designStageService;
        this.designStageDetailService = designStageDetailService;
        this.bluePrintService = bluePrintService;
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
        model.addAttribute("designDetails", design);
        return "manager/design/designDetail";
    }

}
