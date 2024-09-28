<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script>
        function showMessage(message) {
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body onload="showMessage('${message}')">
    <h2>Please Login</h2>

    <!-- Login Form for Form-based Authentication -->
    <form action="/authenticateTheUser" method="post">
        <input type="text" name="username" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>

    <!-- Display error message if login fails -->
   

    <!-- Google OAuth 2.0 Login -->
    <h2>Login with OAuth 2.0</h2>
    <a href="/oauth2/authorization/google">Google</a>
</body>
</html>
