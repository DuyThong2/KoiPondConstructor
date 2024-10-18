<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Designer Manage</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    </head>

    <body>

        <div class="container">
            <%@include file="navbarDesign.jsp" %>


            <div class="table-responsive">
                <table class="table table-bordered table-striped text-center">
                    <thead>
                        <tr>
                            <th>Design Id</th>
                            <th>Project Name</th>
                            <th>Customer</th>
                            <th>Design Status</th>
                            <th class="action-column">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="designs" items="${designs}">
                            <tr>
                                <td>${designs.designId}</td>
                                <td>${designs.project.projectName}</td>
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
                                <td>
                                    <a href="${pageContext.request.contextPath}/designer/manage/viewDetail/${designs.designId}" class="btn btn-info">Detail</a>
                                    <c:if test="${designs.status != 4}">
                                        <a href="${pageContext.request.contextPath}/designer/design/${designs.designId}" class="btn btn-secondary">To Design</a>
                                    </c:if>
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
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>

</html>
