<%-- 
    Document   : reset_password_form
    Created on : Sep 28, 2024, 1:15:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Reset password</title>
    </head>
    <body>
        <form action="/reset-password" method="post">
            <input type="hidden" name="token" value="${token}">
            <label for="password">New Password:</label>
            <input type="password" name="password" required>
            <button type="submit">Reset Password</button>
        </form>

    </body>
</html>

