package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.ServiceDetail;
import com.example.SWPKoiContructor.entities.ServicePrice;
import com.example.SWPKoiContructor.services.ServiceDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ServiceDetailAdminController {

    @Autowired
    private ServiceDetailService serviceDetailService;

    @GetMapping("/manager/serviceDetails")
    public String serviceDetailList(
            Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String sortType,
            @RequestParam(required = false) Integer statusFilter) {

        List<ServiceDetail> list;
        long serviceDetailNum;

        if (statusFilter != null) {
            list = serviceDetailService.getPaginationServiceDetailListByStatus(page, size, sortBy, sortType, statusFilter);
            serviceDetailNum = serviceDetailService.countServiceDetailFilter(statusFilter);
        } else {
            list = serviceDetailService.getPaginationServiceDetailList(page, size, sortBy, sortType);
            serviceDetailNum = serviceDetailService.countServiceDetails();
        }

        long totalPage = (long) Math.ceil(serviceDetailNum / (double) size);
        page = Math.max(page, 1);

        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceDetailsList", list);
        model.addAttribute("statusFilter", statusFilter);

        return "manager/service/serviceCustomerManage"; // Path to your JSP page for service details list
    }

}
