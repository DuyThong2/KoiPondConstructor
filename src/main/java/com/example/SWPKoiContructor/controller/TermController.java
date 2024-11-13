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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "description") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) Boolean termStatusFilter, // Now using termStatus
            @RequestParam(required = false) String searchDescription) {

        List<Term> terms;
        long totalTerms;
        int totalPages;

        if (searchDescription != null && !searchDescription.isEmpty()) {
            totalTerms = termService.countTermsByDescription(searchDescription, termStatusFilter);
            totalPages = (int) Math.ceil((double) totalTerms / size);
            if (page > totalPages) {
                page = 0;
            }
            terms = termService.searchTermsByDescription(searchDescription, page, size, sortBy, sortDirection, termStatusFilter);

        } else {
            totalTerms = termService.countAllTerms(termStatusFilter);
            totalPages = (int) Math.ceil((double) totalTerms / size);
            if (page > totalPages) {
                page = 0;
            }
            terms = termService.findAllTerms(page, size, sortBy, sortDirection, termStatusFilter);

        }

        model.addAttribute("terms", terms);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("termStatusFilter", termStatusFilter);  // Adjusting filter name
        model.addAttribute("searchDescription", searchDescription);

        return "manager/term/termManage";
    }

    @PostMapping("/manager/term/updateStatus/{termId}")
    public String updateTermStatus(@PathVariable int termId,
            @RequestParam("termStatus") boolean termStatus,
            RedirectAttributes redirectAttributes) {
        try {
            termService.updateTermStatus(termId, termStatus);
            redirectAttributes.addFlashAttribute("successMessage", "Term status updated successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating term status.");
        }

        return "redirect:/manager/terms";  // Redirect back to the term list after the update
    }

    @GetMapping("/manager/termCreate")
    public String showTermForm(Model model) {
        // Create an empty Term object to bind the form data
        model.addAttribute("term", new Term());
        return "manager/term/insertTerm"; // This is the view name of your JSP (term-form.jsp)
    }

    @PostMapping("/manager/termCreate")
    public String submitTermForm(@ModelAttribute("term") Term term, Model model) {
        term.setFollowContract(false);
        term.setTermStatus(true);
        term.setIsTemplate(true);
        termService.save(term);
        model.addAttribute("savedTerm", term); // Redirect to a success page or show success message
        return "redirect:/manager/terms";// Make sure you have a corresponding success page (term-success.jsp)
    }

    @GetMapping("/manager/updateTerm/{id}")
    public String updateTermForm(Model model, @PathVariable("id") int termId) {
        Term term = termService.findTermById(termId);
        if (term != null) {
            model.addAttribute("term", term);

            return "manager/term/termUpdate";

        } else {
            return "redirect:/manager/terms";// Make sure you have a corresponding success page (term-success.jsp)
        }// Add the saved Term object to the model

    }

    @PostMapping("/manager/updateTerm")
    public String updateTerm(@ModelAttribute("term") Term term, Model model) {

        term.setFollowContract(false);
        term.setTermStatus(true);
        term.setIsTemplate(true);

        // Save the Term object to the database
        termService.save(term);

        // Add the saved Term object to the model
        model.addAttribute("savedTerm", term);

        // Redirect to a success page or show success message
        return "redirect:/manager/terms";// Make sure you have a corresponding success page (term-success.jsp)
    }
}
