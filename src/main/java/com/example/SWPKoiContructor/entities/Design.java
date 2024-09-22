package com.example.SWPKoiContructor.entities;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Design")
public class Design {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "design_id")
    private int designId;
    
    @Column(name = "design_name")
    private String designName;
    
    @Column(name = "design_status")
    private int status;
    
    @OneToOne()
    @JoinColumn(name = "project_id")
    private Project project;
    
    @OneToMany(mappedBy = "design", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DesignStage> designStage;
    
    
    
    public Design() {
    }

    public Design(int designId, String designName, int status) {
        this.designId = designId;
        this.designName = designName;
        this.status = status;
    }

    public int getDesignId() {
        return designId;
    }

    public void setDesignId(int designId) {
        this.designId = designId;
    }

    public String getDesignName() {
        return designName;
    }

    public void setDesignName(String designName) {
        this.designName = designName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<DesignStage> getDesignStage() {
        return designStage;
    }

    public void setDesignStage(List<DesignStage> designStage) {
        this.designStage = designStage;
    }
    
    //convinience method
    public void addDesignStage(DesignStage designStage){
        this.designStage.add(designStage);
        designStage.setDesign(this);
    }
    
    public void removeDesignStage(DesignStage designStage){
        this.designStage.remove(designStage);
        designStage.setDesign(null);
    }
    
    
    
    
}
