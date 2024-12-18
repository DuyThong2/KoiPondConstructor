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

import javax.persistence.OneToOne;

import javax.persistence.Table;

/**
 *
 * @author HP
 */
//Tạm xong
@Entity
@Table(name = "Package")
public class Parcel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "package_id")
    private int packageId;
    
    @Column(name = "package_name")
    private String packageName;
    
    @Column(name = "construction_price_on_square_root")
    private double constructionPriceOnSquareRoot;
    
    @Column(name = "design_on_square_root")
    private double designOnSquareRoot;
    
    @Column(name = "package_description")
    private String packageDescription;
    
    @Column(name = "package_status")
    private boolean package_status;
    
    @OneToMany(mappedBy = "parcel")
    private List<Quotes> quotes;
    
    @OneToMany(mappedBy = "parcel")
    private List<PreDesign> preDesigns;
    
    public Parcel() {
    }

    public Parcel(int packageId, String packageName, double constructionPriceOnSquareRoot, double designOnSquareRoot, String packageDescription, boolean package_status) {
        this.packageId = packageId;
        this.packageName = packageName;
        this.constructionPriceOnSquareRoot = constructionPriceOnSquareRoot;
        this.designOnSquareRoot = designOnSquareRoot;
        this.packageDescription = packageDescription;
        this.package_status = package_status;
        
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public double getConstructionPriceOnSquareRoot() {
        return constructionPriceOnSquareRoot;
    }

    public void setConstructionPriceOnSquareRoot(double constructionPriceOnSquareRoot) {
        this.constructionPriceOnSquareRoot = constructionPriceOnSquareRoot;
    }

    public double getDesignOnSquareRoot() {
        return designOnSquareRoot;
    }

    public void setDesignOnSquareRoot(double designOnSquareRoot) {
        this.designOnSquareRoot = designOnSquareRoot;
    }

    public String getPackageDescription() {
        return packageDescription;
    }

    public void setPackageDescription(String packageDescription) {
        this.packageDescription = packageDescription;
    }

    public boolean isPackage_status() {
        return package_status;
    }

    public void setPackage_status(boolean package_status) {
        this.package_status = package_status;
    }

    public List<Quotes> getQuotes() {
        return quotes;
    }

    public void setQuotes(List<Quotes> quotes) {
        this.quotes = quotes;
    }

    public List<PreDesign> getPreDesigns() {
        return preDesigns;
    }

    public void setPreDesigns(List<PreDesign> preDesigns) {
        this.preDesigns = preDesigns;
    }

    
    
    
}
