


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="<c:url value='/css/login.css'/>"> <!-- boxicons -->

        <title>Forgot password</title>

    </head>
    <body>
        <form action="${pageContext.request.contextPath}/forgot-password" method="post" class="wrapper">
            <h1>Forgot Password</h1>

            <div class="input-box">
                <input type="email" name="email" placeholder="Enter your email address" required class="input-field">
                <i class='bx bxs-envelope'></i>
            </div>

            <button type="submit" class="btn">Send Reset Link</button>
        </form>

    </body>
</html>

