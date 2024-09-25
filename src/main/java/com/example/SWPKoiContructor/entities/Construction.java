/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import com.example.SWPKoiContructor.entities.compositeKeys.ConstructionStaffId;
import java.util.ArrayList;
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
    
    @OneToOne
    @JoinColumn(name = "project_id")
    private Project project;
    
    @OneToMany(mappedBy = "construction", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ConstructionStage> constructionStage = new ArrayList<>(); 
    
    @OneToMany(mappedBy = "construction", cascade = CascadeType.ALL)
    private List<ConstructionStaff> constructionStaffs;

    public Construction(int constructionId, String constructionName, int constructionStatus) {
        this.constructionId = constructionId;
        this.constructionName = constructionName;
        this.constructionStatus = constructionStatus;
    }

    public Construction(String constructionName, int constructionStatus) {
        this.constructionName = constructionName;
        this.constructionStatus = constructionStatus;
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

    public List<ConstructionStage> getConstructionStage() {
        return constructionStage;
    }

    public void setConstructionStage(List<ConstructionStage> constructionStage) {
        this.constructionStage = constructionStage;
    }
    
    public List<ConstructionStaff> getConstructionStaffs() {
        return constructionStaffs;
    }

    public void setConstructionStaffs(List<ConstructionStaff> constructionStaffs) {
        this.constructionStaffs = constructionStaffs;
    }

    //Convinience method
   
    public void addConstructionStage(ConstructionStage constructionStage){
        
        this.constructionStage.add(constructionStage);
        constructionStage.setConstruction(this);
    }
    
    public void removeConstructionStage(ConstructionStage constructionStage){
        this.constructionStage.remove(constructionStage);
        constructionStage.setConstruction(null);
    }
    
    public List<ConstructionStage> createListOfConstructionStage(Project project){
        Term term = project.getContract().getTerm();
        Contract contract = project.getContract();
        ConstructionStage raw = null;
        ConstructionStage complete = null;
       
        if (term.isFollowContract()){
            raw = new ConstructionStage("Raw Construction",contract.getPriceOnConceptDesign(),
                    "Complete raw construction phase: site preparation, excavation, liner install, etc.",1);
            complete = new ConstructionStage("Complete Construction",contract.getPriceOnConceptDesign(),
                    "Complete finishing phase: decoration, testing, inspection, etc.",1);
           
            
        }else{
            double contractCost = contract.getTotalPrice();
            raw = new ConstructionStage("Raw Construction",term.getPercentOnConstruct1()*contractCost,
                    "Complete raw construction phase: site preparation, excavation, liner install, etc.",1);
            complete = new ConstructionStage("Complete Construction",term.getPercentOnConstruct2()*contractCost ,
                    "Complete finishing phase: decoration, testing, inspection, etc.",1);
           
        }
        
        List<ConstructionStage> result = new ArrayList<>();
        result.add(raw);
        result.add(complete);
       
        return result;
    }

    public void addConstructionStaff(Staff staff, int roleInProject) {
        ConstructionStaff constructionStaff = new ConstructionStaff(new ConstructionStaffId(staff.getId(), this.constructionId), staff, this, roleInProject);
        this.constructionStaffs.add(constructionStaff);
        staff.getConstructionStaffs().add(constructionStaff); // Add to Staff entity's list if required
    }

    // Convenience method to remove a staff member from construction
    public void removeConstructionStaff(Staff staff) {
        // Find the ConstructionStaff object by staff
        ConstructionStaff constructionStaff = this.constructionStaffs.stream()
            .filter(cs -> cs.getStaff().equals(staff))
            .findFirst()
            .orElseThrow(() -> new IllegalArgumentException("Staff not assigned to construction"));

        this.constructionStaffs.remove(constructionStaff);
        staff.getConstructionStaffs().remove(constructionStaff); // Remove from Staff entity's list if required
        constructionStaff.setConstruction(null); // Break bidirectional relationship
        constructionStaff.setStaff(null); // Break bidirectional relationship
    }

    public boolean isStaffAssignedToConstruction(Staff staff, Construction construction) {
        if (staff == null || construction == null) {
            return false;
        }

        // Iterate over the constructionStaffs list to see if the staff is assigned to the construction
        for (ConstructionStaff constructionStaff : construction.getConstructionStaffs()) {
            if (constructionStaff.getStaff().equals(staff)) {
                return true;
            }
        }

        return false; // Staff is not assigned to the construction
    }
    
    

    
    
    
}
