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

    @Scheduled(fixedRate = 90000)  
    public void runAutoCompletedProject() {
        List<Project> projects = projectService.getProjectList(Integer.MAX_VALUE);  
        Date currentDate = new Date();

        projects.stream()
                .filter(project -> project.getStage() == 4 && project.getDateEnd() != null)
                .filter(project -> isTwoMonthsAfterEndDate(project.getDateEnd(), currentDate)) 
                .mapToInt(Project::getProjectId)
                .forEach(projectService::updateProjectStage);  
    }


    private boolean isTwoMonthsAfterEndDate(Date endDate, Date currentDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(endDate);
        cal.add(Calendar.MONTH, 0);  

       
        return !cal.getTime().after(currentDate);
    }

}
