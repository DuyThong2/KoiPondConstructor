/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services;

import com.example.SWPKoiContructor.dao.PasswordResetTokenDAO;
import com.example.SWPKoiContructor.dao.UserDAO;
import com.example.SWPKoiContructor.entities.PasswordResetToken;
import com.example.SWPKoiContructor.entities.User;
import java.util.Date;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class UserService {

    private PasswordResetTokenDAO tokenDAO;
    private UserDAO userDAO;
    private PasswordEncoder passwordEncoder;

    public UserService(PasswordResetTokenDAO tokenDAO, UserDAO userDAO, PasswordEncoder passwordEncoder) {
        this.tokenDAO = tokenDAO;
        this.userDAO = userDAO;
        this.passwordEncoder = passwordEncoder;
    }

    // Generate password reset token
    @Transactional
    public void createPasswordResetTokenForUser(User user, String token) {
        PasswordResetToken existingToken = tokenDAO.findByUser(user);

        if (existingToken != null) {
            // Update the existing token and expiration date
            existingToken.setToken(token);
            existingToken.setExpiryDate(new Date(System.currentTimeMillis() + 1000 * 60 * 60)); // Token valid for 1 hour
            tokenDAO.saveToken(existingToken);
        } else {
            // Create a new token if no existing token is found
            PasswordResetToken resetToken = new PasswordResetToken();
            resetToken.setToken(token);
            resetToken.setUser(user);
            resetToken.setExpiryDate(new Date(System.currentTimeMillis() + 1000 * 60 * 60)); // Token valid for 1 hour
            tokenDAO.saveToken(resetToken);
        }
    }

    // Find token by value
    public PasswordResetToken getPasswordResetToken(String token) {
        return tokenDAO.findByToken(token);
    }

    // Reset user password
    @Transactional
    public void updatePassword(User user, String newPassword) {
        String encodedPassword = passwordEncoder.encode(newPassword);
        user.setPassword(encodedPassword);
        userDAO.saveUser(user);
    }

    public User findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }

    public User getUserById(int userId) {
        return userDAO.getUserById(userId);
    }
    
    public List<User> getUserListByRole(String role){
        return userDAO.getUserListByRole(role);
    }
}
