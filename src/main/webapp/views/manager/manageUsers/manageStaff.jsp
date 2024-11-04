<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <style>
        h2 {
            font-weight: bold;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .filter-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .btn-block{
            margin-bottom: 8px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-primary, .btn-success {
            border-radius: 8px;
            padding: 8px 20px;
        }
        .btn-info {
            border-radius: 8px;
        }
        .badge-success {
            background-color: #28a745;
        }
        .badge-warning {
            background-color: #ffc107;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
        .modal-footer {
            justify-content: flex-end;
        }
        .pagination {
            justify-content: center;
        }
        .form-control {
            border-radius: 25px;
        }
        .password-wrapper {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            top: 68%;
            right: 10px;
            transform: translateY(-20%);
            cursor: pointer;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
            .form-row .col-md-2, .form-row .col-md-1 {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
            <h2 class="mb-4">Manage Staffs</h2>
            <div class="filter-card">
                <!-- Search Form -->
                <form action="${pageContext.request.contextPath}/manager/manageStaff" method="GET" class="form-row align-items-center">
                    <!-- Search by name -->
                    <div class="col-md-2 mb-3">
                        <input type="text" name="name" class="form-control" placeholder="Search by Name..." value="${param.name}">
                    </div>
                    <!-- Search by email -->
                    <div class="col-md-2 mb-3">
                        <input type="text" name="searchEmail" class="form-control" placeholder="Search by Email..." value="${param.searchEmail}">
                    </div>
                    <!-- Search by department -->
                    <div class="col-md-2 mb-3">
                        <select name="department" class="form-control">
                            <option value="">All Departments</option>
                            <option value="Construction" ${param.department == "Construction" ? 'selected' : ''}>Construction</option>
                            <option value="Consulting" ${param.department == "Consulting" ? 'selected' : ''}>Consultant</option>
                            <option value="Design" ${param.department == "Design" ? 'selected' : ''}>Designer</option>
                            <option value="Management" ${param.department == "Management" ? 'selected' : ''}>Manager</option>
                        </select>
                    </div>
                    <!-- Status Dropdown -->
                    <div class="col-md-2 mb-3">
                        <select name="status" class="form-control">
                            <option value="">All Statuses</option>
                            <option value="true" ${param.status == "true" ? 'selected' : ''}>Active</option>
                            <option value="false" ${param.status == "false" ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                    <!-- Search Button -->
                    <div class="col-md-2 mb-3 mt-2">
                        <button type="submit" class="btn btn-primary btn-block">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </div>
                    <!-- Button to open modal -->
                    <div class="col-md-2 mb-3 mt-2">
                        <button type="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#addStaffModal">
                            <i class="fas fa-plus"></i> Add New Staff
                        </button>
                    </div>
                </form>
            </div>

            <!-- Table to display staff members -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th style="width: 165px"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="staffs" items="${staffs}">
                        <tr>
                            <td>${staffs.id}</td>
                            <td>${staffs.name}</td>
                            <td>${staffs.email}</td>
                            <td>${staffs.department}</td>
                            <td>${staffs.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${staffs.enabled}">
                                        <span class="badge badge-success">Active</span>
                                    </c:when>
                                    <c:when test="${!staffs.enabled}">
                                        <span class="badge badge-warning">Inactive</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${staffs.department != 'Management'}">
                                    <a href="${pageContext.request.contextPath}/manager/manageStaff/detail/${staffs.id}" class="btn btn-info btn-block">
                                        <i class="fas fa-eye"></i> View Details</a>
                                    <form action="${pageContext.request.contextPath}/manager/manageUser/block/${staffs.id}" method="post" style="display: inline">
                                        <c:if test="${staffs.enabled}">
                                            <button type="submit" class="btn btn-outline-danger btn-block"
                                                    onclick="return confirm('Are you sure you want to block this user?');">
                                                <i class="fas fa-ban"></i> Block
                                            </button>
                                        </c:if>
                                        <c:if test="${!staffs.enabled}">
                                            <button type="submit" class="btn btn-outline-success btn-block"
                                                    onclick="return confirm('Are you sure you want to unblock this user?');">
                                                <i class="fas fa-ban"></i> Unblock
                                            </button>
                                        </c:if>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination controls -->
            <div class="d-flex justify-content-between align-items-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}" class="btn btn-primary">&lt;</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <button class="btn btn-primary" disabled>&lt;</button>
                </c:if>
                <!-- Page Indicator -->
                <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>
                <!-- Next Button -->
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}" class="btn btn-primary">&gt;</a>
                </c:if>
                <c:if test="${currentPage == totalPages - 1}">
                    <button class="btn btn-primary" disabled>&gt;</button>
                </c:if>
            </div>
            <br>
        </main>
    </div>
</div>

<!-- Modal for adding new staff -->
<div class="modal fade" id="addStaffModal" tabindex="-1" role="dialog" aria-labelledby="addStaffModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addStaffModalLabel">Add New Staff</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addStaffForm" action="${pageContext.request.contextPath}/manager/manageStaff/add" method="POST" onsubmit="return validateEmail() && validatePasswords()">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="email" name="email" placeholder="Enter user" required>
                            <div class="input-group-append">
                                <span class="input-group-text">@gmail.com</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>
                    <div class="form-group password-wrapper">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('password')"></i>
                    </div>
                    <div class="form-group password-wrapper">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('confirmPassword')"></i>
                    </div>
                    <div class="form-group">
                        <label for="department">Department</label>
                        <select class="form-control" id="department" name="department">
                            <option value="Construction">Construction</option>
                            <option value="Consulting">Consultant</option>
                            <option value="Design">Designer</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-check"></i> Add Staff
                        </button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            <i class="fas fa-times"></i> Close
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript for password validation and toggle -->
<script>
    function validateEmail() {
        var email = document.getElementById("email").value;

        if (email.includes('@')) {
            alert("Email should not contain the '@' character. Please remove it.");
            return false;
        }
        return true;
    }
    function validatePasswords() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("Passwords do not match. Please try again.");
            return false;
        }
        return true;
    }

    function togglePassword(fieldId) {
        var field = document.getElementById(fieldId);
        var icon = field.nextElementSibling;

        if (field.type === "password") {
            field.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            field.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    }

</script>

<!-- Display email duplicate error if exists -->
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>c:if>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
