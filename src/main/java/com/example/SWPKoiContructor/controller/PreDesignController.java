/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Content;
import com.example.SWPKoiContructor.entities.PreDesign;
import com.example.SWPKoiContructor.services.PreDesignService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.io.File;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author HP
 */
@Controller
public class PreDesignController {
    
    private PreDesignService preDesignService;
    private FileUtility fileUtility;

    public PreDesignController(PreDesignService preDesignService, FileUtility fileUtility) {
        this.preDesignService = preDesignService;
        this.fileUtility = fileUtility;
    }
        
    @GetMapping("/manager/preDesign")
    public String getFilteredPreDesignList(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "9") int size,
            @RequestParam(defaultValue = "preDesignId") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Boolean statusFilter,
            @RequestParam(required = false) String searchName){
        
        List<PreDesign> preDesignList;
        long totalPreDesign;
        
        if(statusFilter != null || searchName != null){
            preDesignList = preDesignService.getFilteredPredesignList(page, size, sortBy, sortDirection, statusFilter, searchName);
            totalPreDesign = preDesignService.countFilteredPredesignList(statusFilter, searchName);
        }else{
            preDesignList = preDesignService.getPreDesignList(page, size, sortBy, sortDirection);
            totalPreDesign = preDesignService.countPreDesignList();
        }
        
        int totalPages = (int) Math.ceil((double) totalPreDesign / size);
        
        model.addAttribute("preDesign", preDesignList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchName", searchName);
        return "manager/preDesign/preDesignManage";
    }
    
    @GetMapping("/manager/preDesign/detail/{id}")
    public String getDetailPreDesign(@PathVariable("id")int preDesignId, Model model){
        PreDesign preDesign = preDesignService.getPredesignById(preDesignId);
        model.addAttribute("preDesign", preDesign);
        return "/manager/preDesign/preDesignDetail";
    }
    
    @GetMapping("/manager/preDesign/create")
    public String createNewPreDesign(Model model){
        PreDesign preDesign = new PreDesign();
        model.addAttribute("preDesign", preDesign);
        return "manager/preDesign/preDesignCreate";
    }
    
    @GetMapping("/manager/preDesign/update/{id}")
    public String updatePreDesign(@PathVariable("id")int preDesignId,Model model){
        PreDesign preDesign = preDesignService.getPredesignById(preDesignId);
        model.addAttribute("preDesign", preDesign);
        return "manager/preDesign/preDesignUpdate";
    }
    
    @PostMapping("/manager/preDesign/save")
    public String saveNewPreDesign(@ModelAttribute("preDesign")PreDesign preDesign,
            @RequestParam("file")MultipartFile file,
            @RequestParam("content")String content,
            Model model){
        preDesign.setPreDesignStatus(true);
        Content newContent = new Content(content);
        preDesign.addContent(newContent);
        String imgURL = fileUtility.handleFileUpload(file, FileUtility.BLOG_DIR);
        preDesign.setPreDesignImgUrl(imgURL);
        preDesignService.createNewPreDesign(preDesign);
        return "redirect:/manager/preDesign";
    }    
    
    @PostMapping("/manager/preDesign/saveUpdate")
    public String updateBlog(@ModelAttribute PreDesign preDesign,
            @RequestParam("file") MultipartFile file,
            @RequestParam("content") String content, // Get the content from the form
            Model model) {
        try {
            PreDesign originPreDesign = preDesignService.getPredesignById(preDesign.getPreDesignId());
            if (originPreDesign != null) {
                originPreDesign.setPreDesignName(preDesign.getPreDesignName());
                originPreDesign.setPreDesignDescription(preDesign.getPreDesignDescription());
                originPreDesign.setPreDesignStatus(preDesign.isPreDesignStatus());
                String imgURL = fileUtility.handleFileUpload(file, FileUtility.BLOG_DIR);
                if (imgURL != null) {
                    originPreDesign.setPreDesignImgUrl(imgURL);
                }

                Content contentUpdated = originPreDesign.getContent();
                contentUpdated.setContent(content);
                contentUpdated.setLastUpdatedDate(new java.util.Date());
                preDesignService.updatePreDesign(originPreDesign);
                return "redirect:/manager/preDesign/detail/" + originPreDesign.getPreDesignId();
            } else {
                return "redirect:/manager/preDesign";
            }

            // Redirect to the blog list page after creation
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/manager/preDesign";
        }
    }
    
}