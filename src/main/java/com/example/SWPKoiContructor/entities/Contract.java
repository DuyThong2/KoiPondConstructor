/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.time.LocalDate;
import java.util.Date;
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
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Admin
 */

@Entity
@Table(name = "Contract")
public class Contract {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int contractId;
    
    @Temporal(TemporalType.DATE)
    private Date dateCreate;
    
    @Column(name="file_url")
    private String fileURL;
    
    private double totalPrice;
    
    private double priceOnConceptDesign;
    
    private double priceOnConstructionDesign;
    
    private double priceOnDetailDesign;
    
    private double priceOnRawConstruction;
    
    private double priceOnCompleteConstruction;
    
    @Column(name="deposit_on_contract_confirmed")
    private double depositOnContract;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate estimatedEndDate;
    
    private String contractTerm;
    
    private int contractStatus;
    
    private String contractNote;
    
    @ManyToOne()
    @JoinColumn(name = "term_id")
    private Term term;


    
    @OneToOne(mappedBy = "contract")
    private Project project;
    
    @OneToOne()
    @JoinColumn(name = "quote_id")
    private Quotes quote;
    
    @ManyToOne()
    @JoinColumn(name = "customer_id")
    private Customer customer;
    
    @OneToMany(mappedBy = "contract")
    private List<Feedback> feedback;

    public Contract(Date dateCreate, String fileURL, double totalPrice, double priceOnConceptDesign, double priceOnConstructionDesign, double priceOnDetailDesign, double priceOnRawConstruction, double priceOnCompleteConstruction, String contractTerm, int contractStatus, String contractNote, Term term, Project project) {
        this.dateCreate = dateCreate;
        this.fileURL = fileURL;
        this.totalPrice = totalPrice;
        this.priceOnConceptDesign = priceOnConceptDesign;
        this.priceOnConstructionDesign = priceOnConstructionDesign;
        this.priceOnDetailDesign = priceOnDetailDesign;
        this.priceOnRawConstruction = priceOnRawConstruction;
        this.priceOnCompleteConstruction = priceOnCompleteConstruction;
        this.contractTerm = contractTerm;
        this.contractStatus = contractStatus;
        this.contractNote = contractNote;
        this.term = term;
        this.project = project;
    }
    
    

    

    public Contract() {
    }

    public LocalDate getEstimatedEndDate() {
        return estimatedEndDate;
    }

    public void setEstimatedEndDate(LocalDate estimatedEndDate) {
        this.estimatedEndDate = estimatedEndDate;
    }

    
    
    

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getFileURL() {
        return fileURL;
    }

    public void setFileURL(String fileURL) {
        this.fileURL = fileURL;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getPriceOnConceptDesign() {
        return priceOnConceptDesign;
    }

    public void setPriceOnConceptDesign(double priceOnConceptDesign) {
        this.priceOnConceptDesign = priceOnConceptDesign;
    }

    public double getPriceOnConstructionDesign() {
        return priceOnConstructionDesign;
    }

    public void setPriceOnConstructionDesign(double priceOnConstructionDesign) {
        this.priceOnConstructionDesign = priceOnConstructionDesign;
    }

    public double getPriceOnDetailDesign() {
        return priceOnDetailDesign;
    }

    public void setPriceOnDetailDesign(double priceOnDetailDesign) {
        this.priceOnDetailDesign = priceOnDetailDesign;
    }

    public double getPriceOnRawConstruction() {
        return priceOnRawConstruction;
    }

    public void setPriceOnRawConstruction(double priceOnRawConstruction) {
        this.priceOnRawConstruction = priceOnRawConstruction;
    }

    public double getPriceOnCompleteConstruction() {
        return priceOnCompleteConstruction;
    }

    public void setPriceOnCompleteConstruction(double priceOnCompleteConstruction) {
        this.priceOnCompleteConstruction = priceOnCompleteConstruction;
    }

    public String getContractTerm() {
        return contractTerm;
    }

    public void setContractTerm(String contractTerm) {
        this.contractTerm = contractTerm;
    }

    public int getContractStatus() {
        return contractStatus;
    }

    public void setContractStatus(int contractStatus) {
        this.contractStatus = contractStatus;
    }

    public String getContractNote() {
        return contractNote;
    }

    public void setContractNote(String contractNote) {
        this.contractNote = contractNote;
    }


    public Term getTerm() {
        return term;
    }

    public void setTerm(Term term) {
        this.term = term;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Quotes getQuote() {
        return quote;
    }

    public void setQuote(Quotes quote) {
        this.quote = quote;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<Feedback> getFeedback() {
        return feedback;
    }

    public void setFeedback(List<Feedback> feedback) {
        this.feedback = feedback;
    }

    public double getDepositOnContract() {
        return depositOnContract;
    }

    public void setDepositOnContract(double depositOnContract) {
        this.depositOnContract = depositOnContract;
    }
    
    
    
    
    
    public boolean isContractBelongToCustomer(Customer customer, Contract contract) {
        // Check if the contract and customer are not null
        if (contract == null || customer == null) {
            return false;
        }
        
        // Check if the contract's customer is the same as the given customer
        return contract.getCustomer() != null && contract.getCustomer().getId() == customer.getId();
    }
    
    public boolean isContractBelongToStaff(Staff staff, Contract contract) {
        // Check if contract, quote, and staff are not null
        if (contract == null || staff == null || contract.getQuote() == null) {
            return false;
        }

        // Check if the quote's staff is the same as the given staff
        return contract.getQuote().getStaff() != null && contract.getQuote().getStaff().getId() == staff.getId();
    }
    
    

    
    
    
    
    
    
}
