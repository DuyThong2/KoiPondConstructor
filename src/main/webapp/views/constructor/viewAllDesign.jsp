<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Blueprints</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f4f4f9;
                font-family: 'Arial', sans-serif;
            }

            .page-header {
                padding: 20px;
                margin-bottom: 30px;
                background-color: #fff;
                color: white;
                text-align: center;
                border-radius: 8px;
            }

            .page-header h2 {
                font-size: 2.2rem;
                font-weight: bold;
                margin: 0;
            }

            .upload-section, .blueprint-gallery {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                margin-bottom: 30px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            h3 {
                font-weight: bold;
                margin-bottom: 20px;
                font-size: 1.8rem;
                color: #007bff;
            }


            .drop-zone input {
                display: none;
            }


            .preview img {
                max-width: 100%;
                border-radius: 5px;
            }

            .btn {
                font-size: 1rem;
                padding: 12px;
                width: 100%;
                max-width: 250px;
                margin: 20px 5px;
                transition: background-color 0.3s ease;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .blueprint-gallery .col-md-4 {
                margin-bottom: 30px;
            }

            .blueprint-gallery .card {
                width: 350px;
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                border-radius: 10px;
                overflow: hidden;
            }

            .blueprint-gallery .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            }

            .blueprint-gallery .card-img-top {
                height: 220px;
                object-fit: cover;
                border-radius: 5px;
            }

            .nav-link .user-name {
                margin-left: 10px;
                color: #fff;
            }

            .blueprint-gallery .blueprint-card {
                transition: all 0.3s ease-in-out;
                border-radius: 10px;

            }

            .blueprint-gallery .blueprint-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }
            .summary-file-section {
                margin-top: 20px;
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .summary-file-section p {
                font-size: 1.2rem;
                color: #343a40;
            }

            .summary-button {
                font-size: 1rem;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
            }

            .summary-button:hover {
                background-color: #007bff;
                color: white;
            }

        </style>
    </head>

    <body>
        <div class="container">
            <%@include file="navbarConstruction.jsp" %>

            <div class="container-fluid mt-3">
                <!-- Page Header with Back Button -->
                <c:forEach var="designStage" items="${designStage}">
                    <div class="page-header text-center text-muted ">
                        <h2>Manage Blueprints for: ${designStage.designStageName}</h2>
                    </div>

                    <!-- Existing Blueprints Section -->
                    <div class="blueprint-gallery">
                        <div class="row">
                            <c:choose>
                            <c:when test="${not empty designStage.bluePrint}">
                            <c:forEach var="blueprint" items="${designStage.bluePrint}">
                                <div class="col-md-4">
                                    <div class="card">
                                        <img class="card-img-top" src="${blueprint.getShowingImg(blueprint.imgUrl)}" alt="Blueprint Image">
                                        <div class="card-body">
                                            <p><strong>Date Uploaded:</strong> <fmt:formatDate value="${blueprint.dateCreate}" pattern="MMM dd yyyy"/></p>
                                            <div class="d-flex justify-content-between">
                                                <a href="${blueprint.getShowingImg(blueprint.imgUrl)}" class="btn btn-primary" target="_blank">View Full Image</a>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12 text-center">
                                    <p class="text-muted" style="font-size: 1.2rem;">Waiting for Designer please!</p>
                                </div>
                            </c:otherwise>
                            </c:choose>
                        </div>


                    <!-- Bổ sung lớp CSS và bọc phần này trong một div riêng -->

                        <c:if test="${designStage.designStageStatus == 4}">
                        <div class="summary-file-section text-center">
                            <p><strong>Summary File:</strong></p>
                            <c:choose>
                                <c:when test="${not empty designStage.summaryFile}">
                                    <form action="${pageContext.request.contextPath}/download/${designStage.summaryFile}" method="get">
                                        <button type="submit" class="btn btn-outline-primary summary-button">
                                            <i class="fas fa-download"></i> Download file
                                        </button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn btn-outline-danger summary-button">
                                        <i class="fas fa-download"></i> File not available
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        </c:if>

            </div>
                </c:forEach>
            </div>


            <!-- Bootstrap JS -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>

</html>
