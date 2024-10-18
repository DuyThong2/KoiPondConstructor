<%-- 
    Document   : reset_password_form
    Created on : Sep 28, 2024, 1:15:12 PM
    Author     : Admin
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>"> <!-- boxicons -->
    <title>Reset password</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/reset-password" method="post" class="wrapper">
    <h1>Reset Password</h1>
    <input type="hidden" name="token" value="${token}">

    <div class="input-box">
        <input type="password" name="password" placeholder="Enter New Password" required minlength="8" class="input-field">
        <i class='bx bx-lock'></i>
    </div>

    <div class="input-box">
        <input type="password" name="confirmPassword" placeholder="Confirm New Password" required minlength="8" class="input-field">
        <i class='bx bx-lock-open'></i>
    </div>

    <button type="submit" class="btn">Reset Password</button>
</form>


</body>
</html>

