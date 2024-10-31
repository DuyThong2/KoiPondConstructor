package com.example.SWPKoiContructor.entities;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Notification")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notification_id")
    private int id;


    @Column(name ="receiver_id")
    private Integer receiverId;

    @Column(nullable = false)
    private String message;
    @Column(name = "receiver_type") // Assuming this is the correct column name in the database
    private String receiverType;

    @Column(name = "is_read", nullable = false)
    private boolean isRead;

    @Column(name = "related_id", nullable = true)
    private Integer relatedId;

    @Column(name = "from_table", nullable = true)
    private String fromTable;

    @Column(name = "create_at_date", nullable = false) // Correct database column
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    // Default constructor
    public Notification() {
    }

    // Constructor with fields


    public Notification(int id, Integer receiverId, String message, String receiverType,  Integer relatedId, String fromTable) {
        this.id = id;
        this.receiverId = receiverId;
        this.message = message;
        this.receiverType = receiverType;
        this.isRead = false;
        this.relatedId = relatedId;
        this.fromTable = fromTable;
        this.createdAt = LocalDateTime.now();
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public String getMessage() {
        return message;
    }
    public String getReceiverType() {
        return receiverType;
    }

    public void setReceiverType(String receiverType) {
        this.receiverType = receiverType;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }

    public Integer getRelatedId() {
        return relatedId;
    }

    public void setRelatedId(Integer relatedId) {
        this.relatedId = relatedId;
    }

    public String getFromTable() {
        return fromTable;
    }

    public void setFromTable(String fromTable) {
        this.fromTable = fromTable;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

}
