
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
