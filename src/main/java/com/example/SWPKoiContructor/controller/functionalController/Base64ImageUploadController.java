/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.controller.functionalController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@RestController
public class Base64ImageUploadController {

    @PostMapping("/base64/uploadImage")
    public ResponseEntity<?> uploadImage(@RequestParam("upload") MultipartFile file) {
        try {
            byte[] fileContent = inputStreamToByteArray(file.getInputStream()); // Custom method to convert InputStream to byte array

            // Convert the byte array to Base64 encoded string
            String base64Image = Base64.getEncoder().encodeToString(fileContent);
            String dataUri = "data:" + file.getContentType() + ";base64," + base64Image;

            // Return the Base64 image as the URL
            return ResponseEntity.ok("{ \"uploaded\": true, \"url\": \"" + dataUri + "\" }");

        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{ \"uploaded\": false, \"error\": { \"message\": \"" + e.getMessage() + "\" } }");
        }
    }

    private byte[] inputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[16384]; // Buffer size of 16KB

        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }

        buffer.flush();
        return buffer.toByteArray();
    }
}
