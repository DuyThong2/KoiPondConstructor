/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "project")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int projectId;

    @Column(name = "project_name")
    private String projectName;

    private String address;

    private String style;

    private String description;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_start")
    private Date dateStart;

    @Temporal(TemporalType.DATE)
    @Column(name = "date_end")
    private Date dateEnd;

    @Column(name = "project_status")
    private int status;

    @Column(name = "img_url")
    private String imgURL;

    @OneToOne(mappedBy = "project",fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Content content;

    private int stage;

    @Column(name = "is_shareable", columnDefinition = "bit default 0")
    private boolean isSharedAble;

    @OneToOne()
    @JoinColumn(name = "contract_id")
    private Contract contract;

    @OneToOne(mappedBy = "project", cascade = CascadeType.ALL, orphanRemoval = true)
    private Construction construction;

    @OneToOne(mappedBy = "project", cascade = CascadeType.ALL, orphanRemoval = true)
    private Design design;

    public Project(String projectName, String address, String style, String description, Date dateStart, Date dateEnd, int status, String imgURL, int stage, boolean isSharedAble) {
        this.projectName = projectName;
        this.address = address;
        this.style = style;
        this.description = description;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.status = status;
        this.imgURL = imgURL;
        
        this.stage = stage;
        this.isSharedAble = isSharedAble;
    }

    public Project() {
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    
   

    public int getStage() {
        return stage;
    }

    public void setStage(int stage) {
        this.stage = stage;
    }

    public boolean isIsSharedAble() {
        return isSharedAble;
    }

    public void setIsSharedAble(boolean isSharedAble) {
        this.isSharedAble = isSharedAble;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Construction getConstruction() {
        return construction;
    }

    public void setConstruction(Construction construction) {
        this.construction = construction;
    }

    public Design getDesign() {
        return design;
    }

    public void setDesign(Design design) {
        this.design = design;
    }

    
    public void addDesign(Design design) {
        this.design = design;
        design.setProject(this);
    }

    public void addConstruction(Construction construction) {
        this.construction = construction;
        construction.setProject(this);
    }

    public void removeDesign(Design design) {
        this.design = null;
        design.setProject(null);
    }

    public void removeConstruction(Construction construction) {
        this.construction = null;
        construction.setProject(null);
    }

    public boolean isProjectBelongToCustomer(Project project, Customer customer) {
        // Assuming the Project has a reference to the customer
        if (project.getContract() != null && project.getContract().getCustomer() != null) {
            if (project.getContract().getCustomer().getId() == customer.getId()) {
                return true;
            }
        }
        return false;
    }

}
