/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Calendar;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author nasaf
 */
@Entity
@Table(name = "Comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "comment_id")
    private int commentId;

    @Column(name = "comment_status")
    private int commentStatus;

    @Column(name = "comment_content")
    private String commentContent;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "comment_date_post")
    private Calendar datePost;
    
//    @ManyToOne
//    @JoinColumn(name = "blog_id")
//    private Blog blog;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service service;

    @ManyToOne
    @JoinColumn(name = "blue_print_id")
    private BluePrint bluePrint;
    
    @ManyToOne
    @JoinColumn(name = "construction_stage_detail_id")
    private ConstructionStageDetail constructionStageDetail;
    
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    
    //Staff

    @ManyToOne
    @JoinColumn(name = "parent_comment_id")
    private Comment parentComment;

    @OneToMany(mappedBy = "parentComment")
    private List<Comment> replies;

    public Comment(int commentId, int commentStatus, String commentContent, Calendar datePost) {
        this.commentId = commentId;
        this.commentStatus = commentStatus;
        this.commentContent = commentContent;
        this.datePost = datePost;
    }

    public Comment() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(int commentStatus) {
        this.commentStatus = commentStatus;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Calendar getDatePost() {
        return datePost;
    }

    public void setDatePost(Calendar datePost) {
        this.datePost = datePost;
    }

    public BluePrint getBluePrint() {
        return bluePrint;
    }

    public void setBluePrint(BluePrint bluePrint) {
        this.bluePrint = bluePrint;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public ConstructionStageDetail getConstructionStageDetail() {
        return constructionStageDetail;
    }

    public void setConstructionStageDetail(ConstructionStageDetail constructionStageDetail) {
        this.constructionStageDetail = constructionStageDetail;
    }

    public Comment getParentComment() {
        return parentComment;
    }

    public void setParentComment(Comment parentComment) {
        this.parentComment = parentComment;
    }

    public List<Comment> getReplies() {
        return replies;
    }

    public void setReplies(List<Comment> replies) {
        this.replies = replies;
    }
    
    
    

    
}
