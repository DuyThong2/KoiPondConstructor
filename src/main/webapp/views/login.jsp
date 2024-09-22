<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
    </head>
    <body>
        <h2>Please Login</h2>

        <form action="/authenticateTheUser" method="post">
            <input type="text" name="username" placeholder="Email">
            <input type="password" name="password" placeholder="Password">
            <button type="submit">Login</button>
        </form>

        <!-- Error Handling -->
        <c:if test="${not empty error}">
            <p style="color:red;">Invalid email or password. Please try again.</p>
        </c:if>
    </body>
</html>
