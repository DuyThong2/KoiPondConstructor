/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Entity
@Table(name = "Service_Quotes")
public class ServiceQuotes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "service_quotes_id")
    private int serviceQuotesId;

    @Column(name = "service_quotes_name")
    private String serviceQuotesName;

    @Column(name = "service_quotes_content")
    private String serviceQuotesContent;

    @Column(name = "service_quotes_total_price")
    private double serviceQuotesTotalPrice;

    @Column(name = "service_quotes_area")
    private double serviceQuotesArea;

    @Column(name = "service_quotes_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date serviceQuotesDate;

    @Column(name = "service_quotes_status")
    private int serviceQuotesStatus;
    
    @Column(name = "used_point")
    private int usedPoint;
    
    @Column(name = "is_pay_after")
    private boolean isPayAfter;
            
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    
    @OneToOne
    @JoinColumn(name = "consultant_id", nullable = true)
    private Consultant consultant;
    
    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;
    
    
    @ManyToMany
    @JoinTable(
            name = "Service_Quotes_Service",
            joinColumns = @JoinColumn(name = "service_quotes_id"),
            inverseJoinColumns = @JoinColumn(name = "service_id")
    )
    private List<Service> service;
    
    @OneToMany(mappedBy = "serviceQuotes")
    private List<Feedback> feedback;

    @OneToMany(mappedBy = "serviceQuotes")
    private List<ServiceDetail> serviceDetails;
    
    public ServiceQuotes() {
    }

    public ServiceQuotes(int serviceQuotesId, String serviceQuotesName, String serviceQuotesContent, double serviceQuotesTotalPrice, double serviceQuotesArea, Date serviceQuotesDate, int serviceQuotesStatus, Customer customer, Consultant consultant, Staff staff, List<Service> service, List<Feedback> feedback) {
        this.serviceQuotesId = serviceQuotesId;
        this.serviceQuotesName = serviceQuotesName;
        this.serviceQuotesContent = serviceQuotesContent;
        this.serviceQuotesTotalPrice = serviceQuotesTotalPrice;
        this.serviceQuotesArea = serviceQuotesArea;
        this.serviceQuotesDate = serviceQuotesDate;
        this.serviceQuotesStatus = serviceQuotesStatus;
        this.customer = customer;
        this.consultant = consultant;
        this.staff = staff;
        this.service = service;
        this.feedback = feedback;
    }
       
    

    public int getServiceQuotesId() {
        return serviceQuotesId;
    }

    public void setServiceQuotesId(int serviceQuotesId) {
        this.serviceQuotesId = serviceQuotesId;
    }

    public String getServiceQuotesName() {
        return serviceQuotesName;
    }

    public void setServiceQuotesName(String serviceQuotesName) {
        this.serviceQuotesName = serviceQuotesName;
    }

    public String getServiceQuotesContent() {
        return serviceQuotesContent;
    }

    public void setServiceQuotesContent(String serviceQuotesContent) {
        this.serviceQuotesContent = serviceQuotesContent;
    }

    public double getServiceQuotesTotalPrice() {
        return serviceQuotesTotalPrice;
    }

    public void setServiceQuotesTotalPrice(double serviceQuotesTotalPrice) {
        this.serviceQuotesTotalPrice = serviceQuotesTotalPrice;
    }

    public double getServiceQuotesArea() {
        return serviceQuotesArea;
    }

    public void setServiceQuotesArea(double serviceQuotesArea) {
        this.serviceQuotesArea = serviceQuotesArea;
    }

    public Date getServiceQuotesDate() {
        return serviceQuotesDate;
    }

    public void setServiceQuotesDate(Date serviceQuotesDate) {
        this.serviceQuotesDate = serviceQuotesDate;
    }

    public int getServiceQuotesStatus() {
        return serviceQuotesStatus;
    }

    public void setServiceQuotesStatus(int serviceQuotesStatus) {
        this.serviceQuotesStatus = serviceQuotesStatus;
    }

    public int getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(int usedPoint) {
        this.usedPoint = usedPoint;
    }

    public boolean isIsPayAfter() {
        return isPayAfter;
    }

    public void setIsPayAfter(boolean isPayAfter) {
        this.isPayAfter = isPayAfter;
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

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public List<Service> getService() {
        return service;
    }

    public void setService(List<Service> service) {
        this.service = service;
    }

    

    public List<Feedback> getFeedback() {
        return feedback;
    }

    public void setFeedback(List<Feedback> feedback) {
        this.feedback = feedback;
    }

    public List<ServiceDetail> getServiceDetails() {
        return serviceDetails;
    }

    public void setServiceDetails(List<ServiceDetail> serviceDetails) {
        this.serviceDetails = serviceDetails;
    }
    
    
           
    public boolean isServiceQuoteBelongToStaff(Staff staff, ServiceQuotes serviceQuotes){
        if(staff == null || serviceQuotes == null)
            return false;
        return serviceQuotes.getStaff() != null && serviceQuotes.getStaff().getId() == staff.getId();
    }
    public boolean isAllServiceFailed(){
        if (serviceDetails == null || serviceDetails.isEmpty()) {
            return false;
        }
        // Define a constant for the "finished" status
        final int FAILED_STATUS = 5;
    
        // Loop through each service detail and check its status
        for (ServiceDetail serviceDetail : serviceDetails) {
            if (serviceDetail.getServiceDetailStatus() == null ||(
                serviceDetail.getServiceDetailStatus() != FAILED_STATUS)) {
                return false; // Return false if any detail is not finished
            }
        }
        return true;
    }
    
    public boolean isServiceDetailOfQuoteFinished() {
        // Check if the serviceDetails list is null or empty
        if (serviceDetails == null || serviceDetails.isEmpty()) {
            return false;
        }
        // Define a constant for the "finished" status
        final int FINISHED_STATUS = 3;
    
        // Loop through each service detail and check its status
        for (ServiceDetail serviceDetail : serviceDetails) {
            if (serviceDetail.getServiceDetailStatus() == null ||(
                serviceDetail.getServiceDetailStatus() != FINISHED_STATUS &&
                serviceDetail.getServiceDetailStatus() != 5)) {
                return false; // Return false if any detail is not finished
            }
        }
        return true; // All service details are finished
    }
    
    public boolean isFree() {
        return serviceQuotesTotalPrice == usedPoint;
    }
    
    public double calculateTotalPricePayment(){
        double priceMustPay = serviceQuotesTotalPrice / 2;
        if(!serviceDetails.isEmpty()){
            for (ServiceDetail serviceDetail : serviceDetails) {
                if (serviceDetail.getServiceDetailStatus() == 5) {
                    priceMustPay -= serviceDetail.getPrice() / 2;
                }
            }
        }
        return priceMustPay;
    }
    
    public double calculatePointUsing(){
        double pointUsing = usedPoint;
        double pointLeft = 0;
        if(pointUsing > (serviceQuotesTotalPrice / 2)){
            pointUsing = (serviceQuotesTotalPrice / 2) - 1;
            pointLeft = usedPoint - pointUsing;
        }
        if(serviceQuotesStatus == 9 && isServiceDetailOfQuoteFinished())
            return pointLeft;
        return pointUsing;
    }
    
//    public double calculatePointUsingForDeposit(){
//        double pointUsing = usedPoint;
//        if(pointUsing > (serviceQuotesTotalPrice / 2)){
//            pointUsing = (serviceQuotesTotalPrice / 2) - 1;          
//        }       
//        return pointUsing;
//    }
    
    public double calculateDeposit(){
        double deposit = serviceQuotesTotalPrice / 2;
        double pointUsing = usedPoint;
        if(pointUsing > deposit){
            deposit = 1;
        }else{
            deposit -= pointUsing;
        }
        return deposit;
    }
    
    public double calculateFullPaid(){
        double fullPaid = serviceQuotesTotalPrice / 2;
        double pointUsing = usedPoint;
        if(!serviceDetails.isEmpty()){
            for (ServiceDetail serviceDetail : serviceDetails) {
                if (serviceDetail.getServiceDetailStatus() == 5) {
                    fullPaid -= serviceDetail.getPrice() / 2;
                }
            }
        }
        if(pointUsing >= serviceQuotesTotalPrice / 2){
                 pointUsing = usedPoint - (serviceQuotesTotalPrice / 2) + 1;
                 fullPaid -= pointUsing;
        }
        return fullPaid;
    }
}
