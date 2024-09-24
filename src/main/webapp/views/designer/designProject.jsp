<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Design Project Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <style>

            .info-section {
                display: flex;
                justify-content: space-between;
            }

            .info-box, .image-box, .notes-box {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .image-box {
                width: 25%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .image-box img {
                max-width: 100%;
                height: auto;
                margin-bottom: 20px;
            }

            .notes-box {
                width: 25%;
            }

            .info-box {
                width: 70%;
            }

            .tabs {
                display: flex;
                justify-content: space-around;
                margin-bottom: 20px;
            }

            .tabs button {
                background-color: #f0f0f0;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
            }

            .tabs button.active {
                background-color: #6c63ff;
                color: #fff;
            }

            .image-grid {
                display: grid;
                grid-template-columns: repeat(5, 1fr);
                gap: 10px;
                margin-bottom: 20px;
            }

            .image-grid div {
                background-color: #f0f0f0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 10px;
                border-radius: 5px;
                text-align: center;
            }

            .image-grid div img {
                max-width: 100%;
                height: auto;
                margin-bottom: 5px;
            }

            .upload-btn-wrapper {
                position: relative;
                overflow: hidden;
                display: inline-block;
            }

            .upload-btn {
                background-color: #6c63ff;
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .upload-btn-wrapper input[type=file] {
                font-size: 100px;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
                font-weight: bold;
                padding: 10px 20px;
                width: 100%;
                border-radius: 5px;
            }

            .file-info {
                background-color: #f0f0f0;
                padding: 12px;
                border-radius: 5px;
                margin-bottom: 10px;
            }

            .comment-box {
                background-color: #f0f0f0;
                padding: 12px;
                border-radius: 5px;
                margin-bottom: 10px;
                width: 100%;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <!-- Header -->
            <div class="container">
                <!-- Header -->
                <header>
                    <div class="nav">
                        <a href="/designer/task" class="nav-link">My Projects</a>
                        <a href="/logout" class="btn btn-logout">Logout</a>
                    </div>
                </header>

                <!-- Main Section -->
                <div class="info-section">
                    <!-- Image at Scene -->
                    <div class="image-box">
                        <img src="${project.imgURL}" alt="Project Image">
                        <div class="notes-box">
                            <h5>Notes</h5>
                            <textarea rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
                        </div>
                    </div>

                    <!-- Project Information -->
                    <div class="info-box">
                        <h4 class="text-center">Project Information</h4>
                        <div class="tabs">
                            <button class="${currentStage == 'conceptual' ? 'active' : ''}">Conceptual</button>
                            <button class="${currentStage == 'basic' ? 'active' : ''}">Basic</button>
                            <button class="${currentStage == 'detail' ? 'active' : ''}">Detail</button>
                        </div>

                        <!-- Display the relevant images and data for the current stage -->
                        <div class="image-grid">
                            <c:forEach var="image" items="${bluePrint}">
                                <c:if test="${currentStage == 'conceptual' && image.stage == 'conceptual'}">
                                    <div>
                                        <img src="${image.imgUrl}" alt="Blueprint Image">
                                        <p>${image.dateCreate}</p>
                                        <a href="${image.imgUrl}" target="_blank">Click for detail</a>
                                    </div>
                                </c:if>
                                <c:if test="${currentStage == 'basic' && image.stage == 'basic'}">
                                    <div>
                                        <img src="${image.imgUrl}" alt="Blueprint Image">
                                        <p>${image.dateCreate}</p>
                                        <a href="${image.imgUrl}" target="_blank">Click for detail</a>
                                    </div>
                                </c:if>
                                <c:if test="${currentStage == 'detail' && image.stage == 'detail'}">
                                    <div>
                                        <img src="${image.imgUrl}" alt="Blueprint Image">
                                        <p>${image.dateCreate}</p>
                                        <a href="${image.imgUrl}" target="_blank">Click for detail</a>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="form-group">
                            <label for="file">Choose file:</label>
                            <input type="image" id="image" name="image" class="form-control-file" required/>
                        </div>
                        <c:forEach var="stage" items="${designStage}">
                            <c:if test="${stage.designStageName.toLowerCase() == currentStage}">
                                <!-- File Upload for current stage -->
                                <div class="file-info">
                                    <p><strong>Summary File:</strong> 
                                        <a href="/download/${stage.summaryFile}" class="btn btn-link">Download</a>
                                    </p>
                                </div>
                            </c:if>
                        </c:forEach>

                        <div class="upload-btn-wrapper">
                            <button class="upload-btn">Upload Summary File</button>
                            <input type="file" name="summaryFile" />
                        </div>

                        <!-- Comment Section -->
                        <div class="comment-box">
                            <textarea rows="4" class="form-control" placeholder="Comment on file..."></textarea>
                        </div>

                        <!-- Design Status -->
                        <button class="btn btn-danger">Design Status</button>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
