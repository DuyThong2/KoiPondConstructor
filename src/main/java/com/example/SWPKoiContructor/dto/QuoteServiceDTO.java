/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dto;

import com.example.SWPKoiContructor.entities.Consultant;
import com.example.SWPKoiContructor.entities.Customer;
import com.example.SWPKoiContructor.entities.Feedback;
import com.example.SWPKoiContructor.entities.Staff;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
public class QuoteServiceDTO {
    private int serviceQuotesId;

    private String serviceQuotesName;

    private String serviceQuotesContent;

    private double serviceQuotesTotalPrice;

    private double serviceQuotesArea;

    private Date serviceQuotesDate;

    private int serviceQuotesStatus;
    
    private Customer customer;
    
    private Consultant consultant;
    
    private Staff staff;
    
    private List<Service> service;
    
    private List<Feedback> feedback;
}
