/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.exception;

/**
 *
 * @author Admin
 */
public class AccountIsExistException extends RuntimeException{

    public AccountIsExistException() {
    }

    public AccountIsExistException(String message) {
        super(message);
    }
    
}
