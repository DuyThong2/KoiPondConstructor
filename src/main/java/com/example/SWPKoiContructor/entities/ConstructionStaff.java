package com.example.SWPKoiContructor.entities;

import com.example.SWPKoiContructor.entities.compositeKeys.ConstructionStaffId;
import javax.persistence.*;

@Entity
@Table(name = "Construction_Staff")
public class ConstructionStaff {

    @EmbeddedId
    private ConstructionStaffId id;

    @ManyToOne
    @MapsId("staffId")
    @JoinColumn(name = "staff_id")
    private Staff staff;

    @ManyToOne
    @MapsId("constructionId")
    @JoinColumn(name = "construction_id")
    private Construction construction;

    @Column(name = "role_in_project")
    private Integer roleInProject; // 1: Site Manager, 2: Supervisor, 3: Worker

    // Default constructor
    public ConstructionStaff() {
    }

    public ConstructionStaff(ConstructionStaffId id, Staff staff, Construction construction, Integer roleInProject) {
        this.id = id;
        this.staff = staff;
        this.construction = construction;
        this.roleInProject = roleInProject;
    }

    // Getters and setters
    public ConstructionStaffId getId() {
        return id;
    }

    public void setId(ConstructionStaffId id) {
        this.id = id;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Construction getConstruction() {
        return construction;
    }

    public void setConstruction(Construction construction) {
        this.construction = construction;
    }

    public Integer getRoleInProject() {
        return roleInProject;
    }

    public void setRoleInProject(int roleInProject) {
        this.roleInProject = roleInProject;
    }
}
