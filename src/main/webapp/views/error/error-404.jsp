<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Page Not Found</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <%@include file="../customer/cssTemplate.jsp"%>
    <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
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
    <img src="${pageContext.request.contextPath}/assets/imgs/404_page_not_found_image.png" alt="Access Denied">
    <h1>404 - Page Not Found</h1>
    <p>The page you are looking for might have been removed or is temporarily unavailable.</p>

    <div class="contact-support">
        <a href="#" class="btn btn-danger">
            <i class="fas fa-envelope"></i> Contact Support
        </a>
    </div>

</div>
</body>
</html>
