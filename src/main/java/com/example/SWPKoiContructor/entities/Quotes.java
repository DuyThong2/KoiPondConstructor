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
    
    @ManyToOne
    @JoinColumn(name = "consultant_id")
    private Consultant consultant;
    
    @OneToOne
    @JoinColumn(name = "package_id")
    private Package pakage;
    
    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;
}
