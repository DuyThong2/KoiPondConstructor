/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.FeedbackDAO;
import com.example.SWPKoiContructor.entities.Feedback;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP
 */
@Service
public class FeedbackService {
    private FeedbackDAO feedbackDAO;

    public FeedbackService(FeedbackDAO feedbackDAO) {
        this.feedbackDAO = feedbackDAO;
    }
    
    public List<Feedback> getFeedbackList(){
        return feedbackDAO.getFeedBackList();
    }
    
    public Feedback getLatestFeedback(int quotesId, int fromUserId, int toUserId){
        return feedbackDAO.getLatestFeedback(quotesId, fromUserId, toUserId);
    }
    
    public Feedback getLatestManagerFeedback(int quotesId, int toUserId){
        return feedbackDAO.getLatestFeedbackFromManager(quotesId, toUserId);
    }
    
    public Feedback getFeedbackForCancel(int quotesId){
        return feedbackDAO.getFeedbackForCancel(quotesId);
    }
    
    public Feedback getLatestContractFeedbackFromManager(int contractId, int toUserId){
        return feedbackDAO.getLatestContractFeedbackFromManager(contractId, toUserId);
    }
    
    public Feedback getManagerSelfFeedback(int contractId){
        return feedbackDAO.getManagerSelfFeedback(contractId);
    }
    
    public Feedback getLatestContractFeedback(int contractId, int fromUser, int toUser){
        return feedbackDAO.getLatestContractFeedback(contractId, fromUser, toUser);
    }
    
    public Feedback getLatestServiceQuoteFeedback(int serviceQuoteFeedback){
        return feedbackDAO.getLatestFeedback(serviceQuoteFeedback);
    }
    
    public Feedback getLatestFeedbackForQuote(int quoteId){
        return feedbackDAO.getLatestFeedbackForQuotes(quoteId);
    }
    
    @Transactional
    public Feedback saveFeedback(Feedback feedback){
        return feedbackDAO.saveFeedback(feedback);
    }
}
