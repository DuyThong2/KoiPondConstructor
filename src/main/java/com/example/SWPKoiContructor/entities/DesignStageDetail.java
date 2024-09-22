package com.example.SWPKoiContructor.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Design_Stage_Detail")
public class DesignStageDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "status")
    private int status; //-- 1:Pending ; 2:Proccessing; 3: completed/ 4: Canceled

    @ManyToOne()
    @JoinColumn(name = "design_stage_id")
    private DesignStage designStage;
    
    
    
    public DesignStageDetail() {
    }

    public DesignStageDetail(int id, String name, String description, int status, DesignStage designStage) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.status = status;
        this.designStage = designStage;
    }
    


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public DesignStage getDesignStage() {
        return designStage;
    }

    public void setDesignStage(DesignStage designStage) {
        this.designStage = designStage;
    }
    
    
    
    
}

	