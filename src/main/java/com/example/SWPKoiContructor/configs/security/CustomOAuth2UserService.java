package com.example.SWPKoiContructor.configs.security;


import com.example.SWPKoiContructor.dao.CustomerDAO;
import com.example.SWPKoiContructor.dao.StaffDAO;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Staff;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

    private final CustomerDAO customerDAO;
    private final StaffDAO staffDAO;
    private final DefaultOAuth2UserService delegate = new DefaultOAuth2UserService();


    public CustomOAuth2UserService(CustomerDAO customerDAO, StaffDAO staffDAO) {
        this.customerDAO = customerDAO;
        this.staffDAO = staffDAO;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = delegate.loadUser(oAuth2UserRequest);

        // Extract attributes from OAuth2 login
        Map<String, Object> attributes = oAuth2User.getAttributes();
        String email = (String) attributes.get("email");

        // Check if user exists
        Customer customer = customerDAO.getCustomerByEmail(email);
        Staff staff = staffDAO.findStaffByEmail(email);

        if (staff != null) {
            // Assign staff roles
            Set<GrantedAuthority> authorities = new HashSet<>();
            authorities.add(new SimpleGrantedAuthority(mapDepartmentToRole(staff.getDepartment())));
            return new DefaultOAuth2User(authorities, attributes, "email");
        }

        if (customer == null) {
            // Create new customer
            customer = new Customer();
            customer.setEmail(email);
            customer.setEnabled(true);
            customerDAO.createCustomer(customer);
        }

        Set<GrantedAuthority> authorities = Collections.singleton(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
        return new DefaultOAuth2User(authorities, attributes, "email");
    }

    private String mapDepartmentToRole(String department) {
        switch (department.toLowerCase()) {
            case "consulting":
                return "ROLE_CONSULTANT";
            case "design":
                return "ROLE_DESIGNER";
            case "construction":
                return "ROLE_CONSTRUCTOR";
            default:
                return "ROLE_CUSTOMER";
        }
    }
}
