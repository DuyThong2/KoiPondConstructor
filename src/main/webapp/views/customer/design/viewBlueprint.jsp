<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        .page-header {
            padding: 15px;
            margin: 30px 0;
            background-color: #fff;
            color: white;
            border-radius: 8px;
        }

        .page-header h2 {
            font-weight: bold;
            font-size: 3rem;
        }
        h3 {
            font-weight: bold;
            margin: 5px 0 15px;
            font-size: 2.6rem;
        }
        .btn {
            transition: all 0.3s ease;
            border-radius: 5px;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .back-button {
            padding: 8px 16px;
            font-size: 1rem;
        }

        .existing-blueprints {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
        }

        .card {
            position: relative;
            border: none;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-radius: 8px 8px 0 0;
        }

        .form-check {
            position: absolute;
            top: 10px;
            left: 10px;
        }

        .form-check-input {
            width: 30px;
            height: 30px;
        }

        .feedback-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-top: 30px;
        }

        .feedback-section h3 {
            font-size: 2.7rem;
            margin-bottom: 15px;
        }

        .feedback-section textarea {
            border-radius: 8px;
            font-size: 15px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<%@include file="../homePageNavbar.jsp"%>

<body>
<div class="container-fluid mt-3">
    <!-- Page Header -->
    <div class="page-header text-center">
        <h2>View Design Of Blueprints for: ${designStage.designStageName}</h2>
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
                            <a href="/uploads/${blueprint.imgUrl}" target="_blank">
                                <img class="card-img-top" src="/uploads/${blueprint.imgUrl}" alt="Blueprint Image">
                            </a>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="blueprintsId" value="${blueprint.bluePrintId}">
                            </div>
                            <div class="card-body">

                                <p><strong>Date Uploaded:</strong> <fmt:formatDate value="${blueprint.dateCreate}" pattern="dd-MM-yyyy"/>.</p>
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
                <button type="submit" class="btn btn-primary" style="padding: 10px; font-size: 15px">Send Feedback</button>
            </div>

            <!-- Notifications -->
            <c:if test="${not empty message}">
                <script>
                    alert("${message}");
                </script>
            </c:if>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
<%@include file="../footer.jsp"%>
<%@include file="../scriptTemplate.jsp"%>


</html>
