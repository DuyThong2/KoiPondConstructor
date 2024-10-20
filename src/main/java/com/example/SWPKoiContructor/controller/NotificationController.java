package com.example.SWPKoiContructor.controller;
import org.springframework.web.bind.annotation.RestController;

import com.example.SWPKoiContructor.services.NotificationService;
import com.example.SWPKoiContructor.entities.Notification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;   
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RestController
@RequestMapping("/api/notifications")
public class NotificationController {
     @Autowired
     private NotificationService notificationService;
     @GetMapping("/{receiverId}")
     public ResponseEntity<List<Notification>> getNotificationByReceiverId(@PathVariable(name="receiverId") int receiverId) {
         try {
             List<Notification> notifications = notificationService.getNotificationsByReceiverId(receiverId);
             return ResponseEntity.status(HttpStatus.OK).body(notifications);
         } catch (Exception e) {
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
         }
     }
     @PostMapping("/new/manage")
     public ResponseEntity<List<Notification>> getNewNotificationsForManager(){
          try{
               List<Notification> notifications = notificationService.getNewNotificationsForManager();
               if (notifications.isEmpty()) {
                    return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
               }
               return ResponseEntity.status(HttpStatus.OK).body(notifications);
          } catch(Exception e){
               e.printStackTrace(); // Log the exception
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
          }
     }
     // Test method
     @GetMapping("/test/manage")
     public ResponseEntity<String> testGetNotificationsForManager(){
          try{
               List<Notification> notifications = notificationService.getNotificationsForManager();
               return ResponseEntity.status(HttpStatus.OK)
                    .body("Test successful. Retrieved " + notifications.size() + " notifications.");
          } catch(Exception e){
               e.printStackTrace(); // Log the exception
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Test failed: " + e.getMessage());
          }
     }
}
