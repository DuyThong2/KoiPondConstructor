<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
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
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
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
                            <c:forEach var="designs" items="${designList}">
                                <tr>
                                    <td>${designs.designId}</td>
                                    <td>${designs.designName}</td>
                                    <td>${designs.project.contract.customer.name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${designs.status == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${designs.status == 2}">
                                                <span class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${designs.status == 3}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                            <c:when test="${designs.status == 4}">
                                                <span class="badge badge-warning">Canceled</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td><a href="/manager/design/viewDetail/${designs.designId}" class="btn btn-info">View Details</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

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
                </main>
            </div>
        </div>
        <br>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
