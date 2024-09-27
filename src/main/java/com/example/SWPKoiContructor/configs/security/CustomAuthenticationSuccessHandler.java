package com.example.SWPKoiContructor.configs.security;


import com.example.SWPKoiContructor.dao.CustomerDAO;
import com.example.SWPKoiContructor.dao.StaffDAO;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Staff;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import java.io.IOException;
import org.springframework.security.core.Authentication;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private CustomerDAO customerDAO;
    private StaffDAO staffDAO;

    public CustomAuthenticationSuccessHandler(CustomerDAO customerDAO, StaffDAO staffDAO) {
        this.customerDAO = customerDAO;
        this.staffDAO = staffDAO;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String email = authentication.getName();
        System.out.println(email);
        HttpSession session = request.getSession();

        // Check if the user is a customer
        Customer customer = customerDAO.getCustomerByEmail(email);
        if (customer != null) {
            session.setAttribute("user", customer);  // Store customer in session
            response.sendRedirect("/customer/contract"); // Redirect to customer home
            return;
        }

        // Check if the user is a staff member
        Staff staff = staffDAO.findStaffByEmail(email);
        if (staff != null) {
            session.setAttribute("user", staff);     // Store staff in session
            String redirectURL = "";   // Redirect to staff home
            switch (staff.getDepartment()){
                case "Consulting": redirectURL="/consultant/contract"; break;
                case "Design": redirectURL="/designer/manage"; break;
                case "Construction":redirectURL="/contructor/contract"; break;
                default: redirectURL= "/manager/contract";
            }
            response.sendRedirect(redirectURL);
            return;
        }

        // If no user is found, redirect to login with error
        response.sendRedirect("/login?error=true");
    }

}
