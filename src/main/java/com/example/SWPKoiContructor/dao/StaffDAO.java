/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.entities.ServiceDetail;
import com.example.SWPKoiContructor.entities.Staff;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * <<<<<<< HEAD @a
 *
 *
 * uthor Admin
 */
@Repository
public class StaffDAO {

    private EntityManager entityManager;

    public StaffDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Staff> getListStaff() {
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT s FROM Staff s", Staff.class);
        return tq.getResultList();
    }

    public List<Staff> getListStaffByRole(String department) {
        TypedQuery<Staff> tq = entityManager.createQuery("SELECT s FROM Staff s WHERE s.department = :role", Staff.class);
        tq.setParameter("role", department);
        return tq.getResultList();
    }

    public Staff getStaffById(int id) {
        try {
            TypedQuery<Staff> tq = entityManager.createQuery("SELECT s FROM Staff s WHERE s.id = :id", Staff.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null; // Return empty if no customer is found
        }

    }

    public List<Staff> getTopStaffList() {
        TypedQuery<String> typedQuery = entityManager.createQuery("Select distinct c.department From Staff c", String.class);
        List<String> roleList = typedQuery.getResultList();
        List<Staff> listStaff = new ArrayList<>();
        roleList.forEach(role -> {
            List<Staff> staffList = getListStaffByRole(role);
            Staff staff = staffList.get(0);
            listStaff.add(staff);
        });
        return listStaff;
    }
    public Staff createStaff(Staff staff) {
        Staff createStaff = entityManager.merge(staff);
        return createStaff;
    }

    public Staff updateStaff(Staff staff) {
        return entityManager.merge(staff);
    }

    public void removeStaff(int id) {
        Staff removeStaff = getStaffById(id);
        entityManager.remove(removeStaff);
    }

    public Staff findStaffByEmail(String email) {
        try {
            TypedQuery<Staff> tq = entityManager.createQuery("SELECT s from Staff s where s.email = :email", Staff.class);
            tq.setParameter("email", email);
            Staff result = tq.getSingleResult();
            System.out.println(result);
            return result;
        } catch (NoResultException e) {
            return null; // Return empty if no customer is found
        }
    }

    public long countStaff() {
        TypedQuery<Long> query = entityManager.createQuery("SELECT COUNT(s) FROM Staff s where s.enabled = true", Long.class);
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }

    public List<Staff> findByRoleAndProjectId(String role, int projectId) {
        TypedQuery<Staff> query = entityManager.createQuery(
                "SELECT s FROM Staff s WHERE s.department = :role AND s.project.id = :projectId", Staff.class);
        query.setParameter("role", role);
        query.setParameter("projectId", projectId);
        return query.getResultList();
    }

    public List<Staff> getAllStaff() {
        String query = "SELECT s FROM Staff s WHERE LOWER(s.department) IN ('design', 'construction')";
        TypedQuery<Staff> typedQuery = entityManager.createQuery(query, Staff.class);
        return typedQuery.getResultList();
    }
    
    public List<Staff> getAllConsultantStaff(int page, int size, String searchName ){
         StringBuilder queryStr = new StringBuilder("SELECT s FROM Staff s WHERE LOWER(s.department) = 'consulting'");

        // Dynamic query construction
        if (searchName != null && !searchName.isEmpty()) {
            queryStr.append(" AND LOWER(s.name) LIKE :searchName");
        }

        // Creating the query
        TypedQuery<Staff> query = entityManager.createQuery(queryStr.toString(), Staff.class);

        // Setting parameters dynamically       
        
        if (searchName != null && !searchName.isEmpty()) {
            query.setParameter("searchName", "%" + searchName.toLowerCase() + "%");
        }
        // Pagination
        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }
    
    public long countAllConsultantStaff(int page, int size, String searchName ){
         StringBuilder queryStr = new StringBuilder("SELECT COUNT(s) FROM Staff s WHERE LOWER(s.department) = 'consulting'");

        // Dynamic query construction
        if (searchName != null && !searchName.isEmpty()) {
            queryStr.append(" AND LOWER(s.name) LIKE :searchName");
        }

        // Creating the query
        TypedQuery<Long> query = entityManager.createQuery(queryStr.toString(), Long.class);

        // Setting parameters dynamically       
        
        if (searchName != null && !searchName.isEmpty()) {
            query.setParameter("searchName", "%" + searchName.toLowerCase() + "%");
        }
        

        return query.getSingleResult();
    }
    
    
    
    public List<Staff> getAllStaffSortedForProject(int projectId, int currentPage, int size, List<String> departmentFilters) {
        // Get the project by its ID to find the assigned staff
        ProjectDAO projectDAO = new ProjectDAO(entityManager);
        Project project = projectDAO.getProjectById(projectId);

        // Retrieve the assigned staff (designer + construction)
        List<Staff> assignedStaff = new ArrayList<>();
        if (project.getDesign() != null) {
            assignedStaff.addAll(project.getDesign().getStaff());
        }
        if (project.getConstruction() != null) {
            assignedStaff.addAll(project.getConstruction().getStaff());
        }

        // Retrieve all staff members
        String queryStr = "SELECT s FROM Staff s";
        if(departmentFilters!=null && !departmentFilters.isEmpty()){
            queryStr += " WHERE LOWER(s.department) IN :departments";
        }
        if(assignedStaff!=null && !assignedStaff.isEmpty()){
            queryStr += " AND LOWER(s.name) NOT IN :names";

        }
        TypedQuery<Staff> query = entityManager.createQuery(queryStr, Staff.class);
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            List<String> lowerCaseDepartments = departmentFilters.stream().collect(Collectors.toList());
            query.setParameter("departments", lowerCaseDepartments);
        }
        if(assignedStaff!=null && !assignedStaff.isEmpty()) {
            List<String> lowerCaseAssignedStaff= assignedStaff.stream()
                            .map(staff->staff.getName().toLowerCase())
                    .collect(Collectors.toList());
            query.setParameter("names",lowerCaseAssignedStaff);
        }

            // Apply pagination logic
        int firstResult = (currentPage - 1) * size;
        query.setFirstResult(firstResult);
        query.setMaxResults(size);

        List<Staff> allStaff = query.getResultList();



        return allStaff;
    }
    public List<Staff> searchStaffByNameSortedForProject(String name, int projectId, int currentPage, int size, List<String> departmentFilters) {
        ProjectDAO projectDAO = new ProjectDAO(entityManager);
        Project project = projectDAO.getProjectById(projectId);
        List<Staff> assignedStaff = new ArrayList<>();

        // Retrieve assigned staff
        if (project != null && project.getDesign() != null) {
            assignedStaff.addAll(project.getDesign().getStaff());
        }
        if (project != null && project.getConstruction() != null) {
            assignedStaff.addAll(project.getConstruction().getStaff());
        }

        // Build the base query for staff search
        String jpaQuery = "SELECT s FROM Staff s WHERE LOWER(s.name) LIKE :name";

        // Add department filter if provided (list of departments)
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            jpaQuery += " AND LOWER(s.department) IN (:departments)";
        }
        if(assignedStaff!=null && !assignedStaff.isEmpty()){
            jpaQuery += " AND LOWER(s.name) NOT IN :names";
        }
        // Create the query
        TypedQuery<Staff> query = entityManager.createQuery(jpaQuery, Staff.class);
        query.setParameter("name", "%" + name.toLowerCase() + "%");

        // Set the department filter parameter (if provided)
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            query.setParameter("departments", departmentFilters.stream().map(String::toLowerCase).collect(Collectors.toList()));
        }
        if(assignedStaff!=null && !assignedStaff.isEmpty()) {
            List<String> lowerCaseAssignedStaff= assignedStaff.stream()
                    .map(staff->staff.getName().toLowerCase())
                    .collect(Collectors.toList());
            query.setParameter("names",lowerCaseAssignedStaff);
        }
        // Apply pagination logic
        int firstResult = (currentPage - 1) * size;
        query.setFirstResult(firstResult);
        query.setMaxResults(size);

        // Fetch the result list
        List<Staff> allStaffList = query.getResultList();


        return allStaffList;
    }

    // Get the project by its ID to find the assigned staff
    // Method to search staff by name and filter by "design" or "construction" department
    public List<Staff> searchStaffByName(String name) {
        String query = "SELECT s FROM Staff s WHERE LOWER(s.department) IN ('design', 'construction')";
        if (name != null && !name.isEmpty()) {
            query += " AND LOWER(s.name) LIKE :name";
        }
        TypedQuery<Staff> typedQuery = entityManager.createQuery(query, Staff.class);

        if (name != null && !name.isEmpty()) {
            typedQuery.setParameter("name", "%" + name.toLowerCase() + "%");
        }

        return typedQuery.getResultList();
    }

    public void assignStaffToConstruction(int staffId, int constructionId) {
        try {
            entityManager.createNativeQuery(
                    "INSERT INTO Construction_Staff (staff_id, construction_id, role_in_project) VALUES (:staffId, :constructionId, :roleInProject)")
                    .setParameter("staffId", staffId)
                    .setParameter("constructionId", constructionId)
                    .setParameter("roleInProject", 1) // Assigning the value 1 directly
                    .executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Failed to assign staff to construction: " + e.getMessage(), e);
        }
    }

    public void assignStaffToDesign(int staffId, int designId) {
        try {
            entityManager.createNativeQuery(
                    "INSERT INTO Staff_Design (staff_id, design_id) VALUES (:staffId, :designId)")
                    .setParameter("staffId", staffId)
                    .setParameter("designId", designId)
                    .executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException("Failed to assign staff to design: " + e.getMessage(), e);
        }
    }



    public List<Staff> searchConstructionStaffByName(String name) {
        String query = "SELECT s FROM Staff s WHERE LOWER(s.department) IN ('construction')";
        if (name != null && !name.isEmpty()) {
            query += " AND LOWER(s.name) LIKE :name";
        }
        TypedQuery<Staff> typedQuery = entityManager.createQuery(query, Staff.class);

        if (name != null && !name.isEmpty()) {
            typedQuery.setParameter("name", "%" + name.toLowerCase() + "%");
        }

        return typedQuery.getResultList();
    }

    public List<Staff> getFilterListOfStaff(String name, String email, String department, Boolean status, int page, int size) {
        StringBuilder queryBuilder = new StringBuilder("SELECT s FROM Staff s WHERE 1 = 1");
        if (name != null && !name.isEmpty()) {
            queryBuilder.append(" AND s.name LIKE :name");
        }
        if (email != null && !email.isEmpty()) {
            queryBuilder.append(" AND s.email LIKE :email");
        }
        if (department != null && !department.isEmpty()) {
            queryBuilder.append(" AND s.department LIKE :department");
        }
        if (status != null) {
            queryBuilder.append(" AND s.enabled = :enabled");
        }

        queryBuilder.append(" ORDER BY s.department asc");
        TypedQuery<Staff> query = entityManager.createQuery(queryBuilder.toString(), Staff.class);
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (email != null && !email.isEmpty()) {
            query.setParameter("email", "%" + email + "%");
        }
        if (department != null && !department.isEmpty()) {
            query.setParameter("department", "%" + department + "%");
        }

        if (status != null) {
            query.setParameter("enabled", status);
        }

        query.setFirstResult(page * size);
        query.setMaxResults(size);

        return query.getResultList();
    }

    public long countFilterStaff(String name, String email, String department, Boolean status) {
        StringBuilder queryBuilder = new StringBuilder("SELECT count(s) FROM Staff s WHERE 1 = 1 ");
        if (name != null && !name.isEmpty()) {
            queryBuilder.append(" AND s.name LIKE :name");
        }
        if (email != null && !email.isEmpty()) {
            queryBuilder.append(" AND s.email LIKE :email");
        }
        if (department != null && !department.isEmpty()) {
            queryBuilder.append(" AND s.department LIKE :department");
        }
        if (status != null) {
            queryBuilder.append(" AND s.enabled = :enabled");
        }

        TypedQuery<Long> query = entityManager.createQuery(queryBuilder.toString(), Long.class);

        if (email != null && !email.isEmpty()) {
            query.setParameter("email", "%" + email + "%");
        }
        if (name != null && !name.isEmpty()) {
            query.setParameter("name", "%" + name + "%");
        }
        if (department != null && !department.isEmpty()) {
            query.setParameter("department", "%" + department + "%");
        }

        if (status != null) {
            query.setParameter("enabled", status);
        }
        Long result = query.getSingleResult();

        // Nếu kết quả là null (không có điểm), trả về 0
        return result != null ? result : 0L;
    }


    public long countTotalStaffByDepartmentsForProject(Project project, List<String> departments) {
        String queryStr = "SELECT COUNT(s) FROM Staff s WHERE s.enabled = true AND LOWER(s.department) IN :departments AND LOWER(s.name) NOT IN :names";
        List<Staff> staff = new ArrayList<>();
        List<String> staffName ;
        List<String> lowerCaseDepartments =departments.stream().map(String::toLowerCase).collect(Collectors.toList());
        if(project!=null && project.getDesign()!=null){
            staff.addAll(project.getDesign().getStaff());
        }
        if(project!=null && project.getConstruction()!=null){
            staff.addAll(project.getConstruction().getStaff());
        }
        staffName = staff.stream().map(s-> s.getName().toLowerCase()).collect(Collectors.toList());

        TypedQuery<Long> query = entityManager.createQuery(queryStr, Long.class);

        query.setParameter("departments",lowerCaseDepartments );
        query.setParameter("names",staffName);
        return query.getSingleResult();
    }

    public long countTotalStaffByDepartmentsSearchForProject(String trim,Project project, List<String> departments) {
        String queryStr = "SELECT COUNT(s) FROM Staff s WHERE s.enabled = true AND LOWER(s.department) IN :departments AND LOWER(s.name) LIKE :name AND LOWER(s.name) NOT IN :names";
        List<Staff> staff = new ArrayList<>();
        List<String> staffName ;
        List<String> lowerCaseDepartments =departments.stream().map(String::toLowerCase).collect(Collectors.toList());
        if(project!=null && project.getDesign()!=null){
            staff.addAll(project.getDesign().getStaff());
        }
        if(project!=null && project.getConstruction()!=null){
            staff.addAll(project.getConstruction().getStaff());
        }
        staffName = staff.stream().map(s-> s.getName().toLowerCase()).collect(Collectors.toList());
        TypedQuery<Long> query = entityManager.createQuery(queryStr, Long.class);
        query.setParameter("departments", departments.stream().map(String::toLowerCase).collect(Collectors.toList()));
        query.setParameter("name", "%" + trim.toLowerCase() + "%");
        query.setParameter("names",staffName);

        return query.getSingleResult();
    }
    public long countTotalStaffByDepartmentsForServiceDetail(ServiceDetail serviceDetail, List<String> departments) {
        // Adjusted to handle cases where no staff is present
        String queryStr = "SELECT COUNT(s) FROM Staff s WHERE LOWER(s.department) IN :departments";

        // Only apply the "NOT IN" clause if staff is actually assigned
        if (serviceDetail != null && serviceDetail.getStaff() != null) {
            queryStr += " AND LOWER(s.name) NOT IN :names";
        }

        List<String> staffName = new ArrayList<>();
        if (serviceDetail != null && serviceDetail.getStaff() != null) {
            staffName.add(serviceDetail.getStaff().getName().toLowerCase());
        }

        TypedQuery<Long> query = entityManager.createQuery(queryStr, Long.class);
        query.setParameter("departments", departments.stream().map(String::toLowerCase).collect(Collectors.toList()));

        if (!staffName.isEmpty()) {
            query.setParameter("names", staffName);
        }

        return query.getSingleResult();
    }
    public long countTotalStaffByDepartmentsSearchForServiceDetail(String searchTerm, ServiceDetail serviceDetail, List<String> departments) {
        String queryStr = "SELECT COUNT(s) FROM Staff s WHERE LOWER(s.department) IN :departments AND LOWER(s.name) LIKE :name AND LOWER(s.name) NOT IN :names";
        List<Staff> assignedStaff = new ArrayList<>();
        List<String> assignedStaffNames;

        List<String> lowerCaseDepartments = departments.stream()
                .map(String::toLowerCase)
                .collect(Collectors.toList());

        // Add the currently assigned staff to the list
        if (serviceDetail != null && serviceDetail.getStaff() != null) {
            assignedStaff.add(serviceDetail.getStaff());
        }

        assignedStaffNames = assignedStaff.stream()
                .map(staff -> staff.getName().toLowerCase())
                .collect(Collectors.toList());

        TypedQuery<Long> query = entityManager.createQuery(queryStr, Long.class);
        query.setParameter("departments", lowerCaseDepartments);
        query.setParameter("name", "%" + searchTerm.toLowerCase() + "%");
        query.setParameter("names", assignedStaffNames);

        return query.getSingleResult();
    }
    public List<Staff> getAllStaffSortedForServiceDetail(int serviceDetailId, int currentPage, int size, List<String> departmentFilters) {
        // Get the service detail by its ID to find the assigned staff
        ServiceDetailDAO serviceDetailDAO = new ServiceDetailDAO(entityManager);
        ServiceDetail serviceDetail = serviceDetailDAO.getServiceDetailById(serviceDetailId);

        // Retrieve the assigned staff (for the construction or service detail)
        List<Staff> assignedStaff = new ArrayList<>();
        if (serviceDetail.getStaff() != null) {
            assignedStaff.add(serviceDetail.getStaff());
        }

        // Retrieve all staff members
        String queryStr = "SELECT s FROM Staff s WHERE s.enabled = true";
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            queryStr += " AND LOWER(s.department) IN :departments";
        }
        if (assignedStaff != null && !assignedStaff.isEmpty()) {
            queryStr += " AND LOWER(s.name) NOT IN :names";
        }


        TypedQuery<Staff> query = entityManager.createQuery(queryStr, Staff.class);
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            List<String> lowerCaseDepartments = departmentFilters.stream()
                    .map(String::toLowerCase)
                    .collect(Collectors.toList());
            query.setParameter("departments", lowerCaseDepartments);
        }
        if (assignedStaff != null && !assignedStaff.isEmpty()) {
            List<String> lowerCaseAssignedStaff = assignedStaff.stream()
                    .map(staff -> staff.getName().toLowerCase())
                    .collect(Collectors.toList());
            query.setParameter("names", lowerCaseAssignedStaff);
        }

        // Apply pagination logic
        int firstResult = (currentPage - 1) * size;
        query.setFirstResult(firstResult);
        query.setMaxResults(size);

        List<Staff> allStaff = query.getResultList();

        return allStaff;
    }
    public List<Staff> searchStaffByNameSortedForServiceDetail(String name, int serviceDetailId, int currentPage, int size, List<String> departmentFilters) {
        ServiceDetailDAO serviceDetailDAO = new ServiceDetailDAO(entityManager);
        ServiceDetail serviceDetail = serviceDetailDAO.getServiceDetailById(serviceDetailId);
        List<Staff> assignedStaff = new ArrayList<>();

        // Retrieve assigned staff
        if (serviceDetail != null && serviceDetail.getStaff() != null) {
            assignedStaff.add(serviceDetail.getStaff());
        }

        // Build the base query for staff search
        String jpaQuery = "SELECT s FROM Staff s WHERE s.enabled = true AND LOWER(s.name) LIKE :name";
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            jpaQuery += " AND LOWER(s.department) IN (:departments)";
        }
        if (assignedStaff != null && !assignedStaff.isEmpty()) {
            jpaQuery += " AND LOWER(s.name) NOT IN :names";
        }

        // Create the query
        TypedQuery<Staff> query = entityManager.createQuery(jpaQuery, Staff.class);
        query.setParameter("name", "%" + name.toLowerCase() + "%");

        // Set the department filter parameter (if provided)
        if (departmentFilters != null && !departmentFilters.isEmpty()) {
            query.setParameter("departments", departmentFilters.stream().map(String::toLowerCase).collect(Collectors.toList()));
        }
        if (assignedStaff != null && !assignedStaff.isEmpty()) {
            List<String> lowerCaseAssignedStaff = assignedStaff.stream()
                    .map(staff -> staff.getName().toLowerCase())
                    .collect(Collectors.toList());
            query.setParameter("names", lowerCaseAssignedStaff);
        }

        // Apply pagination logic
        int firstResult = (currentPage - 1) * size;
        query.setFirstResult(firstResult);
        query.setMaxResults(size);

        // Fetch the result list
        List<Staff> allStaffList = query.getResultList();

        return allStaffList;
    }

}
