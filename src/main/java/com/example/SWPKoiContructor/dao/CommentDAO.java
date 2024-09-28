/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.Comment;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
    @PersistenceContext
    private EntityManager entityManager;
    
    public Comment saveComment(Comment comment) {
        return entityManager.merge(comment);
    }
}
