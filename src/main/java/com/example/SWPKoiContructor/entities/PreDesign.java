/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import com.example.SWPKoiContructor.entities.interfaces.HaveImagesFile;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author HP
 */
//tạm xong
@Entity
@Table(name = "Pre_Design")
public class PreDesign implements HaveImagesFile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pre_design_id")
    private Integer preDesignId;
    
    @Column(name = "pre_design_name")
    private String preDesignName;
    
    @Column(name = "pre_design_img_url")
    private String preDesignImgUrl;
    
    @Column(name = "pre_design_description")
    private String preDesignDescription;
    
    @Column(name = "pre_design_status")
    private boolean preDesignStatus;
    
    @Column(name = "pre_design_time")
    private String preDesignTime;
    
    @ManyToOne
    @JoinColumn(name = "package_id")
    private Parcel parcel;
    
    @OneToMany(mappedBy = "predesign")
    private List<Consultant> consultant;

    @OneToOne(mappedBy = "preDesign",fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Content content;

    @OneToMany(mappedBy = "preDesign")
    private List<Project> projects;
    
    public PreDesign() {
    }

    public PreDesign(Integer  preDesignId, String preDesignName, String preDesignImgUrl, String preDesignDescription) {
        this.preDesignId = preDesignId;
        this.preDesignName = preDesignName;
        this.preDesignImgUrl = preDesignImgUrl;
        this.preDesignDescription = preDesignDescription;
        
    }

    public PreDesign(Integer  preDesignId, String preDesignName, String preDesignImgUrl, String preDesignDescription, boolean preDesignStatus, List<Consultant> consultant, Content content) {
        this.preDesignId = preDesignId;
        this.preDesignName = preDesignName;
        this.preDesignImgUrl = preDesignImgUrl;
        this.preDesignDescription = preDesignDescription;
        this.preDesignStatus = preDesignStatus;
        this.consultant = consultant;
        this.content = content;
    }

    public Integer  getPreDesignId() {
        return preDesignId;
    }

    public void setPreDesignId(Integer preDesignId) {
        this.preDesignId = preDesignId;
    }

    public String getPreDesignName() {
        return preDesignName;
    }

    public void setPreDesignName(String preDesignName) {
        this.preDesignName = preDesignName;
    }

    public String getPreDesignImgUrl() {
        return preDesignImgUrl;
    }

    public void setPreDesignImgUrl(String preDesignImgUrl) {
        this.preDesignImgUrl = preDesignImgUrl;
    }

    public String getPreDesignDescription() {
        return preDesignDescription;
    }

    public void setPreDesignDescription(String preDesignDescription) {
        this.preDesignDescription = preDesignDescription;
    }

    public boolean isPreDesignStatus() {
        return preDesignStatus;
    }

    public void setPreDesignStatus(boolean preDesignStatus) {
        this.preDesignStatus = preDesignStatus;
    }

    
    public List<Consultant> getConsultant() {
        return consultant;
    }

    public void setConsultant(List<Consultant> consultant) {
        this.consultant = consultant;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public void addContent(Content content){
        this.content = content;
        content.setPreDesign(this);
    }

    public String getPreDesignTime() {
        return preDesignTime;
    }

    public void setPreDesignTime(String preDesignTime) {
        this.preDesignTime = preDesignTime;
    }

    public Parcel getParcel() {
        return parcel;
    }

    public void setParcel(Parcel parcel) {
        this.parcel = parcel;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }
}
