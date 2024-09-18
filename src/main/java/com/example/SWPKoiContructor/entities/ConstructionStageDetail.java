/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author nasaf
 */
@Entity
@Table(name = "Construction_Stage_Detail")
public class ConstructionStageDetail {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int constructionStageDetailId;
    
    @Column(name = "construction_stage_detail_name")
    private String constructionStageDetailName;
    
    @Column(name = "construction_stage_detail_price")
    private double constructionStageDetailPrice;
    
    @Column(name = "construction_stage_detail_description")
    private String constructionStageDetailDescription;
    
    @Column(name = "construction_stage_detail_status")
    private int constructionStageDetailStatus;
    
    @ManyToOne
    @JoinColumn(name = "construction_stage_detail_id")
    private ConstructionStage constructionStage;

    public ConstructionStageDetail(int constructionStageDetailId, String constructionStageDetailName, double constructionStageDetailPrice, String constructionStageDetailDescription, int constructionStageDetailStatus, ConstructionStage constructionStage) {
        this.constructionStageDetailId = constructionStageDetailId;
        this.constructionStageDetailName = constructionStageDetailName;
        this.constructionStageDetailPrice = constructionStageDetailPrice;
        this.constructionStageDetailDescription = constructionStageDetailDescription;
        this.constructionStageDetailStatus = constructionStageDetailStatus;
        this.constructionStage = constructionStage;
    }

    public ConstructionStageDetail() {
    }

    public int getConstructionStageDetailId() {
        return constructionStageDetailId;
    }

    public void setConstructionStageDetailId(int constructionStageDetailId) {
        this.constructionStageDetailId = constructionStageDetailId;
    }

    public String getConstructionStageDetailName() {
        return constructionStageDetailName;
    }

    public void setConstructionStageDetailName(String constructionStageDetailName) {
        this.constructionStageDetailName = constructionStageDetailName;
    }

    public double getConstructionStageDetailPrice() {
        return constructionStageDetailPrice;
    }

    public void setConstructionStageDetailPrice(double constructionStageDetailPrice) {
        this.constructionStageDetailPrice = constructionStageDetailPrice;
    }

    public String getConstructionStageDetailDescription() {
        return constructionStageDetailDescription;
    }

    public void setConstructionStageDetailDescription(String constructionStageDetailDescription) {
        this.constructionStageDetailDescription = constructionStageDetailDescription;
    }

    public int getConstructionStageDetailStatus() {
        return constructionStageDetailStatus;
    }

    public void setConstructionStageDetailStatus(int constructionStageDetailStatus) {
        this.constructionStageDetailStatus = constructionStageDetailStatus;
    }

    public ConstructionStage getConstructionStage() {
        return constructionStage;
    }

    public void setConstructionStage(ConstructionStage constructionStage) {
        this.constructionStage = constructionStage;
    }
    
    
    
}
