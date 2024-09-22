/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "Staff")
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "staff_id")
    private int staffId;
    
    @Column(name = "staff_email")
    private String staffEmail;
    
    private String username;
    
    @Column(name = "staff_phone")
    private String staffPhone;
    
    @Column(name = "staff_role")
    private String staffRole;
    
    @Column(name = "password")
    private String password;
    
    private boolean status;
    
    @Column(name = "user_type")
    private String userType;
    
    @OneToMany(mappedBy = "staff")
    private List<Consultant> consultant;
    
    @OneToMany(mappedBy = "staff")
    private List<Quotes> quotes;
    
    @ManyToMany(mappedBy = "staff")
    private List<Design> design;
    
    
    public Staff() {
    }

    public Staff(String staffEmail, String username, String staffPhone, String staffRole, String password, boolean status, String userType, List<Consultant> consultant, List<Quotes> quotes) {
        this.staffEmail = staffEmail;
        this.username = username;
        this.staffPhone = staffPhone;
        this.staffRole = staffRole;
        this.password = password;
        this.status = status;
        this.userType = userType;
        this.consultant = consultant;
        this.quotes = quotes;
    }

    public Staff(int staffId, String staffEmail, String username, String staffPhone, String staffRole, String password, boolean status, String userType, List<Consultant> consultant, List<Quotes> quotes, List<Design> design) {
        this.staffId = staffId;
        this.staffEmail = staffEmail;
        this.username = username;
        this.staffPhone = staffPhone;
        this.staffRole = staffRole;
        this.password = password;
        this.status = status;
        this.userType = userType;
        this.consultant = consultant;
        this.quotes = quotes;
        this.design = design;
    }
    
    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStaffPhone() {
        return staffPhone;
    }

    public void setStaffPhone(String staffPhone) {
        this.staffPhone = staffPhone;
    }

    public String getStaffRole() {
        return staffRole;
    }

    public void setStaffRole(String staffRole) {
        this.staffRole = staffRole;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public List<Consultant> getConsultant() {
        return consultant;
    }

    public void setConsultant(List<Consultant> consultant) {
        this.consultant = consultant;
    }

    public List<Quotes> getQuotes() {
        return quotes;
    }

    public void setQuotes(List<Quotes> quotes) {
        this.quotes = quotes;
    }

    public List<Design> getDesign() {
        return design;
    }

    public void setDesign(List<Design> design) {
        this.design = design;
    }
    
    
}
