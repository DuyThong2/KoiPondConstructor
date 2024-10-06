package com.example.SWPKoiContructor.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Service_Detail")
public class ServiceDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "service_detail_id")
    private int id;

    @Column(name = "service_detail_price")
    private Double price; // Changed to wrapper class to handle null values

    @Temporal(TemporalType.DATE)
    private Date dateRegister;

    private Integer rating; // Changed to wrapper class to handle null values

    @Column(name = "service_detail_status") // Keeping only one field to avoid duplicate mappings
    private Integer serviceDetailStatus; // Changed to wrapper class to handle null values

    private String feedback;

    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;

    public ServiceDetail(int id, Double price, Date dateRegister, Integer rating, Integer serviceDetailStatus, String feedback, Service service, Customer customer, Staff staff) {
        this.id = id;
        this.price = price;
        this.dateRegister = dateRegister;
        this.rating = rating;
        this.serviceDetailStatus = serviceDetailStatus;
        this.feedback = feedback;
        this.service = service;
        this.customer = customer;
        this.staff = staff;
    }

    public ServiceDetail() {
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getDateRegister() {
        return dateRegister;
    }

    public void setDateRegister(Date dateRegister) {
        this.dateRegister = dateRegister;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getServiceDetailStatus() {
        return serviceDetailStatus;
    }

    public void setServiceDetailStatus(Integer serviceDetailStatus) {
        this.serviceDetailStatus = serviceDetailStatus;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }
}
