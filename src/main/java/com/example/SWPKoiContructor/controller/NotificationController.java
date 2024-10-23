package com.example.SWPKoiContructor.controller;

import com.example.SWPKoiContructor.entities.Notification;
import com.example.SWPKoiContructor.services.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/manager/notifications")
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

//    @GetMapping
//    public String getUnreadManagerNotifications(Model model) {
//        List<Notification> unreadNotifications = notificationService.getUnreadManagerNotifications();
//        model.addAttribute("notifications", unreadNotifications);
//        return "manager/notificationManage";
//    }

   

    // You can add more methods here as needed
}
