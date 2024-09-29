/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.entities.PasswordResetToken;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.UserService;
import com.example.SWPKoiContructor.services.functionalService.EmailService;
import java.util.Date;
import java.util.UUID;
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
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
public class AccountRelatedController {

    private CustomerService customerService;
    private UserService userService;
    private EmailService emailService;

    public AccountRelatedController(CustomerService customerService, UserService userService, EmailService emailService) {
        this.customerService = customerService;
        this.userService = userService;
        this.emailService = emailService;
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

    
    
    //register 
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

    
    
    //forgot and reset password
    
    @GetMapping("/forgot-password")
    public String showForgotPasswordForm(Model model) {
        return "forgot_password_form";  // Returns the view for the forgot password form
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, Model model) {
        User user = userService.findUserByEmail(email);
        if (user != null) {
            String token = UUID.randomUUID().toString();
            userService.createPasswordResetTokenForUser(user, token);

            String resetUrl = "http://localhost:8081/reset-password?token=" + token;
            emailService.sendPasswordResetEmail(user.getEmail(), resetUrl);

            model.addAttribute("message", "A password reset link has been sent to your email.");
        } else {
            model.addAttribute("message", "No user found with the provided email.");
        }
        return "forgot_password_form";
    }

    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        PasswordResetToken resetToken = userService.getPasswordResetToken(token);
        if (resetToken != null && resetToken.getExpiryDate().after(new Date())) {
            model.addAttribute("token", token);
            return "reset_password_form";
        } else {
            model.addAttribute("message", "Invalid or expired token");
            return "error";
        }
    }

    @PostMapping("/reset-password")
    public String processResetPassword(@RequestParam("token") String token,
            @RequestParam("password") String newPassword, Model model) {
        PasswordResetToken resetToken = userService.getPasswordResetToken(token);
        if (resetToken != null && resetToken.getExpiryDate().after(new Date())) {
            userService.updatePassword(resetToken.getUser(), newPassword);
            model.addAttribute("message", "Password successfully reset. You can now log in.");
            return "login";
        } else {
            model.addAttribute("message", "Invalid or expired token");
            return "error";
        }
    }
}
