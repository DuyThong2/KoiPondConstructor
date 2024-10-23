package com.example.SWPKoiContructor.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import com.example.SWPKoiContructor.entities.Notification; // Add this import
import java.util.List;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class NotificationDAO {
    @PersistenceContext
    private EntityManager entityManager;
    public NotificationDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    public void saveNotification(Notification notification) {
        if (notification == null) {
            throw new IllegalArgumentException("Notification cannot be null");
        }
        entityManager.persist(notification);
    }

    public List<Notification> getNotificationsForManager() {
        String query = "SELECT n FROM Notification n WHERE LOWER(n.receiverType) = :receiverType ORDER BY n.createdAt DESC";
        TypedQuery<Notification> typedQuery = entityManager.createQuery(query, Notification.class);
        typedQuery.setParameter("receiverType", "manager"); // Corrected parameter name
        return typedQuery.getResultList();
    }

    public List<Notification> getNotificationsByReceiverId(int receiverId) {
        String query = "SELECT n FROM Notification n WHERE n.receiver.id = :receiverId  ORDER BY n.createdAt DESC";
        TypedQuery<Notification> typedQuery = entityManager.createQuery(query, Notification.class);
        typedQuery.setParameter("receiverId", receiverId);
        return typedQuery.getResultList();
    }

    public void markAsRead(int notificationId) {
        Notification notification = entityManager.find(Notification.class, notificationId);
        if (notification != null) {
            notification.setRead(true);
            entityManager.merge(notification);
        }
    }

    public void deleteNotification(int notificationId) {
        Notification notification = entityManager.find(Notification.class, notificationId);
        if (notification != null) {
            entityManager.remove(notification);
        }
    }

    public void deleteAllNotificationsByReceiverId(int receiverId) {
        String query = "DELETE FROM Notification n WHERE n.receiver.id = :receiverId";
        entityManager.createQuery(query).setParameter("receiverId", receiverId).executeUpdate();
    }

    public long getUnreadNotificationsCount(int receiverId) {
        String query = "Select Count(n) from Notification n where n.receiver.id =:receiverId and n.isRead=0 Order By n.createdAt DESC";
        TypedQuery<Long> typedQuery = entityManager.createQuery(query, Long.class);
        typedQuery.setParameter("receiverId", receiverId);
        return typedQuery.getSingleResult();
    }
    public List<Notification> getNewNotificationsForManager() {
        String query = "SELECT n FROM Notification n WHERE LOWER(n.receiverType) = :receiverType AND n.isRead = false ORDER BY n.createdAt DESC";
        TypedQuery<Notification> typedQuery = entityManager.createQuery(query, Notification.class);
        typedQuery.setParameter("receiverType", "manager"); // Corrected parameter name
        return typedQuery.getResultList();
    }
    public long getUnreadNotificationsCountManager() {
        String query = "SELECT COUNT(n) FROM Notification n WHERE LOWER(n.receiverType) = :receiverType AND n.isRead = false ORDER BY n.createdAt DESC";
        TypedQuery<Long> typedQuery = entityManager.createQuery(query, Long.class);

        // Set parameter to lowercase to match the LOWER() in the query
        typedQuery.setParameter("receiverType", "manager");

        return typedQuery.getSingleResult();
    }

}
