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
        <style>
            .filter-card {
                background-color: #ffffff; /* Màu nền trắng */
                padding: 20px 30px; /* Thêm khoảng cách cho nội dung */
                border-radius: 15px; /* Bo tròn các góc */
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng nhẹ */
                margin-bottom: 30px; /* Thêm khoảng cách phía dưới */
                transition: transform 0.3s ease, box-shadow 0.3s ease; /* Hiệu ứng khi hover */
            }

            .filter-card:hover {
                transform: translateY(-5px); /* Di chuyển lên nhẹ khi hover */
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15); /* Tăng độ đổ bóng khi hover */
            }

            .filter-card label {
                font-weight: bold;
                color: #343a40; /* Màu chữ cho tiêu đề */
                font-size: 16px; /* Tăng kích thước chữ */
            }

            .filter-card .form-control {
                border-radius: 10px; /* Bo tròn góc của các input */
                border: 1px solid #ced4da; /* Màu viền nhạt */
                padding: 10px;
                font-size: 18px;
                transition: box-shadow 0.3s ease; /* Hiệu ứng khi input được focus */
            }

            .filter-card .form-control:focus {
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.5); /* Hiệu ứng đổ bóng khi focus */
                border-color: #007bff; /* Màu viền khi focus */
            }

            .filter-card button {
                background-color: #007bff; /* Màu nền cho nút */
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 10px; /* Bo tròn góc của nút */
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s ease; /* Hiệu ứng khi hover */
            }

            .filter-card button:hover {
                background-color: #0056b3; /* Màu nền khi hover */
                color: #ffffff; /* Màu chữ khi hover */
            }

        </style>
    </head>

    <body>

        <div class="container">
            <%@include file="navbarDesign.jsp" %>

            <div class="filter-card">
                <form method="get" action="${pageContext.request.contextPath}/designer/manage">
                    <div class="form-row align-items-center">
                        <!-- Search by Design Name -->
                        <div class="col-auto">
                            <label for="searchName">Search by Design Name:</label>
                            <input type="text" name="searchName" id="searchName" value="${searchName}" class="form-control" placeholder="Enter design name">
                        </div>

                        <!-- Filter by Status -->
                        <div class="col-auto">
                            <label for="statusFilter">Filter by Status:</label>
                            <select name="statusFilter" id="statusFilter" class="form-control">
                                <option value="" ${statusFilter == null ? 'selected' : ''}>All Status</option>
                                <option value="1" ${statusFilter == 1 ? 'selected' : ''}>Pending</option>
                                <option value="2" ${statusFilter == 2 ? 'selected' : ''}>Processing</option>
                                <option value="3" ${statusFilter == 3 ? 'selected' : ''}>Completed</option>
                                <option value="4" ${statusFilter == 4 ? 'selected' : ''}>Canceled</option>
                            </select>
                        </div>

                        <input type="hidden" name="page" value="${currentPage}">
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary btn-sort" style="margin-top: 28px; padding: 10px 18px">Search & Filter</button>
                        </div>
                    </div>
                </form>
            </div>

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
