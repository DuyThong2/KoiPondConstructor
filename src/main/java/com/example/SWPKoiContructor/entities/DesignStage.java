package com.example.SWPKoiContructor.entities;

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


@Entity
@Table(name = "Design_Stage")
public class DesignStage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "design_stage_id")
    private int designStageId;
    
    @Column(name = "design_stage_name")
    private String designStageName;
    
    @Column(name = "design_stage_status")
    private int designStageStatus;
    
    @Column(name = "design_stage_price")
    private double designStagePrice;
    
    @Column(name = "summary_file")
    private String summaryFile;
    
    @ManyToOne()
    @JoinColumn(name = "design_id")
    private Design design;
    
    @OneToMany(mappedBy = "designStage")
    private List<DesignStageDetail> designDetail;
    
    @OneToMany(mappedBy = "designStage")
    private List<BluePrint> bluePrint;
    
    public DesignStage() {
    }

    public DesignStage(int designStageId, String designStageName, int designStageStatus, double designStagePrice, String summaryFile) {
        this.designStageId = designStageId;
        this.designStageName = designStageName;
        this.designStageStatus = designStageStatus;
        this.designStagePrice = designStagePrice;
        this.summaryFile = summaryFile;
    }

    public int getDesignStageId() {
        return designStageId;
    }

    public void setDesignStageId(int designStageId) {
        this.designStageId = designStageId;
    }

    public String getDesignStageName() {
        return designStageName;
    }

    public void setDesignStageName(String designStageName) {
        this.designStageName = designStageName;
    }

    public int getDesignStageStatus() {
        return designStageStatus;
    }

    public void setDesignStageStatus(int designStageStatus) {
        this.designStageStatus = designStageStatus;
    }

    public double getDesignStagePrice() {
        return designStagePrice;
    }

    public void setDesignStagePrice(double designStagePrice) {
        this.designStagePrice = designStagePrice;
    }

    public String getSummaryFile() {
        return summaryFile;
    }

    public void setSummaryFile(String summaryFile) {
        this.summaryFile = summaryFile;
    }
    
    
}
