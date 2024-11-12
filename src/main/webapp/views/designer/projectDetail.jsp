<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project and Customer Information</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">

    <style>


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
    <%@include file="navbarDesign.jsp" %>


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

        <!-- Project Information -->
        <div class="info-box">
            <h3>Project Information</h3>
            <div class="info-item">
                <p><strong>Project Name:</strong> ${project.projectName}</p>
            </div>
            <div class="info-item">
                <p><strong>Address:</strong> ${project.address}</p>
            </div>
            <div class="info-item">
                <p><strong>Design Aesthetic:</strong> ${project.style}</p>
            </div>
            <div class="info-item">
                <p><strong>Area (m²):</strong> ${quote.quotesArea}</p>
            </div>
            <div class="info-item">
                <p><strong>Description:</strong> ${project.description}</p>
            </div>
            <div class="info-item">
                <p><strong>Start Date:</strong><fmt:formatDate value="${project.dateStart}" pattern="MMM dd yyyy"/></p>
            </div>
            <div class="info-item">
                <p><strong>End Date:</strong>
                    <c:choose>
                        <c:when test="${empty project.dateEnd}">Not yet</c:when>
                        <c:otherwise><fmt:formatDate value="${project.dateEnd}" pattern="MMM dd yyyy"/></c:otherwise>
                    </c:choose>
                </p>
            </div>
            <div class="info-item">
                <p><strong>Project Status:</strong>
                    <c:choose>
                        <c:when test="${project.status == 1}">
                            <span class="badge badge-secondary">Pending</span>
                        </c:when>
                        <c:when test="${project.status == 2}">
                            <span class="badge badge-primary">Processing</span>
                        </c:when>
                        <c:when test="${project.status == 3}">
                            <span class="badge badge-success">Completed</span>
                        </c:when>
                        <c:when test="${project.status == 4}">
                            <span class="badge badge-warning">Canceled</span>
                        </c:when>
                    </c:choose>
                </p>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/designer/design/detail/${project.design.designId}" class="btn btn-primary">Design Detail</a>
            
                <c:if test="${project.preDesign.preDesignId != null}">
                     <a href="${pageContext.request.contextPath}/designer/project/preDesign/${project.preDesign.preDesignId}"  class="btn btn-primary">View Pre Design</a>
            
                </c:if>
                </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>
