<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        body {
            background-color: #f7f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* General Layout */
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .section-header {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #007bff;
            font-weight: bold;
            color: #007bff;
        }

        /* Cards for sections */
        .section-card {
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            transition: transform 0.3s ease;
        }

        .section-card:hover {
            transform: translateY(-5px);
        }

        .table th, .table td {
            vertical-align: middle;
            padding: 15px;
        }

        .table th {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        .icon-btn {
            margin-right: 8px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .table {
                font-size: 0.9rem;
            }
        }

    </style>
</head>
<div style="height:6vh;"></div>
<body>
<div class="container-fluid mt-5">
    <div class="row">
        <!-- Include Navbar -->
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <!-- Customer Details Section -->
            <div class="section-card">
                <h2 class="section-header"><i class="fas fa-user"></i> Customer Information</h2>
                <table class="table table-striped">
                    <tr>
                        <th>Customer ID</th>
                        <td>${customer.id}</td>
                    </tr>
                    <tr>
                        <th>Customer Name</th>
                        <td>${customer.name}</td>
                    </tr>
                    <tr>
                        <th>Customer Email</th>
                        <td>${customer.email}</td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td>${customer.phone}</td>
                    </tr>
                    <tr>
                        <th>Total Projects</th>
                        <td>${totalProject}</td>
                    </tr>
                    <tr>
                        <th>Total Loyalty Points</th>
                        <td>${totalLoyaltyPoint} points</td>
                    </tr>
                </table>
            </div>

            <!-- Projects Section -->
            <div class="section-card">
                <h4 class="section-header"><i class="fas fa-project-diagram"></i> Associated Projects</h4>
                <c:if test="${not empty projects}">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Project ID</th>
                            <th>Project Name</th>
                            <th>Description</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="project" items="${projects}">
                            <tr>
                                <td>${project.projectId}</td>
                                <td>${project.projectName}</td>
                                <td>${project.description}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${project.status == 1}">
                                            <span class="badge badge-secondary">Pending</span>
                                        </c:when>
                                        <c:when test="${project.status == 2}">
                                            <span class="badge badge-primary">In Progress</span>
                                        </c:when>
                                        <c:when test="${project.status == 3}">
                                            <span class="badge badge-success">Completed</span>
                                        </c:when>
                                        <c:when test="${project.status == 4}">
                                            <span class="badge badge-warning">Cancelled</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/manager/projects/detail/${project.projectId}" method="GET" class="d-inline">
                                        <button type="submit" class="btn btn-info">
                                            <i class="fas fa-eye icon-btn"></i> Details
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty projects}">
                    <p class="text-muted">No projects associated with ths customer.</p>
                </c:if>
            </div>
            <!-- Service Section -->
            <div class="section-card">
                <h4 class="section-header"><i class="fas fa-project-diagram"></i> Associated Service</h4>
                <c:if test="${not empty serviceDetails}">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Service Detail ID</th>
                            <th>Service Name</th>
                            <th>Service Description</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="detail" items="${serviceDetails}">
                            <tr>
                                <td>${detail.id}</td>
                                <td>${detail.service.serviceName}</td>
                                <td>${detail.service.serviceDescription}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/manager/serviceDetail/detail/${detail.id}" method="GET" class="d-inline">
                                        <button type="submit" class="btn btn-info">
                                            <i class="fas fa-eye icon-btn"></i> Details
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty serviceDetails}">
                    <p class="text-muted">No Service associated with ths customer.</p>
                </c:if>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
