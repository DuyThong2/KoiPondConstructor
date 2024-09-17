<%-- 
    Document   : uploadForm
    Created on : Sep 17, 2024, 8:10:55 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload File</title>
</head>
<body>
    <h1>Upload a File</h1>

    <!-- Display success or error message -->
    <p>${message}</p>

    <!-- Form to upload file -->
    <form method="POST" action="/upload" enctype="multipart/form-data">
        <label for="file">Choose file:</label>
        <input type="file" id="file" name="file" required><br><br>

        <label for="type">Select file type:</label>
        <select id="type" name="type">
            <option value="user">User</option>
            <option value="staff">Staff</option>
            <option value="designSummary">Design Summary</option>
            <option value="designBlueprint">Design Blueprint</option>
            <option value="blog">Blog</option>
            <option value="project">Project</option>
        </select><br><br>

        <label for="subDir">Sub Directory (optional):</label>
        <input type="text" id="subDir" name="subDir"><br><br>

        <button type="submit">Upload</button>
    </form>
</body>
</html>
