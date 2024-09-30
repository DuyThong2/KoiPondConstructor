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
import com.example.SWPKoiContructor.services.functionalService.EmailService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class UserService {

    @Autowired
    private PasswordResetTokenDAO tokenDAO;

    @Autowired
    private UserDAO userDAO;

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
        user.setPassword(newPassword);
        userDAO.saveUser(user);
    }

    public User findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }
}
