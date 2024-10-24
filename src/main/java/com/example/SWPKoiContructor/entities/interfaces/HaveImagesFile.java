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
        
        String bucketName = "happikoi";
        String region = "ap-southeast-1";
        if(imgUrl != null){
            return String.format("https://%s.s3.%s.amazonaws.com/%s", bucketName,region,imgUrl);
        }else{
            return null;
        }
        
    }
}
