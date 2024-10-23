/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.validator.internal.util.Contracts;

/**
 *
 * @author Admin
 */

@Entity
@Table(name="term")
public class Term {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int termId;
    
    @Column(name="percent_on_design1")
    private double percentOnDesign1;
    
    @Column(name="percent_on_design2")
    private double percentOnDesign2;
    
    @Column(name="percent_on_design3")
    private double percentOnDesign3;
    
    @Column(name="percent_on_construct1")
    private double percentOnConstruct1;
    
    @Column(name="percent_on_construct2")
    private double percentOnConstruct2;
    
      
    @Column(name="pay_on_start_of_design")
    private boolean payOnStartOfDesign;
    
       
    @Column(name="pay_on_start_of_construction")
    private boolean payOnStartOfConstruction;
    
    private String description;
    
    @Column(name="is_template")
    private boolean isTemplate;
    
    @Column(name="follow_contract")
    private boolean followContract;
    
    @Column(name="term_status")
    private boolean termStatus;
    
    @OneToMany(mappedBy = "term", cascade = CascadeType.PERSIST)
    private List<Contract> contract = new ArrayList<>();

    public Term(int termId, double percentOnDesign1, double percentOnDesign2, double percentOnDesign3, double percentOnConstruct1, double percentOnConstruct2, boolean payOnStartOfDesign, boolean payOnStartOfConstruction, String description, boolean isTemplate, boolean followContract, boolean termStatus, List<Contract> contract) {
        this.termId = termId;
        this.percentOnDesign1 = percentOnDesign1;
        this.percentOnDesign2 = percentOnDesign2;
        this.percentOnDesign3 = percentOnDesign3;
        this.percentOnConstruct1 = percentOnConstruct1;
        this.percentOnConstruct2 = percentOnConstruct2;
        this.payOnStartOfDesign = payOnStartOfDesign;
        this.payOnStartOfConstruction = payOnStartOfConstruction;
        this.description = description;
        this.isTemplate = isTemplate;
        this.followContract = followContract;
        this.termStatus = termStatus;
        this.contract = contract;
    }
    
    

    public Term() {
    }

    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    public double getPercentOnDesign1() {
        return percentOnDesign1;
    }

    public void setPercentOnDesign1(double percentOnDesign1) {
        this.percentOnDesign1 = percentOnDesign1;
    }

    public double getPercentOnDesign2() {
        return percentOnDesign2;
    }

    public void setPercentOnDesign2(double percentOnDesign2) {
        this.percentOnDesign2 = percentOnDesign2;
    }

    public double getPercentOnDesign3() {
        return percentOnDesign3;
    }

    public void setPercentOnDesign3(double percentOnDesign3) {
        this.percentOnDesign3 = percentOnDesign3;
    }

    public double getPercentOnConstruct1() {
        return percentOnConstruct1;
    }

    public void setPercentOnConstruct1(double percentOnConstruct1) {
        this.percentOnConstruct1 = percentOnConstruct1;
    }

    public double getPercentOnConstruct2() {
        return percentOnConstruct2;
    }

    public void setPercentOnConstruct2(double percentOnConstruct2) {
        this.percentOnConstruct2 = percentOnConstruct2;
    }

    public boolean isPayOnStartOfDesign() {
        return payOnStartOfDesign;
    }

    public void setPayOnStartOfDesign(boolean payOnStartOfDesign) {
        this.payOnStartOfDesign = payOnStartOfDesign;
    }

    public boolean isPayOnStartOfConstruction() {
        return payOnStartOfConstruction;
    }

    public void setPayOnStartOfConstruction(boolean payOnStartOfConstruction) {
        this.payOnStartOfConstruction = payOnStartOfConstruction;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIsTemplate() {
        return isTemplate;
    }

    public void setIsTemplate(boolean isTemplate) {
        this.isTemplate = isTemplate;
    }

    public boolean isFollowContract() {
        return followContract;
    }

    public void setFollowContract(boolean followContract) {
        this.followContract = followContract;
    }

    public List<Contract> getContract() {
        return contract;
    }

    public void setContract(List<Contract> contract) {
        this.contract = contract;
    }

    public boolean isTermStatus() {
        return termStatus;
    }

    public void setTermStatus(boolean termStatus) {
        this.termStatus = termStatus;
    }
    
    public void addContract(Contract contract){
        this.contract.add(contract);
        contract.setTerm(this);
    }

    
    
    
    
    
    
    
    
}
