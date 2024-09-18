/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "Staff")
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "staff_id")
    private int staffId;
    
    @Column(name = "staff_email")
    private String staffEmail;
    
    private String username;
    
    @Column(name = "staff_phone")
    private String staffPhone;
    
    @Column(name = "staff_role")
    private String staffRole;
    
    @Column(name = "password")
    private String password;
    
    private boolean status;
    
    @Column(name = "user_type")
    private String userType;
    
    @OneToMany(mappedBy = "staff")
    private List<Consultant> consultant;
    
    @OneToMany(mappedBy = "staff")
    private List<Quotes> quotes;
}
