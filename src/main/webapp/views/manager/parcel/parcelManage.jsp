<%-- 
    Document   : parcelManage
    Created on : Sep 30, 2024, 9:58:13 PM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Custom styles for the sidebar */
            .sidebar {
                height: 100vh;
                background-color: #343a40;
                color: white;
            }
            .sidebar a {
                color: white;
                display: block;
                padding: 10px;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #495057;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav class="col-md-2 d-none d-md-block sidebar">
                    <div class="sidebar-sticky">
                        <h4 class="text-center py-3">Admin Dashboard</h4>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/contracts">Contracts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/projects">Projects</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/terms">Terms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/reports">Reports</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/admin/settings">Settings</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h2 class="mb-4">Packet List</h2>
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
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary mt-2">Apply</button>
                            </div>
                        </div>
                    </form>

                    <!-- Main Table -->
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

                    <div class="text-right mt-2">
                        <a href="${pageContext.request.contextPath}/manager/parcel/create" class="btn btn-success">Create New Package</a>
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
                </main>

            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>
