/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Calendar;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 *
 * @author HP
 */
//Tạm xong
@Entity
@Table(name = "Consultant")
public class Consultant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "consultant_id")
    private int consultantId;
    
    @Column(name = "consultant_customer_name")
    private String consultantCustomerName;
    
    @Column(name = "consultant_date_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Calendar consultantDateTime;
         
    @Column(name = "consultant_phone")
    private String consultantPhone;
    
    @Column(name = "consultant_content")
    private String consultantContent;
    
    @Column(name = "consultant_type")
    private String consultantType;
    
    @Column(name = "consultant_status")
    private int consultantStatus;
    
    @Column(name = "consultant_email")
    private String consultant_email;
    
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    
    @OneToOne
    @JoinColumn(name = "pre_design_id")
    private PreDesign predesign;
    
    @OneToMany(mappedBy = "Consultant")
    private List<Quotes> quotes;
    
    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;

    public Consultant() {
    }

    public Consultant(int consultantId, String consultantCustomerName, Calendar consultantDateTime, String consultantPhone, String consultantContent, String consultantType, int consultantStatus, String consultant_email, Customer customer, PreDesign predesign, List<Quotes> quotes, Staff staff) {
        this.consultantId = consultantId;
        this.consultantCustomerName = consultantCustomerName;
        this.consultantDateTime = consultantDateTime;
        this.consultantPhone = consultantPhone;
        this.consultantContent = consultantContent;
        this.consultantType = consultantType;
        this.consultantStatus = consultantStatus;
        this.consultant_email = consultant_email;
        this.customer = customer;
        this.predesign = predesign;
        this.quotes = quotes;
        this.staff = staff;
    }

    

    public int getConsultantId() {
        return consultantId;
    }

    public void setConsultantId(int consultantId) {
        this.consultantId = consultantId;
    }

    public String getConsultantCustomerName() {
        return consultantCustomerName;
    }

    public void setConsultantCustomerName(String consultantCustomerName) {
        this.consultantCustomerName = consultantCustomerName;
    }

    public Calendar getConsultantDateTime() {
        return consultantDateTime;
    }

    public void setConsultantDateTime(Calendar consultantDateTime) {
        this.consultantDateTime = consultantDateTime;
    }

    public String getConsultantPhone() {
        return consultantPhone;
    }

    public void setConsultantPhone(String consultantPhone) {
        this.consultantPhone = consultantPhone;
    }

    public String getConsultantContent() {
        return consultantContent;
    }

    public void setConsultantContent(String consultantContent) {
        this.consultantContent = consultantContent;
    }

    public String getConsultantType() {
        return consultantType;
    }

    public void setConsultantType(String consultantType) {
        this.consultantType = consultantType;
    }

    public int getConsultantStatus() {
        return consultantStatus;
    }

    public void setConsultantStatus(int consultantStatus) {
        this.consultantStatus = consultantStatus;
    }

    public String getConsultant_email() {
        return consultant_email;
    }

    public void setConsultant_email(String consultant_email) {
        this.consultant_email = consultant_email;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public PreDesign getPredesign() {
        return predesign;
    }

    public void setPredesign(PreDesign predesign) {
        this.predesign = predesign;
    }

    public List<Quotes> getQuotes() {
        return quotes;
    }

    public void setQuotes(List<Quotes> quotes) {
        this.quotes = quotes;
    }

    

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }
    
    
}
