/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Comment;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public Comment getCommentById(int id) {
        TypedQuery<Comment> query = entityManager.createQuery(
                "SELECT c from Comment c where c.commentId = :id", Comment.class);
        query.setParameter("id", id);
        return query.getSingleResult();
    }

    public List<Comment> getCommentByConstructionId(int constructionId) {
        TypedQuery<Comment> query = entityManager.createQuery(
                "SELECT c from Comment c where c.construction.constructionId = :constructionId", Comment.class);
        query.setParameter("constructionId", constructionId);
        return query.getResultList();
    }

    public Comment saveComment(Comment comment) {
        return entityManager.merge(comment);
    }

    public void deleteComment(int id) {
        Comment comment = getCommentById(id);
        if (comment != null) {
            entityManager.remove(comment);
        }
    }
}
