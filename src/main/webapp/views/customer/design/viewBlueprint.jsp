<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Blueprints</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <%@include file="../cssTemplate.jsp"%>

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
                position: relative; /* Để chứa các phần tử có vị trí tuyệt đối */
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

            /* Định vị checkbox ở góc trên bên trái của mỗi card */
            .form-check {
                position: absolute;
                top: -2px;
                left: 1px;
            }

            .form-check-label {
                display: none; /* Ẩn nhãn chữ */
            }

            .form-check-input {
                width: 30px;
                height: 30px;
            }

        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

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
                        <h2>View Design Of Blueprints for: ${designStage.designStageName}</h2>
                    </div>
                </div>
            </div>

            <!-- Existing Blueprints Section -->
            <div class="existing-blueprints">
                <h3>Existing Blueprints</h3>
                <form id="feedbackForm" action="${pageContext.request.contextPath}/feedback/send/" method="post">
                    <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                    <div class="row">
                        <c:forEach var="blueprint" items="${blueprints}">
                            <div class="col-md-4">
                                <div class="card mb-4">
                                    <a href="/uploads/${blueprint.imgUrl}">
                                        <img class="card-img-top" src="/uploads/${blueprint.imgUrl}" alt="Blueprint Image">
                                    </a>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="blueprintsId" value="${blueprint.bluePrintId}">
                                    </div>
                                    <div class="card-body">
                                        <p><strong>Date Uploaded:</strong> ${blueprint.dateCreate}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Feedback Section -->
                    <div class="feedback-section">
                        <h3>Feedback</h3>
                        <div class="form-group">
                            <label for="feedback">Please provide your feedback:</label>
                            <textarea class="form-control" id="feedback" name="feedback" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send Feedback</button>
                    </div>

                    <!-- Thông báo -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success mt-3">
                            ${successMessage}
                        </div>
                    </c:if>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger mt-3">
                            ${errorMessage}
                        </div>
                    </c:if>

                </form>
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
    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>


</html>
