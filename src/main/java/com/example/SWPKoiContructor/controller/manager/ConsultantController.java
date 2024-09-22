/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.manager;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.ConsultantService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author HP
 */
@Controller
public class ConsultantController {
    
    private ConsultantService consultantService;
    private StaffService staffService;

    public ConsultantController(ConsultantService consultantService, StaffService staffService) {
        this.consultantService = consultantService;
        this.staffService = staffService;
    }

    
    //MANAGER SITE 
    @GetMapping("/manager/consultant")
    public String getConsultantList(Model model){
        List<Consultant> list = consultantService.getConsultantList();
        model.addAttribute("consultants",list);
        return "manager/consultant/consultantManage";
    }
    
    @GetMapping("/manager/consultant/viewConsultantStaffList/{id}")
    public String getConsultantStaffList(@PathVariable("id")int id,Model model){
        List<Staff> list = staffService.getStaffListByRole("Consultant");
        model.addAttribute("consultantStaffList",list);
        model.addAttribute("consultant", consultantService.getConsultantById(id));
        return "manager/consultant/addConsultantStaff";
    }
    
    @PostMapping("/manager/consultant/viewConsultantStaffList/editConsultantStaff")
    public String updateConsultantStaff(@RequestParam("id")int id, @RequestParam("staffId")int staffId,Model model){
        Staff consultantStaff = staffService.getStaffById(staffId);
        Consultant consultant = consultantService.updateConsultantStaff(id, consultantStaff);
        return "redirect:/manager/consultant/viewConsultantStaffList/" + id;
    }
    
    
    
    
    //CONSULTANT SITE
    @GetMapping("/consultant/viewConsultantList")
    public String getConsultantListByStaffId(Model model){
        List<Consultant> list = consultantService.getConsultantListByStaffId(3);
        model.addAttribute("consultantList", list);
        return "consultant/consultantManage";
    }
    
}
