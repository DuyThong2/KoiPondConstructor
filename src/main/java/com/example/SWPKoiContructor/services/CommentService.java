package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.CommentDAO;
import com.example.SWPKoiContructor.entities.Comment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentService {

    private CommentDAO commentDAO;

    public CommentService(CommentDAO commentDAO) {
        this.commentDAO = commentDAO;
    }

    public Comment getCommentById(int id) {
        return commentDAO.getCommentById(id);
    }

    public List<Comment> getCommentByConstructionId(int constructionId) {
        return commentDAO.getCommentByConstructionId(constructionId);
    }

    @Transactional
    public Comment saveComment(Comment comment) {
        return commentDAO.saveComment(comment);
    }

    @Transactional
    public void deleteComment(int id) {
        commentDAO.deleteComment(id);
    }
}
