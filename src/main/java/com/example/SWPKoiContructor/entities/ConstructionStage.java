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
    private int constructionStageId;

    @Column(name = "construction_name")
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

    @OneToMany(mappedBy = "constructionStage")
    private List<ConstructionStageDetail> constructionStageDetail;

    public ConstructionStage(int constructionStageId, String constructionStageName, double constructionStagePrice, String constructionStageDescription, int constructionStageStatus) {
        this.constructionStageId = constructionStageId;
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

    
    
    
    
}
