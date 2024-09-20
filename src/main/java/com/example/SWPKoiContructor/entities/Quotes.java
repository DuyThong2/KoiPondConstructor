/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "Quotes")
public class Quotes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "quotes_id")
    private int quotesId;
    
    @Column(name = "quotes_name")
    private String quotesName;
    
    @Column(name = "quotes_content")
    private String quotesContent;
    
    @Column(name = "quotes_total_price")
    private double quotesTotalPrice;
    
    @Column(name = "quotes_area")
    private double quotesArea;
    
    @Column(name = "quotes_date")
    @Temporal(TemporalType.DATE)
    private Date quotesDate;
    
    @Column(name = "quotes_status")
    private int quotesStatus;
    
    @Column(name = "quotes_design_cost")
    private double quotesDesignCost;
    
    @Column(name = "quotes_construction_cost")
    private double quotesConstructionCost;
    
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    
    @OneToOne
    @JoinColumn(name = "consultant_id")
    private Consultant consultant;
    
    @ManyToOne
    @JoinColumn(name = "package_id")
    private Parcel parcel;
    
    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;

    public Quotes(String quotesName, String quotesContent, double quotesTotalPrice, double quotesArea, Date quotesDate, int quotesStatus, double quotesDesignCost, double quotesConstructionCost, Customer customer, Consultant consultant, Parcel pakage, Staff staff) {
        this.quotesName = quotesName;
        this.quotesContent = quotesContent;
        this.quotesTotalPrice = quotesTotalPrice;
        this.quotesArea = quotesArea;
        this.quotesDate = quotesDate;
        this.quotesStatus = quotesStatus;
        this.quotesDesignCost = quotesDesignCost;
        this.quotesConstructionCost = quotesConstructionCost;
        this.customer = customer;
        this.consultant = consultant;
        this.parcel = pakage;
        this.staff = staff;
    }

    public Quotes() {
    }

    public int getQuotesId() {
        return quotesId;
    }

    public void setQuotesId(int quotesId) {
        this.quotesId = quotesId;
    }

    public String getQuotesName() {
        return quotesName;
    }

    public void setQuotesName(String quotesName) {
        this.quotesName = quotesName;
    }

    public String getQuotesContent() {
        return quotesContent;
    }

    public void setQuotesContent(String quotesContent) {
        this.quotesContent = quotesContent;
    }

    public double getQuotesTotalPrice() {
        return quotesTotalPrice;
    }

    public void setQuotesTotalPrice(double quotesTotalPrice) {
        this.quotesTotalPrice = quotesTotalPrice;
    }

    public double getQuotesArea() {
        return quotesArea;
    }

    public void setQuotesArea(double quotesArea) {
        this.quotesArea = quotesArea;
    }

    public Date getQuotesDate() {
        return quotesDate;
    }

    public void setQuotesDate(Date quotesDate) {
        this.quotesDate = quotesDate;
    }

    public int getQuotesStatus() {
        return quotesStatus;
    }

    public void setQuotesStatus(int quotesStatus) {
        this.quotesStatus = quotesStatus;
    }

    public double getQuotesDesignCost() {
        return quotesDesignCost;
    }

    public void setQuotesDesignCost(double quotesDesignCost) {
        this.quotesDesignCost = quotesDesignCost;
    }

    public double getQuotesConstructionCost() {
        return quotesConstructionCost;
    }

    public void setQuotesConstructionCost(double quotesConstructionCost) {
        this.quotesConstructionCost = quotesConstructionCost;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Consultant getConsultant() {
        return consultant;
    }

    public void setConsultant(Consultant consultant) {
        this.consultant = consultant;
    }

    public Parcel getPakage() {
        return this.parcel;
    }

    public void setPakage(Parcel pakage) {
        this.parcel = pakage;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }
    
    
}
