/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import com.example.SWPKoiContructor.entities.compositeKeys.ConstructionStaffId;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "Staffs")
public class Staff extends User{
    
    private String department;
    @OneToMany(mappedBy = "staff")
    private List<Consultant> consultant;
    
    @OneToMany(mappedBy = "staff")
    private List<Quotes> quotes;
    
    @ManyToMany(mappedBy = "staff")
    private List<Design> design;
    
    @OneToMany(mappedBy = "staff")
    private List<ConstructionStaff> constructionStaffs;
    
    @OneToMany(mappedBy ="staff")
    private List<Blog> blogs;

    @ManyToMany(mappedBy = "staff")
    private List<Comment> comments;
    
    @OneToMany(mappedBy = "staff")
    private List<ServiceQuotes> serviceQuotes;

    public Staff() {
    }


    public Staff(String name, String email, String imgURL, String phone, String password, boolean enable,String department) {
        super(name, email, imgURL, phone, password, enable);
        this.department = department;

    }
    
    public List<Consultant> getConsultant() {
        return consultant;
    }

    public void setConsultant(List<Consultant> consultant) {
        this.consultant = consultant;
    }

    public List<Quotes> getQuotes() {
        return quotes;
    }

    public void setQuotes(List<Quotes> quotes) {
        this.quotes = quotes;
    }


    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public List<Blog> getBlogs() {
        return blogs;
    }

    public void setBlogs(List<Blog> blogs) {
        this.blogs = blogs;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
    
    
    
    

    public List<Design> getDesign() {
        return design;
    }

    public void setDesign(List<Design> design) {
        this.design = design;
    }

    public List<ConstructionStaff> getConstructionStaffs() {
        return constructionStaffs;
    }

    public void setConstructionStaffs(List<ConstructionStaff> constructionStaffs) {
        this.constructionStaffs = constructionStaffs;
    }
  
    public List<ServiceQuotes> getServiceQuotes() {
        return serviceQuotes;
    }

    public void setServiceQuotes(List<ServiceQuotes> serviceQuotes) {
        this.serviceQuotes = serviceQuotes;
    }
    
    
    public void addConstructionToStaff(Construction construction, int roleInProject) {
        ConstructionStaff constructionStaff = new ConstructionStaff(new ConstructionStaffId(this.getId(), construction.getConstructionId()), this, construction, roleInProject);
        this.constructionStaffs.add(constructionStaff);
        construction.getConstructionStaffs().add(constructionStaff);
    }

    // Convenience method to remove a construction
    public void removeConstructionFromStaff(Construction construction) {
        ConstructionStaff constructionStaff = this.constructionStaffs.stream()
            .filter(cs -> cs.getConstruction().equals(construction))
            .findFirst()
            .orElseThrow(() -> new IllegalArgumentException("Construction not assigned to staff"));

        this.constructionStaffs.remove(constructionStaff);
        construction.getConstructionStaffs().remove(constructionStaff);
        constructionStaff.setConstruction(null);
        constructionStaff.setStaff(null);
    }
    
}
