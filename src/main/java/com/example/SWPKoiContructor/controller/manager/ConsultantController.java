/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.services.ConsultantService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author HP
 */
@Controller
@RequestMapping("/manager/consultant")
public class ConsultantController {
    
    private ConsultantService consultantService;

    public ConsultantController(ConsultantService consultantService) {
        this.consultantService = consultantService;
    }

    
    @GetMapping("")
    public String getConsultantList(Model model){
        List<Consultant> list = consultantService.getConsultantList();
        model.addAttribute("consultants",list);
        return "manager/consultant/consultantManage";
    }
}
