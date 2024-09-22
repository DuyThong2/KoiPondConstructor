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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "Staffs")
public class Staff extends User{
    
    private String department;
    @OneToMany(mappedBy = "staff")
    private List<Consultant> consultant;
    
    @OneToMany(mappedBy = "staff")
    private List<Quotes> quotes;

    public Staff() {
    }

    public Staff(String name, String email, String imgURL, String phone, String password, boolean enable,String department) {
        super(name, email, imgURL, phone, password, enable);
        this.department = department;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
    
    
    
    
}
