/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author nasaf
 */
@Entity
@Table(name = "Construction_Stage")
public class ConstructionStage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "construction_stage_id")
    private int constructionStageId;

    @Column(name = "construction_stage_name")
    private String constructionStageName;

    @Column(name = "construction_stage_price")
    private double constructionStagePrice;

    @Column(name = "construction_stage_description")
    private String constructionStageDescription;

    @Column(name = "construction_stage_status")
    private int constructionStageStatus;

    @ManyToOne
    @JoinColumn(name = "construction_id")
    private Construction construction;

    @OneToMany(mappedBy = "constructionStage", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ConstructionStageDetail> constructionStageDetail = new ArrayList<>();

    public ConstructionStage(int constructionStageId, String constructionStageName, double constructionStagePrice, String constructionStageDescription, int constructionStageStatus) {
        this.constructionStageId = constructionStageId;
        this.constructionStageName = constructionStageName;
        this.constructionStagePrice = constructionStagePrice;
        this.constructionStageDescription = constructionStageDescription;
        this.constructionStageStatus = constructionStageStatus;
    }

    public ConstructionStage(String constructionStageName, double constructionStagePrice, String constructionStageDescription, int constructionStageStatus) {
        this.constructionStageName = constructionStageName;
        this.constructionStagePrice = constructionStagePrice;
        this.constructionStageDescription = constructionStageDescription;
        this.constructionStageStatus = constructionStageStatus;
    }

    public ConstructionStage() {
    }

    public int getConstructionStageId() {
        return constructionStageId;
    }

    public void setConstructionStageId(int constructionStageId) {
        this.constructionStageId = constructionStageId;
    }

    public String getConstructionStageName() {
        return constructionStageName;
    }

    public void setConstructionStageName(String constructionStageName) {
        this.constructionStageName = constructionStageName;
    }

    public double getConstructionStagePrice() {
        return constructionStagePrice;
    }

    public void setConstructionStagePrice(double constructionStagePrice) {
        this.constructionStagePrice = constructionStagePrice;
    }

    public String getConstructionStageDescription() {
        return constructionStageDescription;
    }

    public void setConstructionStageDescription(String constructionStageDescription) {
        this.constructionStageDescription = constructionStageDescription;
    }

    public int getConstructionStageStatus() {
        return constructionStageStatus;
    }

    public void setConstructionStageStatus(int constructionStageStatus) {
        this.constructionStageStatus = constructionStageStatus;
    }

    public Construction getConstruction() {
        return construction;
    }

    public void setConstruction(Construction construction) {
        this.construction = construction;
    }

    public List<ConstructionStageDetail> getConstructionStageDetail() {
        return constructionStageDetail;
    }

    public void setConstructionStageDetail(List<ConstructionStageDetail> constructionStageDetail) {
        this.constructionStageDetail = constructionStageDetail;
    }

    //Convinience method
    public void addContructionDetailStage(ConstructionStageDetail constructionStageDetail) {
        this.constructionStageDetail.add(constructionStageDetail);
        constructionStageDetail.setConstructionStage(this);
    }

    public void removeConstructionStageDetail(ConstructionStageDetail constructionStageDetail) {
        this.constructionStageDetail.remove(constructionStageDetail);
        constructionStageDetail.setConstructionStage(null);
    }

    public List<ConstructionStageDetail> createListOfDesignStageDetailRaw(ConstructionStage constructionStageRaw, Term term) {

        // Initialize ConstructionStageDetail objects
        ConstructionStageDetail detail1 = new ConstructionStageDetail("Site Preparation ", 0, "Detailed preparation of the site for construction.", 1);
        ConstructionStageDetail detail2 = new ConstructionStageDetail("Excavating ", 0, "Detailed excavating for pond construction.", 1);
        ConstructionStageDetail detail3 = new ConstructionStageDetail("Liner Install ", 0, "Detailed installation of the pond liner.", 1);
        ConstructionStageDetail detail4 = new ConstructionStageDetail("Filtration System ", 0, "Detailed setup of the filtration system.", 1);
        ConstructionStageDetail detail5 = new ConstructionStageDetail("Pump System", 0, "Detailed installation of the pump system.", 1);
        ConstructionStageDetail detail6 = new ConstructionStageDetail("Electric System ", 0, "Detailed installation of the electrical system for the pond.", 1);

        // Add the details to a list (optional if needed)
        List<ConstructionStageDetail> constructionStageDetails = new ArrayList<>();
        constructionStageDetails.add(detail1);
        constructionStageDetails.add(detail2);
        constructionStageDetails.add(detail3);
        constructionStageDetails.add(detail4);
        constructionStageDetails.add(detail5);
        constructionStageDetails.add(detail6);

        ConstructionStageDetail stagePayment = new ConstructionStageDetail("Payment", constructionStageRaw.getConstructionStagePrice(), "payment for" + constructionStageRaw.constructionStageName, 1);
        if (term.isPayOnStartOfConstruction()) {
            constructionStageDetails.add(0, stagePayment);
        } else {
            constructionStageDetails.add(stagePayment);
        }
        return constructionStageDetails;
    }

    public List<ConstructionStageDetail> createListOfDesignStageDetailComplete(ConstructionStage constructionStageComplete, Term term) {

        // Initialize ConstructionStageDetail objects
        // Initialize ConstructionStageDetail objects for Decoration, Testing, and Inspection
        ConstructionStageDetail detail7 = new ConstructionStageDetail("Decoration", 0, "Adding decorative elements like plants and rocks.", 1);
        ConstructionStageDetail detail8 = new ConstructionStageDetail("Testing", 0, "Testing the pond systems.", 1);
        ConstructionStageDetail detail9 = new ConstructionStageDetail("Inspection", 0, "Final inspection of the pond.", 1);

        // Add these details to the list (optional if needed)
        List<ConstructionStageDetail> additionalDetails = new ArrayList<>();
        additionalDetails.add(detail7);
        additionalDetails.add(detail8);
        additionalDetails.add(detail9);
        ConstructionStageDetail stagePayment = new ConstructionStageDetail("Payment", constructionStageComplete.constructionStagePrice, "payment for" + constructionStageComplete.constructionStageName, 1);
        if (term.isPayOnStartOfConstruction()) {
            additionalDetails.add(0, stagePayment);
        } else {
            additionalDetails.add(stagePayment);
        }
        return additionalDetails;
    }

}
