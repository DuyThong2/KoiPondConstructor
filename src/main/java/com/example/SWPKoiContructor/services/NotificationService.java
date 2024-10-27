package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.entities.*;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.SWPKoiContructor.dao.NotificationDAO;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TypedQuery;
import java.time.LocalDateTime;
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
          notification.setMessage("New" + newConsultant.getConsultantType() + " consultant created: "
                    + newConsultant.getConsultantCustomerName());
          notification.setRelatedId(newConsultant.getConsultantId()); // Assuming getConsultantId() exists
          notification.setReceiverType("manager"); // Assuming manager is notified
          notification.setFromTable("consultant");
          notification.setCreatedAt(java.time.LocalDateTime.now());
          notificationDAO.saveNotification(notification);
          // Broadcast notification to /topic/notifications
          simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
     }

     @Transactional
     public void readNotification(int id) {
          Notification notification = notificationDAO.getNotificationById(id);
          if (notification != null) {
               notification.setRead(true);
               notificationDAO.updateNotification(notification);
          }
     }

     @Transactional
     public void markAllAsRead() {
          notificationDAO.markAllAsRead();
     }

     @Transactional
     public void createNotification( Integer relatedId, String fromTable,Integer receiverId,String receiverType,String message) {
          try{
               Notification notification = new Notification();
               if(receiverId!=null){
                    notification.setReceiverId(receiverId);
               }
               notification.setMessage(message);
               if(relatedId!=null){
                    notification.setRelatedId(relatedId);
               }
               notification.setReceiverType(receiverType);
               notification.setFromTable(fromTable);
               notification.setCreatedAt(LocalDateTime.now());
               notification.setRead(false);

               notificationDAO.saveNotification(notification);

               // Broadcast notification to /topic/notifications
               if(receiverType.equalsIgnoreCase("manager"))
                    simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
               else
                    simpMessagingTemplate.convertAndSend("/topic/"+receiverType+"/"+receiverId, notification);
          }catch(Exception e){
               e.printStackTrace();
          }
     }

     @Transactional
     public void createQuoteNotification(String customerName, int quoteId, Integer customerId) {
         String messageCustomer = "A New Quote created for Customer: " + customerName;

         createNotification( quoteId, "quote", null, "manager", messageCustomer);
     }

     @Transactional
     public void createContractNotification(String customerName, int contractId, Integer customerId) {
         String managerMessage = "A New Contract created for Customer: " + customerName;

         createNotification( contractId, "contract", null, "manager", managerMessage);
     }
     
     @Transactional
     public void createProjectNotification(String name, int projectId, int id) {
          String message="Your project has been created! Please check it";
          createNotification(projectId,"project",id,"customer",message);
     }

     @Transactional
     public void createContractStatusNotification(String customerName, int contractId, String statusDescription) {
          Notification notification = new Notification();
          notification.setMessage("Contract status updated by " + customerName + ": " + statusDescription);
          notification.setRelatedId(contractId);
          notification.setReceiverType("manager");
          notification.setFromTable("contract");
          notification.setCreatedAt(LocalDateTime.now());
          notification.setRead(false);
          notificationDAO.saveNotification(notification);
          // Broadcast notification to /topic/notifications
          simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
     }

     @Transactional
     public void createCancelRequestNotification(int id, String notificationMessage, String table) {
          Notification notification = new Notification();
          notification.setMessage(notificationMessage);
          notification.setRelatedId(id);
          notification.setReceiverType("manager");
          notification.setFromTable(table);
          notification.setCreatedAt(LocalDateTime.now());
          notification.setRead(false);
          notificationDAO.saveNotification(notification);
          // Broadcast notification to /topic/notifications
          simpMessagingTemplate.convertAndSend("/topic/notifications", notification);
     }

     @Transactional
     public void assignStaffNotification(int id, int relatedId, String staffType, String table, String message) {
          Notification notification = new Notification();
          notification.setReceiverId(id);
          notification.setMessage(message);
          notification.setRelatedId(relatedId);
          notification.setReceiverType(returnType(staffType));
          notification.setFromTable(table);
          notification.setCreatedAt(LocalDateTime.now());
          notification.setRead(false);
          notificationDAO.saveNotification(notification);
          simpMessagingTemplate.convertAndSend("/topic/"+returnType(staffType)+"/" + id, notification);
     }
     @Transactional
     public void assignListStaffNotification(List<Staff> staffList, int projectId,String projectName) {
          String message="You have been assigned to a new Project: "+projectName;
          for (Staff staff : staffList) {
               assignStaffNotification(staff.getId(),projectId,staff.getDepartment(),"project",message);
          }
     }
     private String returnType(String staffType){
          String returnType="";
          switch (staffType.toLowerCase()){
               case "consulting": returnType="consultant"; break;
               case "design": returnType="designer"; break;
               case "construction": returnType="constructor"; break;
          }
          return returnType;
     }
     @Transactional
     public void markAllAsReadForReceiver(int id) {
          notificationDAO.markAllAsReadForReceiver(id);
     }


     @Transactional
     public void changeNotificationToConsultant(int id, String customerName, int relatedId, int statusId, String fromWho,String fromTable,String statusString) {
          Notification notification = new Notification();
          notification.setReceiverId(id);
          notification.setMessage(fromWho+" " +statusString +" your quote: " + customerName);
          notification.setRelatedId(relatedId);
          notification.setReceiverType("consultant");
          notification.setFromTable(fromTable);
          notification.setCreatedAt(LocalDateTime.now());
          notification.setRead(false);
          notificationDAO.saveNotification(notification);

          simpMessagingTemplate.convertAndSend("/topic/consultant/" + id, notification);
     }



}
