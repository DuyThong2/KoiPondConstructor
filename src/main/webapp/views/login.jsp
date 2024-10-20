<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- style css -->
    <link rel="stylesheet" type="text/css"  href="<c:url value='/css/login.css'/>">
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
    <!-- boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' type="text/css"  rel='stylesheet'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* Add style for the error message popup */
        .popup-error {
            position: absolute;
            top: -100%;
            left: 50%;
            transform: translateX(-50%);
            background-color: #ff4d4d;
            color: white;
            padding: 10px;
            border-radius: 5px;
            transition: top 0.3s ease-in-out;
        }

        /* Display the popup when an error occurs */
        .popup-error.show {
            top: 10%; /* Adjust to show the error popup */
        }

        /* Overlay to dim background */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
        }
    </style>
    <script>
        function closeError() {
            const error = document.querySelector('.popup-error');
            if (error) {
                error.style.top = "-100%";
                const overlay = document.querySelector('.overlay');
                if (overlay) {
                    overlay.classList.remove('overlay');
                }
            }
        }

        // Automatically show the error message if available
        window.onload = function () {
            const error = document.querySelector('.popup-error');
            if (error) {
                error.classList.add('show');
            }
        };
    </script>
</head>

<body>
<div class="wrapper">
    <form action="${pageContext.request.contextPath}/authenticateTheUser" method="post">
        <h1>Login</h1>
        <div class="input-box">
            <input type="text" name="username" placeholder="Email" required>
            <i class='bx bxs-user'></i>
        </div>
        <div class="input-box">
            <!-- Added autocomplete="off" for better security -->
            <input type="password" name="password" placeholder="Password" required autocomplete="off">
            <i class='bx bxs-lock'></i>
        </div>
        <button type="submit" class="btn">Login</button>
        <div class="register-link">
            <p>Don't have an account?
                <a href="${pageContext.request.contextPath}/register">Sign up</a>
            </p>
        </div>
        <div class="link register-link forgot-password">
            <a href="${pageContext.request.contextPath}/forgot-password">Forgot your password?</a>
        </div>
        <div class="register-link">
            <a href="${pageContext.request.contextPath}/oauth2/authorization/google" class="link oauth-btn">
                <i class='bx bxl-google'></i> Login with Google
            </a>
        </div>
    </form>

</div>
<div id="successPopup" class="popup-background">
    <div class="popup-box success">
        <i class="fas fa-check-circle"></i> <!-- Icon success -->
        <h2 class="success">Success!</h2>
        <p>${success}</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</div>

<!-- Popup for error -->
<div id="errorPopup" class="popup-background">
    <div class="popup-box error">
        <i class="fas fa-exclamation-circle"></i> <!-- Icon error -->
        <h2 class="error">Error!</h2>
        <p>${error}</p>
        <button class="close-btn" onclick="closePopup()">Close</button>
    </div>
</div>

<script>
    function showSuccessPopup() {
        const successPopup = document.getElementById('successPopup');
        successPopup.classList.add('show');
        const popupBox = successPopup.querySelector('.popup-box');
        setTimeout(() => {
            popupBox.classList.add('show');
        }, 10);
    }

    function showErrorPopup() {
        const errorPopup = document.getElementById('errorPopup');
        errorPopup.classList.add('show');
        const popupBox = errorPopup.querySelector('.popup-box');
        setTimeout(() => {
            popupBox.classList.add('show');
        }, 10);
    }

    function closePopup() {
        const popups = document.querySelectorAll('.popup-background.show');
        popups.forEach(popup => {
            const popupBox = popup.querySelector('.popup-box');
            popupBox.classList.remove('show');
            setTimeout(() => {
                popup.classList.remove('show');
            }, 300);
        });
    }
</script>

<c:if test="${not empty success}">
    <script>
        showSuccessPopup();
    </script>
</c:if>

<c:if test="${not empty error}">
    <script>
        showErrorPopup();
    </script>
</c:if>
<!-- Error Message Section -->
<c:if test="${message != null}">
    <div class="popup-error">
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
