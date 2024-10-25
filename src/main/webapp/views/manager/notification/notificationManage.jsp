<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Notification</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Mukta', sans-serif;
        }
        .section-header {
            margin-bottom: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }
        .quotes-section, .PreDesign-section, .customer-section {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .btn-custom {
            margin-top: 20px;
            padding: 10px 20px;
        }
        .status-badge {
            font-size: 1.2em;
            padding: 10px 15px;
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>
<div class="container-fluid mt-5">
    <div class="row">
        <!-- Include Navbar -->
        <%@ include file="../navBar.jsp" %>

        <!-- Main Content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          
        </main>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
