<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
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
                                <a class="nav-link" href="/admin/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/contracts">Contracts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/design">Design</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/projects">Projects</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/terms">Terms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/reports">Reports</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/settings">Settings</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h2 class="mb-4">Design List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Design Id</th>
                                <th>Design Name</th>
                                <th>Customer Name</th>
                                <th>Status</th>
                                <th>View Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="designList" items="${designList}">
                                <tr>
                                    <%--  
                                    <td><a href="/download/${contract.fileURL}">${contract.fileURL}</a></td>
                                    --%>
                                    <td>${designList[0].designId}</td>
                                    <td>${designList[0].designName}</td>
                                    <td>${designList[1].name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${designList[0].status == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${designList[0].status == 2}">
                                                <span class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${designList[0].status == 3}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                            <c:when test="${designList[0].status == 4}">
                                                <span class="badge badge-warning">Canceled</span>
                                            </c:when>
                                        </c:choose>
                                    </td>

                                    <td><a href="/manager/design/viewDetail/${designList[0].designId}" class="btn btn-info">Click Here</a></td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage > 1}">
                            <a href="?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
                        </c:if>
                        <c:if test="${currentPage == 1}">
                            <button class="btn btn-primary" disabled>Previous</button>
                        </c:if>

                        <!-- Page Indicator (Format: <1/99>) -->
                        <span>Page <strong>${currentPage}</strong> of <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages}">
                            <a href="?page=${currentPage + 1}" class="btn btn-primary">Next</a>
                        </c:if>
                        <c:if test="${currentPage == totalPages}">
                            <button class="btn btn-primary" disabled>Next</button>
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