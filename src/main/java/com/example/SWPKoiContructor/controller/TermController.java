/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Term;
import com.example.SWPKoiContructor.services.TermService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */

@Controller
public class TermController {
    
    private TermService termService;

    public TermController(TermService termService) {
        this.termService = termService;
    }
    
    
    
    @GetMapping("/manager/terms")
    public String listTerms(Model model,
                            @RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "8") int size,
                            @RequestParam(defaultValue = "termId") String sortBy,
                            @RequestParam(defaultValue = "asc") String sortDirection,
                            @RequestParam(required = false) Integer statusFilter,
                            @RequestParam(required = false) String searchDescription) {

        List<Term> terms;
        long totalTerms;

        // If search query is provided, perform a search based on description
        if (searchDescription != null && !searchDescription.isEmpty()) {
            terms = termService.searchTermsByDescription(searchDescription, page, size, sortBy, sortDirection);
            totalTerms = termService.countTermsByDescription(searchDescription);
        } 
        // If a status filter is applied
        else if (statusFilter != null) {
            terms = termService.findTermsByStatus(statusFilter, page, size, sortBy, sortDirection);
            totalTerms = termService.countTermsByStatus(statusFilter);
        } 
        // Default case, list all terms
        else {
            terms = termService.findAllTerms(page, size, sortBy, sortDirection);
            totalTerms = termService.countAllTerms();
        }

        int totalPages = (int) Math.ceil((double) totalTerms / size);

        // Add attributes to the model for JSP rendering
        model.addAttribute("terms", terms);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("statusFilter", statusFilter);
        model.addAttribute("searchDescription", searchDescription);

        return "manager/term/termManage";  // JSP page to display the term list
    }
    
    @GetMapping("/manager/term/detail/{id}")
    public String viewTermDetails(@PathVariable("id") int termId, Model model) {
        Term term = termService.getTermById(termId);  // Assuming you have a method to find Term by ID
        if (term != null){
            model.addAttribute("term", term);
        return "manager/term/termDetail";  // Redirect to the termDetail.jsp page
        }else{
            return "redirect:/manager/terms";
        }
        
    }
}
