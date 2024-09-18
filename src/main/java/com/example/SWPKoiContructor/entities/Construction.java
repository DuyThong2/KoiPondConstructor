/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author nasaf
 */
@Entity
@Table(name = "Construction")
public class Construction {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int constructionId;
    
    @Column(name = "construction_name")
    private String constructionName;
    
    @Column(name = "construction_status")
    private int constructionStatus;
    
    @OneToMany
    @JoinColumn(name = "project_id")
    private Project project;
    
    @OneToMany(mappedBy = "Construction_Stage")
    private ConstructionStage constructionStage; 

    public Construction(int constructionId, String constructionName, int constructionStatus, Project project, ConstructionStage constructionStage) {
        this.constructionId = constructionId;
        this.constructionName = constructionName;
        this.constructionStatus = constructionStatus;
        this.project = project;
        this.constructionStage = constructionStage;
    }

    public Construction() {
    }

    public int getConstructionId() {
        return constructionId;
    }

    public void setConstructionId(int constructionId) {
        this.constructionId = constructionId;
    }

    public String getConstructionName() {
        return constructionName;
    }

    public void setConstructionName(String constructionName) {
        this.constructionName = constructionName;
    }

    public int getConstructionStatus() {
        return constructionStatus;
    }

    public void setConstructionStatus(int constructionStatus) {
        this.constructionStatus = constructionStatus;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public ConstructionStage getConstructionStage() {
        return constructionStage;
    }

    public void setConstructionStage(ConstructionStage constructionStage) {
        this.constructionStage = constructionStage;
    }

    
    
}
