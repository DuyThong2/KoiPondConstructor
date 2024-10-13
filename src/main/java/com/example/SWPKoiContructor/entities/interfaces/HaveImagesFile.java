/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities.interfaces;

/**
 *
 * @author Admin
 */
public interface HaveImagesFile {
    
    default String getShowingImg(String imgUrl) {
        // Assuming the base S3 URL remains the same
        if(imgUrl != null){
            return "https://koiconstructionbucket.s3.ap-northeast-1.amazonaws.com/" + imgUrl;
        }else{
            return null;
        }
        
    }
}
