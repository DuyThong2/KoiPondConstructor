package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dao.ServiceDAO;
import com.example.SWPKoiContructor.entities.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ServiceController {

    @Autowired
    private ServiceDAO serviceDAO;

    @GetMapping("/manager/services")
    public String serviceList(
            Model model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "serviceName") String sortBy,
            @RequestParam(defaultValue = "asc") String sortType,
            @RequestParam(required = false) Boolean statusFilter) {

        List<Service> list;
        long serviceNum;

        if (statusFilter != null) {
            list = serviceDAO.getPaginationServiceListByStatus(page, size, sortBy, sortType, statusFilter);
            serviceNum = serviceDAO.countServiceFilter(statusFilter);
        } else {
            list = serviceDAO.getPaginationServiceList(page, size, sortBy, sortType);
            serviceNum = serviceDAO.countServices();
        }

        long totalPage = (long) Math.ceil(serviceNum / (double) size);
        page = Math.max(page, 1);

        model.addAttribute("currentPage", page);
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortType", sortType);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("serviceList", list);
        model.addAttribute("statusFilter", statusFilter);

        return "manager/service/serviceManage"; // Path to your JSP page for services list
    }
}
