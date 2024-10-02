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
        
        <form:form method="post" enctype="multipart/form-data" modelAttribute="blog" action="/blog/new">
            <!-- Blog Title -->
            <div class="form-group">
                <label for="title">Blog Title</label>
                <form:input path="name" class="form-control" placeholder="Enter blog title" required/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>

            <!-- Blog Description -->
            <div class="form-group">
                <label for="description">Blog Description</label>
                <form:textarea path="description" class="form-control" placeholder="Enter blog description" rows="4" required/>
                <form:errors path="description" cssClass="text-danger"/>
            </div>

            <!-- Blog Content -->
            <div class="form-group">
                <label for="content">Blog Content</label>
                <textarea id="content" name="content" class="form-control" rows="6" required></textarea>
            </div>

            <!-- Blog Image Upload -->
            <div class="form-group">
                <label for="file">Upload Image</label>
                <input type="file" id="file" name="file" class="form-control-file">
            </div>

            <!-- Blog Status -->
            <div class="form-group">
                <label for="status">Status</label>
                <form:select path="status" class="form-control">
                    <form:option value="1" label="Active"/>
                    <form:option value="0" label="Inactive"/>
                </form:select>
            </div>

            <!-- Submit Button -->
            <div class="form-group btn-submit">
                <button type="submit" class="btn btn-primary">Create Blog</button>
            </div>
        </form:form>
    </div>

    <!-- CKEditor Integration -->
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('content', {
            extraPlugins: 'uploadimage',
            filebrowserImageUploadUrl: '/blog/uploadImage',
            uploadUrl: '/blog/uploadImage',
            height: 500
        });
    </script>

    <!-- Bootstrap 5 JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
