/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ProjectDAO;
import com.example.SWPKoiContructor.dao.StaffDAO;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.Staff;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;

/**
 *
 * @author Admin
 */

@Service
public class StaffService {
    
    private StaffDAO staffDAO;
    private ProjectDAO projectDAO;

    public StaffService(StaffDAO staffDAO, ProjectDAO projectDAO) {
        this.staffDAO = staffDAO;
        this.projectDAO = projectDAO;
    }
    public List<Staff> getStaffList(){
        return staffDAO.getListStaff();
    }
    
    public List<Staff> getStaffListByRole(String department){
        return staffDAO.getListStaffByRole(department);
    }
    
    public Staff getStaffById(int id){
        return staffDAO.getStaffById(id);
    }
    public List<Staff> getTopStaffList(){
        return staffDAO.getTopStaffList();
    }

    public List<Staff> getStaffByRoleAndProject(String role, int projectId) {
        // Assuming you have a method in the repository to find staff by role and project ID
        return staffDAO.findByRoleAndProjectId(role, projectId);
    }
    public List<Staff> getAllStaff() {
        return staffDAO.getAllStaff();
    }

    // Method to search staff by name and filter by "design" or "construction" department
    public List<Staff> searchStaffByName(String name) {
        return staffDAO.searchStaffByName(name);
    }
    @Transactional
    public void assignStaffToProject(int staffId, int projectId, String role) {
        Staff staff = staffDAO.getStaffById(staffId);
        Project project = projectDAO.getProjectById(projectId);

        if (staff == null) {
            throw new IllegalArgumentException("Staff with ID " + staffId + " not found.");
        }

        if (project == null) {
            throw new IllegalArgumentException("Project with ID " + projectId + " not found.");
        }

        if (role.equalsIgnoreCase("design")) {
            if (project.getDesign() == null) {
                throw new IllegalArgumentException("Project with ID " + projectId + " has no design component.");
            }
            staffDAO.assignStaffToDesign(staffId, project.getDesign().getDesignId());
        } else if (role.equalsIgnoreCase("construction")) {
            if (project.getConstruction() == null) {
                throw new IllegalArgumentException("Project with ID " + projectId + " has no construction component.");
            }
            staffDAO.assignStaffToConstruction(staffId, project.getConstruction().getConstructionId());
        } else {
            throw new IllegalArgumentException("Invalid role specified: " + role);
        }
    }
    
    public Staff findStaffByEmail(String email){
        return staffDAO.findStaffByEmail(email);

    }
}
