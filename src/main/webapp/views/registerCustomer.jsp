<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Customer Registration</title>
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
        function showMessagePopup(message) {
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body onload="showMessagePopup('${message}')">
    <h1>Register</h1>
    <form:form action="register" modelAttribute="customerDTO" method="post" onsubmit="return checkPasswordMatch()">
        <div>
            <form:label path="name">Name:</form:label>
            <form:input path="name"/>
            <form:errors path="name" cssClass="error"/>
        </div>

        <div>
            <form:label path="email">Email:</form:label>
            <form:input path="email"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div>
            <form:label path="phone">Phone:</form:label>
            <form:input path="phone"/>
            <form:errors path="phone" cssClass="error"/>
        </div>

        <div>
            <form:label path="password">Password:</form:label>
            <form:password path="password" id="password"/>
            <form:errors path="password" cssClass="error"/>
        </div>

        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword"/>
            <div id="passwordError" style="color:red;"></div>
        </div>

        <div>
            <input type="submit" value="Register"/>
        </div>
    </form:form>
</body>
</html>
