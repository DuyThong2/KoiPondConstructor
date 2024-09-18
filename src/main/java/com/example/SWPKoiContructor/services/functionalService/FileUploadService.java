/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.services.functionalService;

import com.example.SWPKoiContructor.utils.FileUtility;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */

@Service
public class FileUploadService {
    
    
   public String handleFileUpload(MultipartFile file, String directory){
       FileUtility fileUtility = new FileUtility();
       return fileUtility.handleFileUpload(file, directory);
   }
}
