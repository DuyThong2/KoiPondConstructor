
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>"> <!-- boxicons -->
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
    <title>Forgot password</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' type="text/css"  rel='stylesheet'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@include file="popup.jsp"%>
<form action="${pageContext.request.contextPath}/forgot-password" method="post" class="wrapper">
    <h1>Forgot Password</h1>

    <div class="input-box">
        <input type="email" name="email" placeholder="Enter your email address" required class="input-field">
        <i class='bx bxs-envelope'></i>
    </div>

    <button type="submit" class="btn">Send Reset Link</button>
    <div class="register-link">
        <p>
            <a href="${pageContext.request.contextPath}/login" style="font-size: 18px"> Back to Login</a>
        </p>
    </div>
</form>

</body>

</html>

