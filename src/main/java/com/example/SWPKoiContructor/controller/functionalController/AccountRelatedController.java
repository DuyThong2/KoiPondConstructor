/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.PasswordResetToken;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.entities.User;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.services.UserService;
import com.example.SWPKoiContructor.services.functionalService.EmailService;
import java.util.Date;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

/**
 *
 * @author Admin
 */
@Controller
public class AccountRelatedController {

    
    @Value("${server.servlet.context-path}")
    private String contexPath;
    
    private CustomerService customerService;
    private UserService userService;
    private EmailService emailService;

    @Autowired
    private StaffService staffService;

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

    @GetMapping("/login")
    public String login(@RequestParam(value = "expired", required = false) String expired, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);  // Get session, don't create a new one if it doesn't exist

        // Check if the user is already authenticated
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated() && !(authentication instanceof AnonymousAuthenticationToken)) {
            String email = null;

            // Check if user logged in via OAuth2 (e.g., Google login)
            if (authentication instanceof OAuth2AuthenticationToken) {
                OAuth2User oauthUser = (OAuth2User) authentication.getPrincipal();
                email = (String) oauthUser.getAttributes().get("email");  // Extract email from OAuth2 attributes
                System.out.println("Authenticated via Google OAuth2: " + email);

            } else if (authentication instanceof UsernamePasswordAuthenticationToken) {
                // Check if user logged in via form (username/password)
                email = authentication.getName();  // This is usually the username (or email) provided in the form login
                System.out.println("Authenticated via form login: " + email);
            }

            // Now, proceed with checking customer or staff based on the email
            if (email != null) {
                // Check if the user is a customer
                Customer customer = customerService.getCustomerByEmail(email);
                if (customer != null) {
                    session.setAttribute("user", customer);  // Store customer in session
                    return "redirect:/customer/contract";  // Redirect to customer home page
                }

                // Check if the user is a staff member
                Staff staff = staffService.findStaffByEmail(email);
                if (staff != null) {
                    session.setAttribute("user", staff);  // Store staff in session
                    String redirectURL = getRedirectURLBasedOnRole(staff);
                    return "redirect:" + redirectURL;
                }
            }

            // If no customer or staff found, redirect to login with error
            return "redirect:/login?error=true";
        }

        // If session expired, add message to model
        if (expired != null) {
            model.addAttribute("message", "Your session has expired. Please log in again.");
        }

        return "login";
    }

    private String getRedirectURLBasedOnRole(Staff staff) {
        switch (staff.getDepartment()) {
            case "Consulting":
                return "/consultant/viewConsultantList";
            case "Design":
                return "/designer/manage";
            case "Construction":
                return "/constructor/manage";
            default:
                return "/manager/dashboard";
        }
    }

    @GetMapping("/error/error-403")
    public String error403() {
        return "error/error-403";
    }

    @GetMapping("/loginFail")
    public String loginFail(Model model) {
        model.addAttribute("message", "wrong password or email");
        return "login";
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
    public String processForgotPassword(HttpServletRequest request,
            @RequestParam("email") String email,
            Model model) {
        User user = userService.findUserByEmail(email);

        if (user != null) {
            String token = UUID.randomUUID().toString();
            userService.createPasswordResetTokenForUser(user, token);

            // Dynamically build the reset URL based on the request
            String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                    .replacePath(null)
                    .build()
                    .toUriString();

            String resetUrl = baseUrl + contexPath + "/reset-password?token=" + token;
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
