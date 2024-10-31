/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Parcel;
import com.example.SWPKoiContructor.services.ParcelService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author HP
 */
@Controller
public class ParcelController {

    private ParcelService parcelService;

    public ParcelController(ParcelService parcelService) {
        this.parcelService = parcelService;
    }

    //-------------------------------------------- PARCEL MANAGE ------------------------------------
    @GetMapping("/manager/parcel")
    public String getParcelList(Model model,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "2") int size,
            @RequestParam(defaultValue = "packageId") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Integer statusFilter) {
        List<Parcel> parcelList;
        long totalParcel;

        parcelList = parcelService.viewParcelListOrderSort(page, size, sortBy, sortDirection);
        totalParcel = parcelService.countParcel();

        int totalPages = (int) Math.ceil((double) totalParcel / size);
        if(page > totalPages){
            page = 0;
        }
        model.addAttribute("parcelList", parcelList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        return "manager/parcel/parcelManage";
    }

    @GetMapping("/manager/parcel/create")
    public String createParcel(Model model) {
        Parcel parcel = new Parcel();
        model.addAttribute("newParcel", parcel);
        return "manager/parcel/parcelCreate";
    }

    @PostMapping("/manager/parcel/save")
    public String saveParcel(@ModelAttribute("newParcel") Parcel newParcel, Model model) {
        newParcel.setPackage_status(true);
        parcelService.saveParcel(newParcel);
        return "redirect:/manager/parcel";
    }

    @GetMapping("/manager/parcel/update/{id}")
    public String updateParcel(@PathVariable("id") int parcelId, Model model) {
        Parcel parcel = parcelService.getParcelById(parcelId);
        if (parcel != null) {
            model.addAttribute("newParcel", parcel);
            return "manager/parcel/parcelUpdate";
        } else {
            return "redirect:/manager/parcel";
        }

    }

    @PostMapping("/manager/parcel/update")
    public String updateParcel(@ModelAttribute("newParcel") Parcel newParcel, Model model) {
        parcelService.saveParcel(newParcel);
        return "redirect:/manager/parcel";
    }

}
