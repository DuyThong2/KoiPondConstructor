<%-- 
    Document   : forgot_password
    Created on : Sep 28, 2024, 1:14:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Forgot password</title>
    </head>
    <body>
        <form action="/forgot-password" method="post">
            <label for="email">Enter your email address:</label>
            <input type="email" name="email" required>
            <button type="submit">Send Reset Link</button>
        </form>
    </body>
</html>

