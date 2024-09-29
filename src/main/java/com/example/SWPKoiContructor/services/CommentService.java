package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.CommentDAO;
import com.example.SWPKoiContructor.entities.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentService {
    
    private CommentDAO commentDAO;

    public CommentService(CommentDAO commentDAO) {
        this.commentDAO = commentDAO;
    }
    @Transactional
    public Comment saveComment(Comment comment) {
        return commentDAO.saveComment(comment);
    }
}
