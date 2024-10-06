/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.configs;

import com.example.SWPKoiContructor.entities.Project;
import com.example.SWPKoiContructor.services.ProjectService;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 *
 * @author Admin
 */
@Component
public class ScheduledTasks {

    private ProjectService projectService;

    @Autowired
    public ScheduledTasks(ProjectService projectService) {
        this.projectService = projectService;
    }

    @Scheduled(fixedRate = 90000)  // Runs every 90 seconds (adjust accordingly)
    public void runAutoCompletedProject() {
        List<Project> projects = projectService.getProjectList(Integer.MAX_VALUE);  // Fetch all projects
        Date currentDate = new Date();

        projects.stream()
                .filter(project -> project.getStage() == 4 && project.getDateEnd() != null)
                .filter(project -> isSameDay(project.getDateEnd(), currentDate)) // Compare only the date part
                .mapToInt(Project::getProjectId)
                .forEach(projectService::updateProjectStage);  // Update each project that matches the condition
    }

    // Helper method to check if two dates are on the same calendar day
    private boolean isSameDay(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        cal1.setTime(date1);
        cal2.setTime(date2);
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)
                && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
    }
}
