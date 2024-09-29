package com.example.SWPKoiContructor.entities;

import java.util.ArrayList;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Blue_Print")
public class BluePrint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blue_print_id")
    private int BluePrintId;

    private String title;

    @Column(name = "img_url")
    private String imgUrl;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_create")
    private Date dateCreate;

    private String description;

    @Column(name = "blue_print_status")
    private boolean bluePrintStatus;

    @ManyToOne
    @JoinColumn(name = "design_stage_id")
    private DesignStage designStage;

    @OneToMany(mappedBy = "bluePrint", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    public BluePrint() {
    }

    
    public BluePrint(int BluePrintId, String title, String imgUrl, Date dateCreate, String description, boolean bluePrintStatus, DesignStage designStage) {
        this.BluePrintId = BluePrintId;
        this.title = title;
        this.imgUrl = imgUrl;
        this.dateCreate = dateCreate;
        this.description = description;
        this.bluePrintStatus = bluePrintStatus;
        this.designStage = designStage;
    }

    public int getBluePrintId() {
        return BluePrintId;
    }

    public void setBluePrintId(int BluePrintId) {
        this.BluePrintId = BluePrintId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isBluePrintStatus() {
        return bluePrintStatus;
    }

    public void setBluePrintStatus(boolean bluePrintStatus) {
        this.bluePrintStatus = bluePrintStatus;
    }

    public DesignStage getDesignStage() {
        return designStage;
    }

    public void setDesignStage(DesignStage designStage) {
        this.designStage = designStage;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComment(List<Comment> comments) {
        this.comments = comments;
    }

}
