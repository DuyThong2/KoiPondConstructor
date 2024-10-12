/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.exception.ResourceNotExistException;
import com.example.SWPKoiContructor.exception.UserErrorSyntaxException;
import com.example.SWPKoiContructor.services.functionalService.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author Admin
 */
@Controller
public class FileDownloadController {

    private static final String UPLOAD_DIR = System.getProperty("user.home") + "/Desktop/uploads/";

    @Autowired
    private StorageService service;

//    @GetMapping("/download/**")
//    public ResponseEntity<Resource> downloadFile(HttpServletRequest request) {
//        try {
//            // Extract the file path from the request URL
//            String fullPath = request.getRequestURI().replace("/download/", "");
//
//            // Resolve the file path
//            Path filePath = Paths.get(UPLOAD_DIR + fullPath);
//            Resource resource = new UrlResource(filePath.toUri());
//
//            // Check if the file exists
//            if (!resource.exists()) {
//                throw new ResourceNotExistException("File is corrupted or not exist");
//            }
//
//            // Return the file as a downloadable resource
//            return ResponseEntity.ok()
//                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
//                    .body(resource);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//            throw new UserErrorSyntaxException("User changing the URL in a error way");
//        }
//    }
    @GetMapping("/download/{fileName}")
    public ResponseEntity<ByteArrayResource> downloadFile(@PathVariable String fileName) {
        try {
            // Use the service to download the file content by its file name
            byte[] data = service.downloadFile(fileName);

            // Check if data is available (file exists)
            if (data == null || data.length == 0) {
                throw new ResourceNotExistException("File not found or is empty");
            }

            // Wrap the byte array in a ByteArrayResource and return as a downloadable resource
            ByteArrayResource resource = new ByteArrayResource(data);
            return ResponseEntity
                    .ok()
                    .contentLength(data.length)
                    .header(HttpHeaders.CONTENT_TYPE, "application/octet-stream")
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .body(resource);

        } catch (Exception e) {
            e.printStackTrace();
            throw new UserErrorSyntaxException("An error occurred while downloading the file");
        }
    }

}
