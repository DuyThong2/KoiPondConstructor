/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Content;
import com.example.SWPKoiContructor.entities.Parcel;
import com.example.SWPKoiContructor.entities.PreDesign;
import com.example.SWPKoiContructor.services.ParcelService;
import com.example.SWPKoiContructor.services.PreDesignService;
import com.example.SWPKoiContructor.utils.FileUtility;
import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private ParcelService parcelService;
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
            @RequestParam(required = false) String searchName) {

        List<PreDesign> preDesignList;
        long totalPreDesign;
        int totalPages = 0;

        if (statusFilter != null || searchName != null) {
            totalPreDesign = preDesignService.countFilteredPredesignList(statusFilter, searchName);
            totalPages = (int) Math.ceil((double) totalPreDesign / size);
            if (page > totalPages) {
                page = 0;
            }
            preDesignList = preDesignService.getFilteredPredesignList(page, size, sortBy, sortDirection, statusFilter, searchName);

        } else {
            totalPreDesign = preDesignService.countPreDesignList();
            totalPages = (int) Math.ceil((double) totalPreDesign / size);
            if (page > totalPages) {
                page = 0;
            }
            preDesignList = preDesignService.getPreDesignList(page, size, sortBy, sortDirection);
        }

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
    public String getDetailPreDesign(@PathVariable("id") int preDesignId, Model model) {
        PreDesign preDesign = preDesignService.getPredesignById(preDesignId);
        if(preDesign != null){
            model.addAttribute("preDesign", preDesign);
            return "/manager/preDesign/preDesignDetail";
        }
        return "redirect:/manager/preDesign";
    }
    
    @PostMapping("/manager/preDesign/updateStatus")
    public String updateStatus(@RequestParam("id")int preDesignId,
                            @RequestParam("status")boolean status,
                            Model model){
        PreDesign preDesign = preDesignService.updatePreDesignStatus(preDesignId, status );
        return "redirect:/manager/preDesign/detail/" + preDesignId;
    }

    @GetMapping("/manager/preDesign/create")
    public String createNewPreDesign(Model model) {
        PreDesign preDesign = new PreDesign();
        List<Parcel> parcels = parcelService.viewParcelActiveList();
        model.addAttribute("preDesign", preDesign);
        model.addAttribute("parcelList", parcels);
        return "manager/preDesign/preDesignCreate";
    }

    @GetMapping("/manager/preDesign/update/{id}")
    public String updatePreDesign(@PathVariable("id") int preDesignId, Model model) {
        PreDesign preDesign = preDesignService.getPredesignById(preDesignId);
        List<Parcel> parcels = parcelService.viewParcelActiveList();
        model.addAttribute("preDesign", preDesign);
        model.addAttribute("parcelList", parcels);
        return "manager/preDesign/preDesignUpdate";
    }

    @PostMapping("/manager/preDesign/save")
    public String saveNewPreDesign(@ModelAttribute("preDesign") PreDesign preDesign,
            @RequestParam("file") MultipartFile file,
            @RequestParam("content") String content,
            Model model) {
        try {
            preDesign.setPreDesignStatus(true);
            Content newContent = new Content(content);
            preDesign.addContent(newContent);
            String imgURL = fileUtility.handleFileUpload(file, FileUtility.BLOG_DIR);
            preDesign.setPreDesignImgUrl(imgURL);
            preDesignService.createNewPreDesign(preDesign);
            return "redirect:/manager/preDesign";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error uploading image");

            // Return the blog form with existing data to allow the user to correct input
            model.addAttribute("preDesign", preDesign);
            return "manager/preDesign/preDesignCreate";
        }
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
                originPreDesign.setParcel(preDesign.getParcel());
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
