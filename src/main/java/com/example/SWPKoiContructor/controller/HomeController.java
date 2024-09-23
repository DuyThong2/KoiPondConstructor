/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Admin
 */

@Controller
public class HomeController {
    
    @GetMapping("/login")
    public String login() {
        return "login";  // returns login.jsp
    }
}
