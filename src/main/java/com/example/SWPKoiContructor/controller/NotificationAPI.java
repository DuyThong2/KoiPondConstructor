package com.example.SWPKoiContructor.controller;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import com.example.SWPKoiContructor.services.NotificationService;
import com.example.SWPKoiContructor.entities.Notification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import java.util.List;

@RestController
@RequestMapping("/api/notifications")
public class NotificationAPI {
     @Autowired
     private NotificationService notificationService;

     private final SimpMessagingTemplate simpMessagingTemplate;

     public NotificationAPI(SimpMessagingTemplate simpMessagingTemplate) {
          this.simpMessagingTemplate = simpMessagingTemplate;
     }

     @GetMapping("/{receiverId}")
     public ResponseEntity<List<Notification>> getNotificationByReceiverId(
               @PathVariable(name = "receiverId") int receiverId) {
          try {
               List<Notification> notifications = notificationService.getNotificationsByReceiverId(receiverId);
               return ResponseEntity.status(HttpStatus.OK).body(notifications);
          } catch (Exception e) {
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
          }
     }

     @PostMapping("/new/manage")
     public ResponseEntity<List<Notification>> getNewNotificationsForManager() {
          try {
               List<Notification> notifications = notificationService.getNewNotificationsForManager();
               if (notifications.isEmpty()) {
                    return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
               }
               return ResponseEntity.status(HttpStatus.OK).body(notifications);
          } catch (Exception e) {
               e.printStackTrace(); // Log the exception
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
          }
     }

     // Test method
     @GetMapping("/test/manage")
     public ResponseEntity<String> testGetNotificationsForManager() {
          try {
               List<Notification> notifications = notificationService.getNotificationsForManager();
               return ResponseEntity.status(HttpStatus.OK)
                         .body("Test successful. Retrieved " + notifications.size() + " notifications.");
          } catch (Exception e) {
               e.printStackTrace(); // Log the exception
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                         .body("Test failed: " + e.getMessage());
          }
     }

     @PostMapping("/notify")
     public void sendNotification(Notification notification) {
          // Send notification to all subscribed clients
          simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
     }

     @PutMapping("/update/{id}")
     public ResponseEntity<String> readNotification(@PathVariable int id) {
          try {
               notificationService.readNotification(id);
               return ResponseEntity.ok("Notification marked as read");
          } catch (Exception e) {
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating notification");
          }
     }

     @PutMapping("/markAllAsRead")
     public ResponseEntity<String> markAllAsRead() {
          try {
               notificationService.markAllAsRead();
               return ResponseEntity.ok("All notifications marked as read");
          } catch (Exception e) {
               return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                         .body("Error updating notifications: " + e.getMessage());
          }
     }
}
