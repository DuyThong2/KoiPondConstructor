<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Update Service Content</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
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
                border-bottom: 2px solid #007bff;
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
    <div style="height:6vh;"></div>
    <body>
        <div class="container-fluid">
            <div class="row">
                <%@include file="../navBar.jsp" %>
                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
                    <h1>Update Service Content</h1>
                    <form method="post" enctype="multipart/form-data" modelAttribute="service" action="${pageContext.request.contextPath}/manager/serviceContent/update/">
                        <!-- Service Title -->
                        <!-- Service Content -->
                        <input type="hidden" name="serviceId" value="${service.serviceId}">
                        <div class="form-group">
                            <label for="content">Service Content</label>
                            <textarea id="content" name="content" class="form-control" rows="6" required>
                                ${service.content.content}
                            </textarea>
                        </div>
                        <!-- Service Image Upload -->
                        <!-- Submit Button -->
                        <div class="form-group btn-submit">
                            <button type="submit" class="btn btn-primary">Update Service</button>
                        </div>
                    </form>
                </main>
            </div>
        </div>

        <!-- CKEditor Integration -->
        <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script>
        <script>
            CKEDITOR.replace('content', {
                extraPlugins: 'uploadimage,image2', // Enable image2 plugin for resizing
                filebrowserImageUploadUrl: '${pageContext.request.contextPath}/base64/uploadImage', // Your image upload URL
                uploadUrl: '${pageContext.request.contextPath}/base64/uploadImage', // Server-side image upload handler URL
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
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>
