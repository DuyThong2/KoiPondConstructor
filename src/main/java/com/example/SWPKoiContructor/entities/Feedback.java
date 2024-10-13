/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "Feedback")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feedback_id")
    private int feedbackId;
    
    @Column(name = "feedback_content")
    private String feedbackContent;
    
    @Column(name = "feedback_date")
    @Temporal(TemporalType.DATE)
    private Date feedbackDate;
    
    @ManyToOne
    @JoinColumn(name = "from_user")
    private User fromUser;
    
    @ManyToOne
    @JoinColumn(name = "to_user")
    private User toUser;
    
    @ManyToOne
    @JoinColumn(name = "consultant_id")
    private Consultant consultant;
    
    @ManyToOne
    @JoinColumn(name = "quotes_id")
    private Quotes quotes;
    
    @ManyToOne
    @JoinColumn(name = "contract_id")
    private Contract contract;
    
    @ManyToOne
    @JoinColumn(name = "service_quotes_id")
    private ServiceQuotes serviceQuotes;

    public Feedback() {
    }

    
    public Feedback(int feedbackId, String feedbackContent, Date feedbackDate, User fromUser, User toUser) {
        this.feedbackId = feedbackId;
        this.feedbackContent = feedbackContent;
        this.feedbackDate = feedbackDate;
        this.fromUser = fromUser;
        this.toUser = toUser;
    }

    public Feedback(String feedbackContent, Date feedbackDate, User fromUser, User toUser, Consultant consultant) {
        this.feedbackContent = feedbackContent;
        this.feedbackDate = feedbackDate;
        this.fromUser = fromUser;
        this.toUser = toUser;
        this.consultant = consultant;
    }

    public Feedback(String feedbackContent, Date feedbackDate, User fromUser, User toUser, Quotes quotes) {
        this.feedbackContent = feedbackContent;
        this.feedbackDate = feedbackDate;
        this.fromUser = fromUser;
        this.toUser = toUser;
        this.quotes = quotes;
    }

    public Feedback(String feedbackContent, Date feedbackDate, User fromUser, User toUser, Contract contract) {
        this.feedbackContent = feedbackContent;
        this.feedbackDate = feedbackDate;
        this.fromUser = fromUser;
        this.toUser = toUser;
        this.contract = contract;
    }
          
    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedbackContent() {
        return feedbackContent;
    }

    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public User getFromUser() {
        return fromUser;
    }

    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }

    public User getToUser() {
        return toUser;
    }

    public void setToUser(User toUser) {
        this.toUser = toUser;
    }

    public Consultant getConsultant() {
        return consultant;
    }

    public void setConsultant(Consultant consultant) {
        this.consultant = consultant;
    }

    public Quotes getQuotes() {
        return quotes;
    }

    public void setQuotes(Quotes quotes) {
        this.quotes = quotes;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public ServiceQuotes getServiceQuotes() {
        return serviceQuotes;
    }

    public void setServiceQuotes(ServiceQuotes serviceQuotes) {
        this.serviceQuotes = serviceQuotes;
    }
    
    
}
