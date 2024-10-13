/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.ProjectDAO;
import com.example.SWPKoiContructor.dao.ServiceDetailDAO;
import com.example.SWPKoiContructor.dao.StaffDAO;
import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.ServiceDetail;
import com.example.SWPKoiContructor.entities.Staff;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */

@Service
public class StaffService {

    private StaffDAO staffDAO;
    private ProjectDAO projectDAO;
    private ServiceDetailDAO serviceDetailDAO;

    public StaffService(StaffDAO staffDAO, ProjectDAO projectDAO,ServiceDetailDAO serviceDetailDAO) {
        this.staffDAO = staffDAO;
        this.projectDAO = projectDAO;
        this.serviceDetailDAO = serviceDetailDAO;
    }

    public List<Staff> getStaffList() {
        return staffDAO.getListStaff();
    }

    public List<Staff> getStaffListByRole(String department) {
        return staffDAO.getListStaffByRole(department);
    }

    public Staff getStaffById(int id) {
        return staffDAO.getStaffById(id);
    }

    public List<Staff> getTopStaffList() {
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

    public List<Staff> getAllStaffSortedForProject(int projectId, int currentPage, int size, List<String> departments) {
        return staffDAO.getAllStaffSortedForProject(projectId, currentPage, size, departments);
    }

    public List<Staff> searchStaffByNameSortedForProject(String name, int projectId, int currentPage, int size, List<String> departments) {
        return staffDAO.searchStaffByNameSortedForProject(name, projectId, currentPage, size, departments);
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

    public Staff findStaffByEmail(String email) {
        return staffDAO.findStaffByEmail(email);

    }

    public long countStaff() {
        return staffDAO.countStaff();
    }


    public List<Staff> searchConstructionStaffByName(String trim) {
        return staffDAO.searchConstructionStaffByName(trim);
    }

    public List<Staff> getFilterListOfStaff(String name, String email, String department, Boolean status, int page, int size) {
        return staffDAO.getFilterListOfStaff(name, email, department, status, page, size);
    }

    public long countFilterStaff(String name, String email, String department, Boolean status) {
        return staffDAO.countFilterStaff(name, email, department, status);
    }

    @Transactional
    public void createStaff(Staff staff) {
        staffDAO.createStaff(staff);
    }

    @Transactional
    public Staff updateStaff(Staff staff) {
        return staffDAO.updateStaff(staff);

    }


    public long countTotalStaffByDepartmentsForProject(int id, List<String> departments) {
        Project project = projectDAO.getProjectById(id);
        return staffDAO.countTotalStaffByDepartmentsForProject(project, departments);
    }

    public long countTotalStaffByDepartmentsSearchForProject(String trim, int id, List<String> departments) {
        Project project = projectDAO.getProjectById(id);
        return staffDAO.countTotalStaffByDepartmentsSearchForProject(trim, project, departments);
    }

    public long countTotalStaffByDepartmentsForServiceDetail(int id, List<String> departments) {
        ServiceDetail serviceDetail = serviceDetailDAO.getServiceDetailById(id);
        return staffDAO.countTotalStaffByDepartmentsForServiceDetail(serviceDetail, departments);
    }

    public long countTotalStaffByDepartmentsSearchForServiceDetail(String searchTerm, int id, List<String> departments) {
        ServiceDetail serviceDetail = serviceDetailDAO.getServiceDetailById(id);
        return staffDAO.countTotalStaffByDepartmentsSearchForServiceDetail(searchTerm, serviceDetail, departments);
    }

    public List<Staff> getAllStaffSortedForServiceDetail(int serviceDetailId, int currentPage, int size, List<String> departmentFilters) {
        return staffDAO.getAllStaffSortedForServiceDetail(serviceDetailId, currentPage, size, departmentFilters);
    }

    public List<Staff> searchStaffByNameSortedForServiceDetail(String name, int serviceDetailId, int currentPage, int size, List<String> departmentFilters) {
        return staffDAO.searchStaffByNameSortedForServiceDetail(name, serviceDetailId, currentPage, size, departmentFilters);
    }
}
