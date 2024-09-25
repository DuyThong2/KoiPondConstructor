/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.services.CustomerService;
import javax.validation.Valid;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Admin
 */
@Controller
public class HomeController {
    
    private CustomerService customerService;

    public HomeController(CustomerService customerService) {
        this.customerService = customerService;
    }
    
    

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

//    @GetMapping("/showRegistrationForm")
//    public String showMyLoginPage(Model theModel) {
//        theModel.addAttribute("webUser", new WebUser());
//        return "register/registration-form";
//    }

    @GetMapping("/login")
    public String login() {
        return "login";  // returns login.jsp
    }

    @GetMapping("/error/error-403")
    public String error403() {
        return "error/error-403";
    }
    
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("customerDTO", new CustomerDTO());
        return "registerCustomer";  // Return the registration view (register.jsp or other)
    }

    @PostMapping("/register")
    public String registerCustomer(@ModelAttribute("customerDTO") @Valid CustomerDTO customerDTO,
                                   BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "registerCustomer";  // Return to form if there are errors
        }

        customerService.registerCustomer(customerDTO);
        model.addAttribute("message", "Registration successful!");
        return "redirect:/login";  // Redirect to success page after registration
    }
}
