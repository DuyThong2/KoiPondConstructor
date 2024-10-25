<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>

    <!-- CSS Links -->
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
        }
    </style>

    <script>
        // Function to check if the password is duplicate
        function checkPasswordMatch() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                document.getElementById("passwordError").innerText = "Passwords do not match!";
                return false;
            } else {
                document.getElementById("passwordError").innerText = "";
                return true;
            }
        }

        // Function to show message popup


        function closeMessage() {
            var messageType = '${message}';
            const message = document.querySelector('.popup-error, .popup-success');
            message.style.top = "-100%";
            const overlay = document.querySelector('.overlay');
            if (overlay) {
                overlay.classList.remove('overlay');
            }
            if (messageType === "success") {
                window.location.href = "AMainController";
            }
        }
    </script>
</head>

<body onload="showMessagePopup('${message}')">
<div class="wrapper">
    <form:form action="${pageContext.request.contextPath}/register" modelAttribute="customerDTO" method="POST" onsubmit="return checkPasswordMatch()">
        <h1>Register</h1>

        <div class="input-box">
            <form:input path="name" placeholder="Enter Your Full Name" required="true" cssClass="form-control"/>
            <i class='bx bxs-user'></i>
            <form:errors path="name" cssClass="error"/>
        </div>

        <div class="input-box">
            <form:input path="phone" placeholder="Enter Your Phone Number" required="true" minlength="10" cssClass="form-control"/>
            <i class='bx bxs-phone'></i>
            <form:errors path="phone" cssClass="error"/>
        </div>

        <div class="input-box">
            <form:input path="email" placeholder="Enter Email" required="true" cssClass="form-control"/>
            <i class='bx bxs-envelope'></i>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="input-box">
            <form:password path="password" placeholder="Enter Password" id="password" required="true" minlength="8" cssClass="form-control"/>
            <i class='bx bx-lock'></i>
            <form:errors path="password" cssClass="error"/>
        </div>

        <div class="input-box">
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required minlength="8" class="form-control"/>
            <i class='bx bx-lock-open'></i>
            <div id="passwordError" style="color:red;"></div>
        </div>

        <button type="submit" value="register" class="btn">Register</button>

        <div class="register-link">
            <p> Have an account already?
                <a href="${pageContext.request.contextPath}/login"> Back to Login</a>
            </p>
        </div>
    </form:form>

    <!-- Forgot Password link -->
    <div class="forgot-password">
        <a href="${pageContext.request.contextPath}/forgot-password">Forgot your password?</a>
    </div>
</div>

<!-- Error or Success Message Section -->

<!-- Error Message Section -->
<c:if test="${message !=null}">
    <div class="popup-error" style="top: -100%;">
        <i class='error-close bx bxs-x-circle' onclick="closeError()"></i>
        <p class="error-text">
            <!-- Display error message if available -->
                ${message}
        </p>
    </div>
    <div class="overlay"></div>
</c:if>
</body>
</html>
