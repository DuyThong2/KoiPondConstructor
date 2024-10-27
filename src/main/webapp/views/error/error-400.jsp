<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bad Request</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <c:choose>
        <c:when test="${sessionScope.user.authority.authority == 'ROLE_CUSTOMER'}">
            <%@include file="../customer/cssTemplate.jsp"%>
        </c:when>
        <c:when test="${sessionScope.user.authority.authority == 'ROLE_MANAGER'}">
            <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        </c:when>
        <c:otherwise>
            <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">

        </c:otherwise>
    </c:choose>
    <style>
        .error-container {
            text-align: center;
            padding: 50px;
            margin: 50px auto;
        }
        .error-container img {
            max-width: 200px;
            margin-bottom: 20px;
        }
        .error-container h1 {
            font-size: 3rem;
            color: #dc3545;
        }
        .error-container p {
            font-size: 1.2rem;
        }
        .back-button, .contact-support {
            margin-top: 20px;
        }
    </style>
</head>

<body>
<c:if test="${sessionScope.user.authority.authority == 'ROLE_CUSTOMER'}">
    <%@include file="../customer/homePageNavbar.jsp" %>
</c:if>
<c:if test="${sessionScope.user.authority.authority == 'ROLE_CONSULTANT'}">
    <%@include file="../consultant/consultantNav.jsp" %>
</c:if>
<c:if test="${sessionScope.user.authority.authority == 'ROLE_DESIGNER'}">
    <%@include file="../designer/navbarDesign.jsp" %>
</c:if>
<c:if test="${sessionScope.user.authority.authority == 'ROLE_CONSTRUCTOR'}">
    <%@include file="../constructor/navbarConstruction.jsp" %>
</c:if>
<c:if test="${sessionScope.user.authority.authority == 'ROLE_MANAGER'}">
    <%@include file="../manager/navBar.jsp" %>
</c:if>

<div class="error-container">
    <img src="${pageContext.request.contextPath}/assets/imgs/400_bad_request_image.png" alt="Access Denied">
    <h1>400 - Bad Request</h1>
    <p>The request could not be understood by the server due to malformed syntax.</p>

    <div class="alert alert-warning" role="alert">
        Please check the URL or contact support if the problem persists.
    </div>

    <div class="contact-support">
        <a href="/contact-support" class="btn btn-danger">
            <i class="fas fa-envelope"></i> Contact Support
        </a>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
