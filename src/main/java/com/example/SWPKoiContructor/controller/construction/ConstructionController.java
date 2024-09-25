/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.construction;

import com.example.SWPKoiContructor.entities.Construction;
import com.example.SWPKoiContructor.services.ConstructionService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author nasaf
 */
@Controller
public class ConstructionController {
    
    private FileUtility fileUlibity;
    private ConstructionService ConstructionService;
    private StaffService staffService;
    //private ConstructionStageService ConstructionStageService;
    //private ConstructionStageDetailService ConstructionStageDetailService;

    public ConstructionController(ConstructionService ConstructionService, StaffService staffService) {
        this.ConstructionService = ConstructionService;
        this.staffService = staffService;
        fileUlibity = new FileUtility();
        
    }
    @GetMapping("/manager/construction")
    public String getListConstructionByCusName(Model model){
        List<Object[]> list = ConstructionService.getListConstructionByCustomerName();
        model.addAttribute("CONSTRUCTIONLIST", list);
        return "manager/construction/constructionManage";
    }
}
