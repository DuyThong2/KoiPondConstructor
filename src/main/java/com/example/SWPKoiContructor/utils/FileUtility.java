/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.utils;

import com.example.SWPKoiContructor.services.functionalService.StorageService;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Component
public class FileUtility {

    public static final String ROOT_DIR = System.getProperty("user.home") + "/Desktop/uploads/";

    public static final String USER_DIR = ROOT_DIR + "user/";

    public static final String DESIGN_SUM_DIR = ROOT_DIR + "design/summaryFile/";
    public static final String DESIGN_BLUEPRINT_DIR = ROOT_DIR + "design/bluePrint/";
    public static final String PRE_DESIGN_DIR = ROOT_DIR + "preDesign/";

    public static final String BLOG_DIR = ROOT_DIR + "blog/";

    public static final String PROJECT_DIR = ROOT_DIR + "project/";

    public static final String CONTRACT_DIR = ROOT_DIR + "contracts/";
    
    
    @Autowired
    private StorageService service;

//    public String handleFileUpload(MultipartFile file, String directory) {
//        try {
//            if (file.isEmpty()) {
//                return null;
//            }
//            // Ensure the upload directory exists
//            Path uploadPath = Paths.get(directory);
//            if (!Files.exists(uploadPath)) {
//                Files.createDirectories(uploadPath); // Create the directory if it doesn't exist
//            }
//
//            // Generate new file name based on the current date and time (format: ddMMyyyyHHmmss)
//            String timestamp = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date());
//            String originalFileName = file.getOriginalFilename();
//            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // Get file extension
//            String newFileName = timestamp + fileExtension;
//
//            // Save the file with the new name
//            Path filePath = uploadPath.resolve(newFileName);
//            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//
//            // Log for debugging
//            System.out.println("File uploaded as: " + newFileName);
//            String relativePath = directory.replace(ROOT_DIR, "") + newFileName;
//            return relativePath;
//
//        } catch (IOException e) {
//            e.printStackTrace();
//            throw new RuntimeException("Error with file upload");
//        }
//    }
    
    
    public String handleFileUpload(MultipartFile file, String directory) {
    try {
        if (file.isEmpty()) {
            return null;
        }

        // Call the service method to upload the file and get the file name
        String fileName = service.uploadFile(file);

        if (fileName == null) {
            throw new RuntimeException("File upload failed.");
        }

        // Prepend the directory to the file name (optional, based on your need)
        String fileNameWithPath = fileName;

        // Return the full path or just the file name
        return fileNameWithPath;

    } catch (Exception e) {
        e.printStackTrace();
        throw new RuntimeException("Error with file upload", e);
    }
}

    public void deleteFile(String fileName, String directory) {
        try {
            Path filePath = Paths.get(directory).resolve(fileName);

            // Check if the file exists before attempting to delete
            if (Files.exists(filePath)) {
                // Delete the file
                Files.delete(filePath);
                System.out.println("File deleted successfully: " + filePath);
            } else {
                System.out.println("File not found: " + filePath);
            }

        } catch (IOException e) {
            e.printStackTrace();

        }
    }
}
