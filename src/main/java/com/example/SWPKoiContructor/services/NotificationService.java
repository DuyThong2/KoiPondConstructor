package com.example.SWPKoiContructor.services;
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
}
