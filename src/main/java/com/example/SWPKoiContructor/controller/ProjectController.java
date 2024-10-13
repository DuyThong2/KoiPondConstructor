package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.*;
import com.example.SWPKoiContructor.services.ContractService;
import com.example.SWPKoiContructor.services.DesignService;
import com.example.SWPKoiContructor.services.ProjectService;
import com.example.SWPKoiContructor.services.StaffService;
import com.example.SWPKoiContructor.utils.FileUtility;
import com.example.SWPKoiContructor.utils.Utility;

import java.nio.charset.StandardCharsets;
import java.time.LocalDate;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
public class ProjectController {

    private FileUtility fileUtility;
    private ProjectService projectService;
    private ContractService contractService;
    private StaffService staffService;
    private DesignService designService;

    public ProjectController(FileUtility fileUtility, ProjectService projectService, ContractService contractService,StaffService staffService, DesignService designService) {
        this.fileUtility = fileUtility;
        this.projectService = projectService;
        this.contractService = contractService;
        this.staffService= staffService;
    }
    @GetMapping("/manager/projects")

    public String ProjectList(Model model,
    @RequestParam(defaultValue = "1") int page,
    @RequestParam(defaultValue = "5") int size,
    @RequestParam(defaultValue = "status") String sortBy,
    @RequestParam(defaultValue = "asc") String sortType,
                              @RequestParam(required = false) Integer statusFilter,
                              @RequestParam(required = false) Integer stageFilter){
        List<Project> list;
        long projectNum;
        if(stageFilter!=null || statusFilter!=null){
            list = projectService.getPaginationProjectListByStatusAndStage(page,size,sortBy,sortType,statusFilter,stageFilter);
           projectNum =  projectService.countProjectFilter(statusFilter,stageFilter);
        }else{
           list= projectService.getPaginationProjectList(page,size,sortBy,sortType);
           projectNum = projectService.countProject();
        }
        long totalPage= (long) Math.ceil(projectNum/(double)size);
        page = Math.max(page, 1);
        model.addAttribute("currentPage",page);
        model.addAttribute("size",size);
        model.addAttribute("sortBy",sortBy);
        model.addAttribute("sortType",sortType);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("projectList", list);
        model.addAttribute("statusFilter",statusFilter);
        model.addAttribute("stageFilter",stageFilter);
        return "manager/projects/projectManage";
    }
    public boolean isBase64Encoded(String content) {
        try {
            Base64.getDecoder().decode(content);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    @GetMapping("/manager/projects/details/{id}")
    public String projectDetail(@PathVariable("id") int id, Model model) {
        Project project = projectService.getProjectById(id);
        if (project != null) {
            Customer customer = project.getContract().getCustomer();

            String decodedContent = "";
            try {
                String content = project.getContent().getContent().trim();
                decodedContent = new String(Base64.getDecoder().decode(content));
            } catch (IllegalArgumentException e) {
                System.out.println("Error decoding Base64: " + e.getMessage());
                decodedContent = "Error decoding content";
            }
            System.out.println(decodedContent);
            model.addAttribute("customer", customer);
            model.addAttribute("project", project);
            model.addAttribute("decodedContent", decodedContent);
            return "manager/projects/projectDetail";
        } else {
            return "redirect:/manager/projects";
        }
    }

    @GetMapping("/manager/project/create")
    public String createProjectPage(@RequestParam("id") int contractId, Model model) {
        Contract contract = contractService.getContractById(contractId);
        if (contract != null) {
            Project project = new Project();
            model.addAttribute("contract", contract);
            model.addAttribute("project", project);
            return "manager/projects/createProject";
        } else {
            return "redirect:/manager/contracts";
        }
    }
    @PostMapping("/manager/project/create")
    public String createProject(@ModelAttribute("project") Project project) {

        Contract contract = contractService.getContractById(project.getContract().getContractId());
        if (contract != null) {
            project.setContract(contract);
            LocalDate localDate = LocalDate.now();
            project.setDateStart(Utility.localDateToUtilDate(localDate));
            project.setStatus(1);
            project.setStage(1);
            project.setIsSharedAble(false);
            Project newlyCreatedProject = projectService.createProject(project);
            return "redirect:/manager/projects/details/" + newlyCreatedProject.getProjectId();
        } else {
            return "redirect:/manager/contracts";
        }
    }
    @GetMapping("/manager/projects/assign/{id}")
    public String assignStaffPage(
            @PathVariable int id,
            @RequestParam(name = "searchTerm", required = false) String searchTerm,
            @RequestParam(name = "size", required = false, defaultValue = "5") int size,
            @RequestParam(name = "currentPage", required = false, defaultValue = "1") int currentPage,
            Model model) {

        Project project = projectService.getProjectById(id);
        Customer customer = project.getContract().getCustomer();
        List<Staff> designerStaff = new ArrayList<>();
        List<Staff> constructionStaff = new ArrayList<>();
        List<Staff> availableStaff;

        // Load the currently assigned staff members
        if (project.getDesign() != null) {
            designerStaff = project.getDesign().getStaff();
        }

        if (project.getConstruction() != null) {
            constructionStaff = project.getConstruction().getStaff();
        }

        List<String> departments = new ArrayList<>();
        departments.add("construction");
        departments.add("design");

        // Total number of staff that match the search term (or all staff)
        long totalStaff;

        // Fetch all available staff and count total staff
        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            availableStaff = staffService.getAllStaffSortedForProject(id, currentPage, size, departments);
            totalStaff = staffService.countTotalStaffByDepartmentsForProject(id,departments);
        } else {
            availableStaff = staffService.searchStaffByNameSortedForProject(searchTerm.trim(), id, currentPage, size, departments);
            totalStaff = staffService.countTotalStaffByDepartmentsSearchForProject(searchTerm.trim(),id, departments);
        }

        // Calculate the total number of pages
        int totalPage = (int) Math.ceil((double) totalStaff / size);

        // Add data to the model
        model.addAttribute("project", project);
        model.addAttribute("constructionStaff", constructionStaff);
        model.addAttribute("designerStaff", designerStaff);
        model.addAttribute("customer", customer);
        model.addAttribute("availableStaff", availableStaff);
        model.addAttribute("searchTerm", searchTerm);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("size", size);

        return "manager/projects/projectAssignStaff";
    }


    @PostMapping("/updateStage")
    @ResponseBody
    public ResponseEntity<String> updateProjectStage(@RequestParam("projectId") int projectId){
        try{
            projectService.updateProjectStage(projectId);
            return ResponseEntity.ok("Change stage successfully");
        }catch(Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating project stage");
        }
    }
    @GetMapping("/getConstructionStaff")
    @ResponseBody
    public ResponseEntity<?> getConstructionStaff() {
        try {
            List<Staff> constructionStaffList = staffService.getStaffListByRole("Construction");
            return ResponseEntity.ok(constructionStaffList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching construction staff");
        }
    }
    @GetMapping("/getDesignerStaff")
    @ResponseBody
    public ResponseEntity<?> getDesignStaff() {
        try {
            List<Staff> designStaffList = staffService.getStaffListByRole("Design");
            return ResponseEntity.ok(designStaffList);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching design staff");
        }
    }
    @GetMapping("/manager/staff/search")
    public String searchStaff(@RequestParam(name = "searchTerm", required = false) String searchTerm, Model model) {
        List<Staff> staffList;

        try {
            // If searchTerm is empty or null, fetch all staff members for 'design' or 'construction' departments.
            if (searchTerm == null || searchTerm.trim().isEmpty()) {
                staffList = staffService.getAllStaff();  // Ensure that getAllStaff() fetches only Design and Construction staff.
            } else {
                // Fetch staff members that match the search query for 'design' or 'construction' departments.
                staffList = staffService.searchStaffByName(searchTerm.trim());
            }

            // Add the list of staff to the model to render in the JSP page.
            model.addAttribute("staffList", staffList);
            model.addAttribute("searchTerm", searchTerm); // Preserve the search term in the view for better UX.
        } catch (Exception e) {
            // Log the error for debugging purposes (assuming you have a logging framework).
            System.err.println("Error while searching staff: " + e.getMessage());
            model.addAttribute("errorMessage", "Unable to retrieve staff at this time. Please try again later.");
        }

        // Return the view for project staff assignment.
        return "manager/projects/projectAssignStaff";
    }
    @PostMapping("/manager/projects/assignStaff")
    public String assignStaff(@RequestParam("staffId") int staffId,
                              @RequestParam("projectId") int projectId,
                              @RequestParam("role") String role,
                              Model model) {
        try {
            staffService.assignStaffToProject(staffId, projectId, role);
            return "redirect:/manager/projects/assign/" + projectId;
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error assigning staff to project: " + e.getMessage());
            return "manager/projects/projectAssignStaff";
        }
    }
    @PostMapping("/manager/projects/deleteStaff")
    public String deleteStaff(@RequestParam("staffId") int staffId,
                              @RequestParam("projectId") int projectId,
                              @RequestParam("role") String role,
                              Model model) {
        try {
            Project project = projectService.getProjectById(projectId);
            Staff staff = staffService.getStaffById(staffId);
            if(project.getStatus()==3||project.getStatus()==4){
                model.addAttribute("errorMessage", "Can't delete project");
                return "manager/projects/projectAssignStaff";
            }
            if (staff == null) {
                throw new IllegalArgumentException("Staff with ID " + staffId + " not found.");
            }

            if (role.equalsIgnoreCase("design")) {
                if (project.getDesign() == null) {
                    throw new IllegalArgumentException("Project with ID " + projectId + " has no design component.");
                }

                List<Staff> designerStaff = project.getDesign().getStaff();
                if (!designerStaff.remove(staff)) {
                    throw new IllegalArgumentException("Staff with ID " + staffId + " is not assigned as a designer for the project.");
                }

            } else if (role.equalsIgnoreCase("construction")) {
                if (project.getConstruction() == null) {
                    throw new IllegalArgumentException("Project with ID " + projectId + " has no construction component.");
                }

                List<Staff> constructionStaff = project.getConstruction().getStaff();
                if (!constructionStaff.remove(staff)) {
                    throw new IllegalArgumentException("Staff with ID " + staffId + " is not assigned as a construction staff for the project.");
                }

            } else {
                throw new IllegalArgumentException("Invalid role specified: " + role);
            }

            projectService.updateProject(project); // Save the updated project after removing the staff
            return "redirect:/manager/projects/assign/" + projectId;
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "manager/projects/projectAssignStaff";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Unexpected error occurred while removing staff: " + e.getMessage());
            return "manager/projects/projectAssignStaff";
        }
    }
    
    
    


    @GetMapping("/customer/projects/")
    public String customerAssignStaffPage(Model model, HttpSession session, RedirectAttributes redirectAttributes){
        Customer customer = (Customer) session.getAttribute("user");
        if (customer == null) {
            // Nếu chưa đăng nhập, yêu cầu đăng nhập
            redirectAttributes.addFlashAttribute("errorMessage", "Please login to submit feedback.");
            return "redirect:/login";
        }
        List<Project> currentProjects = projectService.getActiveCustomerProjectsById(customer.getId());
        List<Project> completeAndCancelProjects = projectService.getCompleteAndCancelCustomerProjectsById(customer.getId());
        model.addAttribute("currentProjects",currentProjects);
        model.addAttribute("doneProjects",completeAndCancelProjects);
        model.addAttribute("Customer",customer);
        return "customer/projects/projectDetail";
    }
    @PostMapping("/manager/projects/shareProject")

    public ResponseEntity<String> shareProject(Model model,@RequestParam int projectId){
      try{
          Project project = projectService.getProjectById(projectId);
          if (project == null) {
              return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
          }

          if (project.isIsSharedAble()) {
              project.setIsSharedAble(false);
          } else {
              project.setIsSharedAble(true);
          }
          projectService.updateProject(project);
          return ResponseEntity.ok("Changed Successfully");
      }catch(Exception e){
          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
      }
    }
    @PostMapping("/manager/projects/cancelProject")
    public ResponseEntity<String> cancelProject(Model model,@RequestParam int projectId){
        try{
            Project project = projectService.getProjectById(projectId);
            if(project ==null){
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
            if(project.getStatus()!=4&&project.getStatus()!=3){
                project.setStatus(4);
            }else{
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
            }
            if (project.isIsSharedAble()) {
                project.setIsSharedAble(false);
            }
            projectService.updateProject(project);
            return ResponseEntity.ok("Changed Successfully");
        }catch(Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}