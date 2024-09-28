<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Blueprints</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f9;
                font-family: 'Arial', sans-serif;
            }

            .back-button {
                margin-top: 5px;
                margin-bottom: 5px;
            }

            .page-header {
                padding: 10px 0;
                margin-bottom: 20px;
                height: 70px;
                border-bottom: 1px solid #dee2e6;
                background-color: #fff;
            }

            .page-header h2 {
                font-weight: bold;
                margin-bottom: 0;
            }

            .card {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                border: none;
                transition: all 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            }

            .card-body p {
                margin-bottom: 10px;
                font-size: 14px;
                color: #6c757d;
            }

            .btn {
                transition: all 0.3s ease;
            }

            .btn-primary:hover, .btn-danger:hover {
                opacity: 0.8;
            }

            .btn-info {
                background-color: #17a2b8;
                border: none;
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .form-group label {
                font-weight: bold;
                color: #495057;
            }

            .form-group input {
                margin-top: 10px;
            }

            .upload-section, .existing-blueprints {
                margin-top: 40px;
                margin-bottom: 40px;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
            }

            h3 {
                font-weight: bold;
                margin-bottom: 20px;
            }

            /* CSS để đảm bảo ảnh có cùng kích thước */
            .card-img-top {
                height: 200px;
                width: 100%;
                object-fit: cover; /* Điều chỉnh ảnh để giữ nguyên tỷ lệ */
                border-bottom: 1px solid #dee2e6;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid mt-3">
            <!-- Page Header with Back Button -->
            <div class="page-header">
                <div class="row">
                    <div class="col-md-1">
                        <button onclick="goBack()" class="btn btn-secondary back-button">
                            <i class="fas fa-arrow-left"></i> Back
                        </button>
                    </div>
                    <div class="col-md-11 text-muted text-center">
                        <h2>Manage Blueprints for: ${designStage.designStageName}</h2>
                    </div>
                </div>
            </div>

            <!-- Existing Blueprints Section -->
            <div class="existing-blueprints">
                <h3>Existing Blueprints</h3>
                <div class="row">
                    <c:forEach var="blueprint" items="${allBlueprints}">
                        <div class="col-md-4">
                            <div class="card mb-4">

                                <img class="card-img-top" src="/uploads/${blueprint.imgUrl}" alt="Blueprint Image">

                                <div class="card-body">
                                    <p><strong>Date Uploaded:</strong> ${blueprint.dateCreate}</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="/uploads/${blueprint.imgUrl}" class="btn btn-info">View Full Image</a>
                                        <a href="${pageContext.request.contextPath}/delete/${blueprint.bluePrintId}?designStageId=${designStage.designStageId}" class="btn btn-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="feedback-blueprints">
                <h3>Blueprints with Customer Feedback</h3>
                <div class="row">
                    <c:forEach var="blueprint" items="${feedbackBlueprints}">
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <img class="card-img-top" src="/uploads/${blueprint.imgUrl}" alt="Blueprint Image">
                                <div class="card-body">
                                    <p><strong>Date Uploaded:</strong> ${blueprint.dateCreate}</p>
                                    <p><strong>Feedback:</strong> 
                                        <c:forEach var="comment" items="${blueprint.comments}">
                                        <div>- ${comment.commentContent}</div>
                                    </c:forEach>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Upload New Blueprint Section -->
            <div class="upload-section">
                <h3>Upload New Blueprint</h3>
                <form action="${pageContext.request.contextPath}/designer/blueprint/upload/" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                    <div class="form-group">
                        <label for="blueprintFile">Choose Blueprint Image</label>
                        <input type="file" class="form-control-file" id="blueprintFile" name="file" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Upload</button>
                </form>
            </div>

            <!-- Update Summary File Section -->
            <div class="upload-section">
                <h3>Update Summary File</h3>
                <form action="${pageContext.request.contextPath}/updateSummary/" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                    <div class="form-group">
                        <label for="summaryFile">Choose Summary File</label>
                        <input type="file" class="form-control-file" id="summaryFile" name="file" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Summary File</button>
                </form>
            </div>
        </div>

        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>
</html>
