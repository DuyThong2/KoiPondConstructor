<%-- 
    Document   : preDesignManage
    Created on : Oct 7, 2024, 10:51:29 PM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contract Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Custom styles to enhance UI performance */
        body {
            background-color: #f8f9fa;
            font-family: 'Mukta', sans-serif;
        }

        h2 {
            font-weight: bold;
            color: #007bff;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        /* Table styling */
        table.table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Table Header Styling */
        thead.thead-dark th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        /* Pagination Controls */
        .pagination-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .pagination-controls a,
        .pagination-controls button {
            font-weight: bold;
        }

        /* Button Styles */
        .btn-info {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
            padding: 8px 12px;
            transition: all 0.3s ease;
        }

        .btn-info:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /* Badge styles */
        .badge-status {
            padding: 10px 15px;
            font-size: 1em;
            border-radius: 20px;
        }

        /* Filter Form Styling */
        .form-control {
            border-radius: 20px;
            padding: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border-radius: 20px;
            padding: 8px 20px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .form-row {
            margin-bottom: 20px;
        }

        /* Card Container for Form */
        .filter-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Include the Navbar -->
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
            <h2 class="mb-4">Pre Design List</h2>

            <!-- Filter Card -->
            <div class="filter-card">
                <!-- Sort and Search Form -->
                <form method="get" action="${pageContext.request.contextPath}/manager/preDesign">
                    <div class="form-row align-items-center d-flex">
                        <!-- Sort By -->
                        <div class="col-auto">
                            <label for="sortBy">Sort by:</label>
                            <select name="sortBy" id="sortBy" class="form-control">
                                <option value="preDesignId" ${sortBy == 'preDesignId' ? 'selected' : ''}>Default</option>
                                <option value="preDesignStatus" ${sortBy == 'preDesignStatus' ? 'selected' : ''}>Status</option>
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

                        <!-- Filter By Status -->
                        <div class="col-auto">
                            <label for="statusFilter">Status:</label>
                            <select name="statusFilter" id="statusFilter" class="form-control">
                                <option value="" ${statusFilter == null ? 'selected' : ''}>All</option>
                                <option value="true" ${statusFilter == true ? 'selected' : ''}>Active</option>
                                <option value="false" ${statusFilter == false ? 'selected' : ''}>Inactive</option>
                            </select>
                        </div>

                        <!-- Search by Name -->
                        <div class="col-auto">
                            <label for="searchName">Search Name: </label>
                            <input type="text" name="searchName" id="searchName" class="form-control" value="${searchName}">
                        </div>

                        <input type="hidden" name="page" value="${currentPage}">

                        <!-- Apply Button -->
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary" style="margin-top: 2rem">Apply</button>
                            <a class="btn btn-info" href="${pageContext.request.contextPath}/manager/preDesign/create" style="margin: 2rem 0 0 2rem">Create New Pre Design</a>
                        </div>
                    </div>
                </form>

            </div>

            <!-- Pre Design Cards -->
            <div class="row">
                <c:forEach var="preDesign" items="${preDesign}">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="card h-100">
                            <!-- Adjusted Image Height -->
                            <img src="${preDesign.getShowingImg(preDesign.preDesignImgUrl)}" class="card-img-top" alt="Pre Design Image" style="height: 250px; object-fit: cover;">

                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${preDesign.preDesignName}</h5>

                                <!-- Limit Description Text to 3 lines -->
                                <p class="card-text text-truncate" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                        ${preDesign.preDesignDescription}
                                </p>

                                <!-- Button aligned at the bottom -->
                                <a href="${pageContext.request.contextPath}/manager/preDesign/detail/${preDesign.preDesignId}" class="btn btn-info mt-auto">View Details</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination Controls -->
            <div class="d-flex justify-content-between align-items-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-primary">&lt;</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <button class="btn btn-primary" disabled>&lt;</button>
                </c:if>

                <!-- Page Indicator -->
                <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                <!-- Next Button -->
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" class="btn btn-primary">&gt;</a>
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

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
