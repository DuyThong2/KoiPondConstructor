/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.User;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public class UserDAO {

    private EntityManager entityManager;

    public UserDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public User saveUser(User user) {
        return entityManager.merge(user);
    }
    
    public User getUserById(int id){
        try {
            TypedQuery<User> tq = entityManager.createQuery("SELECT user from User user where user.id = :id", User.class);
            tq.setParameter("id", id);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public User findUserByEmail(String email) {
        try {
            TypedQuery<User> tq = entityManager.createQuery("SELECT user from User user where user.email = :email", User.class);
            tq.setParameter("email", email);
            return tq.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }

    }
}