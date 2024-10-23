package com.example.SWPKoiContructor.services;
import com.example.SWPKoiContructor.entities.Consultant;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.SWPKoiContructor.dao.NotificationDAO;
import com.example.SWPKoiContructor.entities.Notification;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import java.util.List;
@Service
public class NotificationService {
     @Autowired
     private NotificationDAO notificationDAO;
     private final SimpMessagingTemplate simpMessagingTemplate;

     public NotificationService(SimpMessagingTemplate simpMessagingTemplate) {
          this.simpMessagingTemplate = simpMessagingTemplate;
     }

     @Transactional
     public void saveNotification(Notification notification) {
          notificationDAO.saveNotification(notification);
     }
     
     public List<Notification> getNotificationsByReceiverId(int receiverId) {
          return notificationDAO.getNotificationsByReceiverId(receiverId);
     }

     @Transactional
     public void markAsRead(int notificationId) {
          notificationDAO.markAsRead(notificationId);
     }         

     @Transactional
     public void deleteNotification(int notificationId) {
          notificationDAO.deleteNotification(notificationId);
     }


     @Transactional
     public void deleteAllNotificationsByReceiverId(int receiverId) {
          notificationDAO.deleteAllNotificationsByReceiverId(receiverId);
     }


     public List<Notification> getNotificationsForManager() {
          return notificationDAO.getNotificationsForManager();
     }

     public List<Notification> getNewNotificationsForManager() {
          return notificationDAO.getNewNotificationsForManager();
     }

     public long getUnreadNotificationsCountManager() {
          return notificationDAO.getUnreadNotificationsCountManager();
     }

     @Transactional
     public void sendConsultantCreationNotification(Consultant newConsultant) {
          Notification notification = new Notification();
          notification.setMessage("New" + newConsultant.getConsultantType()+ " consultant created: " + newConsultant.getConsultantCustomerName());
          notification.setRelatedId(newConsultant.getConsultantId());  // Assuming getConsultantId() exists
          notification.setReceiverType("manager"); // Assuming manager is notified
          notification.setFromTable("consultant");
          notification.setCreatedAt(java.time.LocalDateTime.now());
          notificationDAO.saveNotification(notification);
          // Broadcast notification to /topic/notifications
          simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
     }
     @Transactional
     public void readNotification(int id){
          Notification notification = notificationDAO.getNotificationById(id);
          if(notification!=null){
               notification.setRead(true);
               notificationDAO.updateNotification(notification);
          }
     }

     @Transactional
     public void markAllAsRead() {
          notificationDAO.markAllAsRead();
     }

     @Transactional
     public void createQuoteNotification(String customerName, int consultantId) {
          Notification notification = new Notification();
          notification.setMessage("New quote created for customer: " + customerName);
          notification.setRelatedId(consultantId);
          notification.setReceiverType("manager");
          notification.setFromTable("quote");
          notification.setCreatedAt(LocalDateTime.now());
          notification.setRead(false);
          
          notificationDAO.saveNotification(notification);
          
          // Broadcast notification to /topic/notifications
          simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
     }
}
