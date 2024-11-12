<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Construction and Customer Information</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .info-section {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .info-box {
            width: 68%;
            background-color: #fff;
            padding: 23px;
            margin: 5px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .info-box-small {
            width: 30%;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .info-item p, .info-item textarea {
            background-color: #f0f0f0;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 1rem;
        }


        h3 {
            font-size: 1.5rem;
            color: #343a40;
            margin-bottom: 20px;
            font-weight: bold;
            border-bottom: 2px solid #343a40;
            padding-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <%@include file="navbarConstruction.jsp" %>

    <!-- Info Sections -->
    <div class="info-section">
        <!-- Customer Information -->
        <div class="info-box info-box-small">
            <h3>Customer Information</h3>
            <div class="info-item">
                <p><strong>Name:</strong> ${customer.name}</p>
            </div>
            <div class="info-item">
                <p><strong>Phone Number:</strong> ${customer.phone}</p>
            </div>
            <div class="info-item mb-4">
                <p><strong>Email:</strong> ${customer.email}</p>
            </div>

        </div>

        <!-- Construction Information -->
        <div class="info-box">
            <h3>Construction Information</h3>
            <div class="info-item">
                <p><strong>Construction Name:</strong> ${construction.constructionName}</p>
            </div>
            <div class="info-item">
                <p><strong>Address:</strong> ${construction.project.address}</p>
            </div>
            <div class="info-item">
                <p><strong>Design Aesthetic:</strong> ${construction.project.style}</p>
            </div>
            <div class="info-item">
                <p><strong>Area (m²):</strong> ${quote.quotesArea}</p>
            </div>
            <div class="info-item">
                <p><strong>Description:</strong> ${construction.project.description}</p>
            </div>
            <div class="info-item">
                <p><strong>Start Date: </strong><fmt:formatDate value="${construction.project.dateStart}" pattern="MMM dd yyyy"/></p>
            </div>
            <div class="info-item">
                <p><strong>End Date: </strong>
                    <c:choose>
                        <c:when test="${empty construction.project.dateEnd}">Not yet</c:when>
                        <c:otherwise><fmt:formatDate value="${construction.project.dateEnd}" pattern="MMM dd yyyy"/></c:otherwise>
                    </c:choose>
                </p>
            </div>
            <div class="info-item">
                <p><strong>Construction Status:</strong>
                    <c:choose>
                        <c:when test="${construction.constructionStatus == 1}">
                            <span class="badge badge-secondary">Pending</span>
                        </c:when>
                        <c:when test="${construction.constructionStatus == 2}">
                            <span class="badge badge-primary">Processing</span>
                        </c:when>
                        <c:when test="${construction.constructionStatus == 3}">
                            <span class="badge badge-success">Completed</span>
                        </c:when>
                        <c:when test="${construction.constructionStatus == 4}">
                            <span class="badge badge-warning">Canceled</span>
                        </c:when>
                    </c:choose>
                </p>
            </div>
            <div class="info-item">
                <a href="${pageContext.request.contextPath}/constructor/designStage/detail/${construction.project.projectId}" class="btn btn-info">
                    <i class="fas fa-file-alt"></i> View All Design
                </a>
                <a href="${pageContext.request.contextPath}/constructor/construction/detail/${construction.constructionId}" class="btn btn-primary">
                    <i class="fas fa-file-alt"></i> Manage Construction
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
