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
                    <h2 class="mb-4">Contract List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date Created</th>
                                <th>File URL</th>
                                <th>Total Price</th>
                                <th>Price on Concept Design</th>
                                <th>Price on Construction Design</th>
                                <th>Price on Detail Design</th>
                                <th>Price on Raw Construction</th>
                                <th>Price on Complete Construction</th>
                                <th>Contract Term</th>
                                <th>Contract Status</th>
                                <th>Contract Note</th>
                                <th>View Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="contract" items="${contracts}">
                                <tr>
                                    <td>${contract.dateCreate}</td>
                                    <td><a href="/download/${contract.fileURL}">${contract.fileURL}</a></td>
                                    <td>${contract.totalPrice}</td>
                                    <td>${contract.priceOnConceptDesign}</td>
                                    <td>${contract.priceOnConstructionDesign}</td>
                                    <td>${contract.priceOnDetailDesign}</td>
                                    <td>${contract.priceOnRawConstruction}</td>
                                    <td>${contract.priceOnCompleteConstruction}</td>
                                    <td>${contract.contractTerm}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${contract.contractStatus == 1}">
                                                <span class="badge badge-warning">Pending</span>
                                            </c:when>
                                            <c:when test="${contract.contractStatus == 2}">
                                                <span class="badge badge-success">Approved</span>
                                            </c:when>
                                            <c:when test="${contract.contractStatus == 3}">
                                                <span class="badge badge-danger">Rejected</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${contract.contractNote}</td>
                                    <td><a href="/manager/contract/viewDetail/${contract.contractId}" class="btn btn-info">Click Here</a></td>
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
