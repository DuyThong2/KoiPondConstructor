<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              rel="stylesheet">
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

            .table th,
            .table td {
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

    <body>
        <div class="container-fluid mt-5">
            <div class="row">
                <!-- Include Navbar -->
                <%@include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <!-- Staff Details Section -->
                    <div class="section-card">
                        <h2 class="section-header"><i class="fas fa-user-tie"></i> Staff Information</h2>
                        <table class="table table-striped">
                            <tr>
                                <th>Staff ID</th>
                                <td>${staff.id}</td>
                            </tr>
                            <tr>
                                <th>Staff Name</th>
                                <td>${staff.name}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${staff.email}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>${staff.phone}</td>
                            </tr>
                            <tr>
                                <th>Department</th>
                                <td>${staff.department}</td>
                            </tr>
                        </table>
                    </div>

                    <!-- Design Projects Section -->
                    <c:if test="${not empty designs}">
                        <div class="section-card">
                            <h4 class="section-header"><i class="fas fa-project-diagram"></i> Participate
                                project</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Project ID</th>
                                        <th>Project Name</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="design" items="${designs}">
                                        <tr>
                                            <td>${design.project.projectId}</td>
                                            <td>${design.project.projectName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${design.project.status == 1}">
                                                        <span class="badge badge-secondary">Pending</span>
                                                    </c:when>
                                                    <c:when test="${design.project.status == 2}">
                                                        <span class="badge badge-primary">In Progress</span>
                                                    </c:when>
                                                    <c:when test="${design.project.status == 3}">
                                                        <span class="badge badge-success">Completed</span>
                                                    </c:when>
                                                    <c:when test="${design.project.status == 4}">
                                                        <span class="badge badge-warning">Cancelled</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/manager/projects/details/${design.project.projectId}"
                                                    method="GET" class="d-inline">
                                                    <button type="submit" class="btn btn-info">
                                                        <i class="fas fa-eye icon-btn"></i> View Details
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <!-- Construction Projects Section -->
                    <c:if test="${not empty constructions}">
                        <div class="section-card">
                            <h4 class="section-header"><i class="fas fa-hard-hat"></i> Participate project
                            </h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Project ID</th>
                                        <th>Project Name</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="construction" items="${constructions}">
                                        <tr>
                                            <td>${construction.project.projectId}</td>
                                            <td>${construction.project.projectName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${construction.project.status == 1}">
                                                        <span class="badge badge-secondary">Pending</span>
                                                    </c:when>
                                                    <c:when test="${construction.project.status == 2}">
                                                        <span class="badge badge-primary">In Progress</span>
                                                    </c:when>
                                                    <c:when test="${construction.project.status == 3}">
                                                        <span class="badge badge-success">Completed</span>
                                                    </c:when>
                                                    <c:when test="${construction.project.status == 4}">
                                                        <span class="badge badge-warning">Cancelled</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/manager/projects/details/${construction.project.projectId}"
                                                    method="GET" class="d-inline">
                                                    <button type="submit" class="btn btn-info">
                                                        <i class="fas fa-eye icon-btn"></i> View Details
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <!-- Consultant Section -->
                    <c:if test="${not empty consultants}">
                        <div class="section-card">
                            <h4 class="section-header"><i class="fas fa-hard-hat"></i> Participate project
                            </h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Consultant ID</th>
                                        <th>Consultant Name</th>
                                        <th>Time</th>
                                        <th>Consultant Phone</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="consultant" items="${consultants}">
                                        <tr>
                                            <td>${consultant.consultantId}</td>
                                            <td>${consultant.consultantCustomerName}</td>
                                            <td>
                                                <fmt:formatDate
                                                    value="${consultant.consultantDateTime.time}"
                                                    pattern="yyyy-MM-dd HH:mm" />
                                            </td>
                                            <td>${consultant.consultantPhone}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${consultant.consultantStatus == 3}">
                                                        <span class="badge badge-primary">In Progress</span>
                                                    </c:when>
                                                    <c:when test="${consultant.consultantStatus == 4}">
                                                        <span class="badge badge-success">Completed</span>
                                                    </c:when>
                                                    <c:when test="${consultant.consultantStatus == 5}">
                                                        <span class="badge badge-warning">Cancelled</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <form action="#" method="GET" class="d-inline">
                                                    <button type="submit" class="btn btn-info">
                                                        <i class="fas fa-eye icon-btn"></i> View Details
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </main>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>