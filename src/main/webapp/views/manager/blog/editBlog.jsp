<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Create New Blog</title>
        <!-- Bootstrap 5 CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }
            .container {
                margin-top: 50px;
                max-width: 800px;
                background-color: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #007bff;
                margin-bottom: 30px;
                font-weight: bold;
            }
            label {
                font-weight: bold;
            }
            .form-control {
                margin-bottom: 20px;
                border-radius: 5px;
            }
            .form-control-file {
                margin-bottom: 20px;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
                padding: 10px 20px;
                font-size: 18px;
                width: 100%;
                border-radius: 5px;
                font-weight: bold;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .btn-submit {
                text-align: center;
            }
            .form-group {
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Create New Blog</h1>

            <form:form method="post" enctype="multipart/form-data" modelAttribute="blog" action="/staff/blog/update">

                <form:hidden path="id" value="${blog.id}"/>
                <form:hidden path="imgUrl" value="${blog.imgUrl}"/>
                <form:hidden path="introContent.id" value="${blog.introContent.id}"/>
                <!-- Blog Title -->
                <div class="form-group">
                    <label for="title">Blog Title</label>
                    <form:input path="name" class="form-control" value="${blog.name}" placeholder="Enter blog title" required ="required"/>
                    <form:errors path="name" cssClass="text-danger"/>
                </div>

                <!-- Blog Description -->
                <div class="form-group">
                    <label for="description">Blog Description</label>
                    <form:textarea path="description" class="form-control" placeholder="Enter blog description" rows="4" required="required"/>
                    <form:errors path="description" cssClass="text-danger"/>
                </div>

                <!-- Blog Content -->
                <div class="form-group">
                    <label for="content">Blog Content</label>
                    <textarea id="content" name="content" class="form-control" rows="6" required>
                    
                        ${blog.introContent.content}
                    </textarea>
                </div>

                <!-- Blog Image Upload -->
                <div class="form-group">
                    <label for="file">Upload Image</label>
                    <input type="file" id="file" name="file" class="form-control-file">
                </div>

                <!-- Blog Status -->


                <!-- Submit Button -->
                <div class="form-group btn-submit">
                    <button type="submit" class="btn btn-primary">Create Blog</button>
                </div>
            </form:form>
        </div>

        <!-- CKEditor Integration -->
        <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script> <!-- Ensure image2 plugin is enabled -->
        <script>
            CKEDITOR.replace('content', {
                extraPlugins: 'uploadimage,image2', // Enable image2 plugin for resizing
                filebrowserImageUploadUrl: '/base64/uploadImage', // Your image upload URL
                uploadUrl: '/base64/uploadImage', // Server-side image upload handler URL
                height: 500,

                // Enable image resizing features
                image2_disableResizer: false, // Allows manual resizing in the editor

                on: {
                    paste: function (evt) {
                        var editor = evt.editor;
                        var data = evt.data;

                        // Check if the pasted data contains an image
                        if (data && data.dataTransfer && data.dataTransfer.getFilesCount()) {
                            var file = data.dataTransfer.getFile(0);

                            if (file && file.type.indexOf('image') !== -1) {
                                var reader = new FileReader();

                                // Read the image as data URL
                                reader.onload = function (e) {
                                    var img = new Image();
                                    img.src = e.target.result;

                                    img.onload = function () {
                                        // Check if the image is larger than 800px in width
                                        var canvas = document.createElement('canvas');
                                        var maxWidth = 800;

                                        if (img.width > maxWidth) {
                                            var scaleFactor = maxWidth / img.width;
                                            canvas.width = maxWidth;
                                            canvas.height = img.height * scaleFactor;

                                            var ctx = canvas.getContext('2d');
                                            ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

                                            // Convert the resized image to Base64
                                            var resizedDataUrl = canvas.toDataURL(file.type);

                                            // Insert the resized image into the editor
                                            editor.insertHtml('<img src="' + resizedDataUrl + '" width="' + maxWidth + '" />');
                                        } else {
                                            // If the image is smaller than 800px, insert it as-is
                                            editor.insertHtml('<img src="' + img.src + '" />');
                                        }
                                    };
                                };

                                reader.readAsDataURL(file);

                                // Prevent default paste behavior for images to avoid duplicating content
                                evt.cancel();
                            }
                        }
                    }
                }
            });
        </script>



        <!-- Bootstrap 5 JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
