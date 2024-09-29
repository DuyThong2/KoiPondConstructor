package com.example.SWPKoiContructor.configs.security;


import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.StaffService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private final CustomerService customerService;
    private final StaffService staffService;

    @Autowired
    public CustomAuthenticationSuccessHandler(CustomerService customerService, StaffService staffService) {
        this.customerService = customerService;
        this.staffService = staffService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String email = authentication.getName();  // Get user's email
        HttpSession session = request.getSession();
        System.out.println("custome with form login activated");
        // Check if the user is a customer
        Customer customer = customerService.getCustomerByEmail(email);
        if (customer != null) {
            session.setAttribute("user", customer);  // Store customer in session
            response.sendRedirect("/customer/contract");  // Redirect to customer home page
            return;
        }

        // Check if the user is a staff member
        Staff staff = staffService.findStaffByEmail(email);
        if (staff != null) {

            session.setAttribute("user", staff);  // Store staff in session
            String redirectURL = getRedirectURLBasedOnRole(staff);

            response.sendRedirect(redirectURL);
            return;
        }

        // If user not found, redirect to login with error
        response.sendRedirect("/login?error=true");
    }

    private String getRedirectURLBasedOnRole(Staff staff) {
        switch (staff.getDepartment()) {
            case "Consulting":
                return "/consultant/contract";
            case "Design":
                return "/designer/manage";
            case "Construction":
                return "/constructor/contract";
            default:
                return "/manager/contract";
        }
    }
}
