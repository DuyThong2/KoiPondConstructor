package com.example.SWPKoiContructor.dao;

import com.example.SWPKoiContructor.entities.PasswordResetToken;
import com.example.SWPKoiContructor.entities.User;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

@Repository
public class PasswordResetTokenDAO {

    
    private EntityManager entityManager;

    public PasswordResetTokenDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    

    public PasswordResetToken findByToken(String token) {
        TypedQuery<PasswordResetToken> query = entityManager.createQuery(
            "SELECT p FROM PasswordResetToken p WHERE p.token = :token", PasswordResetToken.class);
        query.setParameter("token", token);
        return query.getSingleResult();
    }
    
    public PasswordResetToken saveToken(PasswordResetToken passwordResetToken){
        return entityManager.merge(passwordResetToken);
    }
    
    public PasswordResetToken findByUser(User user) {
        try {
            TypedQuery<PasswordResetToken> query = entityManager.createQuery(
                "SELECT prt FROM PasswordResetToken prt WHERE prt.user = :user", PasswordResetToken.class);
            query.setParameter("user", user);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null; // Return null if no token is found
        }
    }
}