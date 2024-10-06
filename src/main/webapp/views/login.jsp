<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login Page</title>
            <!-- style css -->
            <link rel="stylesheet" href="<c:url value='/css/login.css'/>"> <!-- boxicons -->
            <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
            <style>

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
            </script>
        </head>

        <body>
            <div class="wrapper">
                <form action="/authenticateTheUser" method="post">
                    <h1>Login</h1>
                    <div class="input-box">
                        <input type="text" name="username" placeholder="Email" required>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box">
                        <input type="password" name="password" placeholder="Password" required>
                        <i class='bx bxs-lock'></i>
                    </div>
                    <button type="submit" class="btn">Login</button>
                    <div class="register-link">
                        <p>Don't have an account?
                            <a href="/register">Sign up</a>
                        </p>
                    </div>
                    <div class="link register-link forgot-password">
                        <a href="/forgot-password">Forgot your password?</a>
                    </div>
                    <div class="register-link">
                        <a href="/oauth2/authorization/google" class="link  oauth-btn">
                            <i class='bx bxl-google'></i> Login with Google
                        </a>
                    </div>
                </form>

                <!-- Forgot Password link -->
              
                <!-- Google OAuth 2.0 Login -->
               
               
            </div>

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