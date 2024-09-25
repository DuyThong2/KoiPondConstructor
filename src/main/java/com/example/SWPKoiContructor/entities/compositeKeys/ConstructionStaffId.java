package com.example.SWPKoiContructor.entities.compositeKeys;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.util.Objects;

@Embeddable
public class ConstructionStaffId implements Serializable {

    @Column(name = "staff_id")
    private int staffId;

    @Column(name = "construction_id")
    private int constructionId;

    // Default constructor
    public ConstructionStaffId() {
    }

    public ConstructionStaffId(int staffId, int constructionId) {
        this.staffId = staffId;
        this.constructionId = constructionId;
    }

    // Getters and setters
    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public int getConstructionId() {
        return constructionId;
    }

    public void setConstructionId(int constructionId) {
        this.constructionId = constructionId;
    }

    // Override equals and hashCode to ensure proper comparison for composite keys
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ConstructionStaffId that = (ConstructionStaffId) o;
        return staffId == that.staffId && constructionId == that.constructionId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(staffId, constructionId);
    }
}
