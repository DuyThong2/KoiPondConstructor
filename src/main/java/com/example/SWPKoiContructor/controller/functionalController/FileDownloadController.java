/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.functionalController;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
public class FileDownloadController {
    private static final String UPLOAD_DIR = System.getProperty("user.home") + "/Desktop/uploads/";
    
    @GetMapping("/download/**")
    public ResponseEntity<Resource> downloadFile(HttpServletRequest request) {
        try {
            // Extract the file path from the request URL
            String fullPath = request.getRequestURI().replace("/download/", "");

            // Resolve the file path
            Path filePath = Paths.get(UPLOAD_DIR + fullPath);
            Resource resource = new UrlResource(filePath.toUri());

            // Check if the file exists
            if (!resource.exists()) {
                return ResponseEntity.notFound().build();
            }

            // Return the file as a downloadable resource
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                    .body(resource);

        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }
}
