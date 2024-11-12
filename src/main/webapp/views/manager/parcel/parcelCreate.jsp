
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Create Parcel</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Poppins', sans-serif;
        }
        .quote-info h4 {
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-group label {
            font-weight: bold;
            color: #343a40;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 25px;
            padding: 10px 20px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>

<div class="container mt-5">
    <div class="row">
        <%@include file="../navBar.jsp" %>

        <!-- Right Column for Contract Creation Form -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <h2 class="mb-4">Create Package</h2>

            <!-- Bind the form to the "contract" object -->
            <form:form action="${pageContext.request.contextPath}/manager/parcel/save" modelAttribute="newParcel" method="POST" enctype="multipart/form-data" class="needs-validation" novalidate="true">

                <!-- Customer Name -->
                <div class="form-group">
                    <label for="packageName">Package name:</label>
                    <form:input path="packageName" id="packageName" class="form-control" />
                </div>

                <!-- Customer phone -->
                <div class="form-group">
                    <label for="constructionPriceOnSquareRoot">Construction Price On Square Root:</label>
                    <form:input path="constructionPriceOnSquareRoot" id="constructionPriceOnSquareRoot" class="form-control" />
                </div>

                <!-- Customer Email -->
                <div class="form-group">
                    <label for="designOnSquareRoot">Design On Square Root:</label>
                    <form:input path="designOnSquareRoot" id="designOnSquareRoot" class="form-control" />
                </div>

                <!-- Content -->
                <div class="form-group">
                    <label for="packageDescription">package Description: </label>
                    <form:input path="packageDescription" id="packageDescription" class="form-control" />
                </div>

                <button  type="submit" class="btn btn-primary">Create Package</button>
            </form:form>
        </main>
        </div>
    </div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- JavaScript for input validation and form submission confirmation -->
<script>
    // Validate numeric input and ensure minimum value is greater than 0
    document.querySelectorAll('input[type="number"]').forEach(input => {
        input.addEventListener('input', function () {
            // Allow only digits and one decimal point
            if (/[^0-9.]/.test(this.value)) {
                this.value = "0";  // Reset to 0 if invalid characters are found
                return;
            }

            // Split input on '.' to manage decimal points
            const parts = this.value.split('.');

            // If more than one '.' or invalid numeric parts, reset to 0
            if (parts.length > 2 || !/^\d*$/.test(parts[0]) || (parts[1] && !/^\d*$/.test(parts[1]))) {
                this.value = "0";
                return;
            }

            // If the value is less than or equal to 0, reset to 0
            if (parseFloat(this.value) <= 0) {
                this.value = "0";
                return;
            }
        });

        input.addEventListener('blur', function () {
            // If input is empty, NaN, or less than or equal to 0 after blur, reset to 0
            if (this.value === "" || parseFloat(this.value) <= 0 || isNaN(parseFloat(this.value))) {
                this.value = "0";
            }
        });
    });

    // Validate the form before submission
    let isConfirmed = false; // Track if the user has already confirmed

    function validateForm() {
        if (!isConfirmed) {
            const packageName = document.getElementById('packageName').value.trim();
            const constructionPrice = parseFloat(document.getElementById('constructionPriceOnSquareRoot').value) || 0;
            const designPrice = parseFloat(document.getElementById('designOnSquareRoot').value) || 0;
            const description = document.getElementById('packageDescription').value.trim();

            // Validate that all fields have valid values
            if (packageName === "" || description === "") {
                alert('Package name and description cannot be empty.');
                return false;
            }
            if (constructionPrice <= 0 || designPrice <= 0) {
                alert('Construction and design prices must be valid numbers greater than 0.');
                return false;
            }

            // Show confirmation message only the first time
            if (!confirm('Are you sure you want to create this package?')) {
                return false;
            }

            isConfirmed = true; // Mark as confirmed if the user clicks "Yes"
        }

        return true; // Proceed with form submission
    }

    // Attach validation to form on submit
    document.querySelector('form').onsubmit = validateForm;
    </script>
</body>
</html>
