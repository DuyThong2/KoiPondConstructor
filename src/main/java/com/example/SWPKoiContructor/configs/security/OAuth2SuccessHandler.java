package com.example.SWPKoiContructor.configs.security;

import com.example.SWPKoiContructor.dto.CustomerDTO;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Staff;
import com.example.SWPKoiContructor.services.CustomerService;
import com.example.SWPKoiContructor.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Component
public class OAuth2SuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private StaffService staffService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        System.out.println("this 2ouath is activated ");
        // Cast the Authentication to OAuth2AuthenticationToken
        OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;

        // Extract email from OAuth2 attributes
        Map<String, Object> attributes = oAuth2User.getAttributes();
        String email = (String) attributes.get("email");

        HttpSession session = request.getSession();

        // Check if the user is a customer
        Customer customer = customerService.getCustomerByEmail(email);
        if (customer != null) {
            session.setAttribute("user", customer);  // Store customer in session

            if (customer.isEnabled()) {
                Set<GrantedAuthority> authorities = new HashSet<>();
                authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));

                // Create a new OAuth2AuthenticationToken with the updated authorities
                OAuth2AuthenticationToken authToken = new OAuth2AuthenticationToken(oAuth2User, authorities, oauthToken.getAuthorizedClientRegistrationId());

                // Set the new authentication token in the SecurityContext
                SecurityContextHolder.getContext().setAuthentication(authToken);

                response.sendRedirect("/customer/contract");
                return;
            } else {
                request.setAttribute("message", "your account have been disabled");
                response.sendRedirect("/");
                return;
            }
            // Create a new authentication token with the customer role

        }

        // Check if the user is a staff member
        Staff staff = staffService.findStaffByEmail(email);
        if (staff != null) {
            session.setAttribute("user", staff);  // Store staff in session
            if (staff.isEnabled()) {
                Set<GrantedAuthority> authorities = new HashSet<>();
                String role = mapDepartmentToRole(staff.getDepartment());
                authorities.add(new SimpleGrantedAuthority(role));

                // Create a new OAuth2AuthenticationToken with the updated authorities
                OAuth2AuthenticationToken authToken = new OAuth2AuthenticationToken(oAuth2User, authorities, oauthToken.getAuthorizedClientRegistrationId());

                // Set the new authentication token in the SecurityContext
                SecurityContextHolder.getContext().setAuthentication(authToken);

                String redirectURL = getRedirectURLBasedOnRole(staff);
                response.sendRedirect(redirectURL);
                return;
            } else {
                request.setAttribute("message", "your account have been disabled");
                response.sendRedirect("/");
                return;
            }
            // Assign roles based on the staff department

        }

        // If user not found, create a new customer and assign ROLE_CUSTOMER
        if (customer == null) {
            CustomerDTO customerDTO = new CustomerDTO();
            customerDTO.setEmail(email);
            customerDTO.setPassword("$2a$12$F45V9kx4zG.6gT/KGf9X7eYq01sfqzmiDt1m6EMKQnJ7IXvI56i7W");
            customerDTO.setEnabled(true);
            customerService.registerCustomer(customerDTO);
            session.setAttribute("user", customerDTO.mapDTOToCustomer(customerDTO));

            // Create a new authentication token with the customer role
            Set<GrantedAuthority> authorities = new HashSet<>();
            authorities.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));

            // Create a new OAuth2AuthenticationToken with the updated authorities
            OAuth2AuthenticationToken authToken = new OAuth2AuthenticationToken(oAuth2User, authorities, oauthToken.getAuthorizedClientRegistrationId());

            // Set the new authentication token in the SecurityContext
            SecurityContextHolder.getContext().setAuthentication(authToken);

            response.sendRedirect("/customer/contract");
        }
    }

    // Helper method to determine the redirect URL based on the staff's department
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

    // Helper method to map department to a role
    private String mapDepartmentToRole(String department) {
        switch (department.toLowerCase()) {
            case "consulting":
                return "ROLE_CONSULTANT";
            case "design":
                return "ROLE_DESIGNER";
            case "construction":
                return "ROLE_CONSTRUCTOR";
            case "management":
                return "ROLE_MANAGER";
            default:
                return "ROLE_CUSTOMER";
        }
    }
}
