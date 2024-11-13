<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700|Poppins:300,400,600">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
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
            margin-bottom: 30px;
        }
        .text-right {
            margin: 30px 0 0 40px;
            justify-content: right;
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table th, .table td {
            vertical-align: middle;
            padding: 12px 15px;
        }
        .form-control {
            border-radius: 25px;
        }
        .btn-primary, .btn-success {
            border-radius: 25px;
            padding: 10px 20px;
        }
        .btn-info {
            border-radius: 25px;
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
<div style="height:9vh;"></div>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <h2 class="mb-4">Packet List</h2>
            <div class="filter-card">
                <form method="get" action="${pageContext.request.contextPath}/manager/parcel">
                    <div class="form-row align-items-center">
                        <!-- Sort By -->
                        <div class="col-auto">
                            <label for="sortBy">Sort by:</label>
                            <select name="sortBy" id="sortBy" class="form-control">
                                <option value="packageId" ${sortBy == 'packageId' ? 'selected' : ''}>Id</option>
                                <option value="constructionPriceOnSquareRoot" ${sortBy == 'constructionPriceOnSquareRoot' ? 'selected' : ''}>Construction Price Per Square</option>
                                <option value="designOnSquareRoot" ${sortBy == 'designOnSquareRoot' ? 'selected' : ''}>Design Price Per Square</option>
                            </select>
                        </div>

                        <!-- Sort Direction -->
                        <div class="col-auto">
                            <label for="sortDirection">Direction:</label>
                            <select name="sortDirection" id="sortDirection" class="form-control">
                                <option value="asc" ${sortDirection == 'asc' ? 'selected' : ''}>Ascending</option>
                                <option value="desc" ${sortDirection == 'desc' ? 'selected' : ''}>Descending</option>
                            </select>
                        </div>

                        <input type="hidden" name="page" value="${currentPage}">
                        <div class="col-auto" style="margin-top: 22px">
                            <button type="submit" class="btn btn-primary mt-2">Apply</button>
                        </div>
                        <div class="text-right">
                            <a href="${pageContext.request.contextPath}/manager/parcel/create" class="btn btn-success">
                                <i class="fas fa-plus"></i> Create New Package</a>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Main Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                    <tr>
                        <th>Package Id</th>
                        <th>Package Name</th>
                        <th>Construction Price Per Square</th>
                        <th>Design Price Per Square</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="parcel" items="${parcelList}">
                        <tr>
                            <td>${parcel.packageId}</td>
                            <td>${parcel.packageName}</td>
                            <td>${parcel.constructionPriceOnSquareRoot}</td>
                            <td>${parcel.designOnSquareRoot}</td>
                            <td>${parcel.packageDescription}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${parcel.package_status == true}">
                                        <span class="badge badge-success badge-status">Active</span>
                                    </c:when>
                                    <c:when test="${parcel.package_status == false}">
                                        <span class="badge badge-secondary badge-status">Inactive</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/manager/parcel/update/${parcel.packageId}" class="btn btn-info">Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination Controls -->
            <div class="d-flex justify-content-between align-items-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}" class="btn btn-primary">&lt;</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <button class="btn btn-primary" disabled>&lt;</button>
                </c:if>

                <!-- Page Indicator -->
                <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                <!-- Next Button -->
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}" class="btn btn-primary">&gt;</a>
                </c:if>
                <c:if test="${currentPage == totalPages - 1}">
                    <button class="btn btn-primary" disabled>&gt;</button>
                </c:if>
            </div>
            <div style="height:6vh;"></div>
        </main>

    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
