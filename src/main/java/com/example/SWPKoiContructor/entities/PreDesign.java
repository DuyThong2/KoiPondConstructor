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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HP
 */
//tạm xong
@Entity
@Table(name = "Pre_Design")
public class PreDesign {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pre_design_id")
    private int preDesignId;
    
    @Column(name = "pre_design_name")
    private String preDesignName;
    
    @Column(name = "pre_design_img_url")
    private String preDesignImgUrl;
    
    @Column(name = "pre_design_description")
    private String preDesignDescription;
    
    @OneToMany(mappedBy = "predesign")
    private List<Consultant> consultant;

    public PreDesign() {
    }

    public PreDesign(int preDesignId, String preDesignName, String preDesignImgUrl, String preDesignDescription) {
        this.preDesignId = preDesignId;
        this.preDesignName = preDesignName;
        this.preDesignImgUrl = preDesignImgUrl;
        this.preDesignDescription = preDesignDescription;
        
    }

    public int getPreDesignId() {
        return preDesignId;
    }

    public void setPreDesignId(int preDesignId) {
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

    public List<Consultant> getConsultant() {
        return consultant;
    }

    public void setConsultant(List<Consultant> consultant) {
        this.consultant = consultant;
    }

    
    
    
}
