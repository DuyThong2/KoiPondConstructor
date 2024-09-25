package com.example.SWPKoiContructor.dto;


import com.example.SWPKoiContructor.entities.Customer;
import javax.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.Email;

public class CustomerDTO {
    @NotBlank(message = "Name is required")
    private String name;

    @Email(message = "Email should be valid")
    @NotBlank(message = "Email is required")
    private String email;

    private String imgURL;  // Optional

    @NotBlank(message = "Phone number is required")
    private String phone;

    @NotBlank(message = "Password is required")
    private String password;

    private boolean enabled = true;  // Default to enabled

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
    
    public Customer mapDTOToCustomer(CustomerDTO customerDTO) {
        Customer customer = new Customer();
        customer.setName(customerDTO.getName());
        customer.setEmail(customerDTO.getEmail());
        customer.setImgURL(customerDTO.getImgURL());
        customer.setPhone(customerDTO.getPhone());
        customer.setPassword(customerDTO.getPassword());  // No hashing for now
        customer.setEnabled(customerDTO.isEnabled());
        return customer;
    }
}
