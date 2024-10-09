<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Blog Management</title>
        <link rel="stylesheet" href="/assets/css/vendor/bootstrap.min.css">
        <style>
            /* Custom Styling for better layout */
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }
            .card {
                min-height: 450px; /* Ensuring all cards have equal height */
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s ease-in-out;
            }
            .card:hover {
                transform: scale(1.02);
            }
            .card img {
                height: 200px;
                object-fit: cover;
                border-bottom: 2px solid #ddd;
            }
            .form-row {
                margin-bottom: 20px;
            }
            /* Align search form elements in one row */
            form.d-flex.flex-wrap {
                align-items: flex-end;
            }
            .form-group {
                margin-right: 15px;
            }
            /* Adjust button width and alignment */
            .btn.btn-success {
                width: 200px;
            }
            /* Adjust pagination for better responsiveness */
            .pagination {
                justify-content: center;
            }
            .navbar {
                background-color: #007bff;
                padding: 10px 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .navbar-brand {
                color: white;
                font-weight: bold;
            }
            .pagination .page-item .page-link {
                color: #007bff;
            }
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }
            .btn-info {
                background-color: #17a2b8;
                border-color: #17a2b8;
                color: white;
            }
            .btn-info:hover {
                background-color: #138496;
                border-color: #138496;
            }
            h1 {
                color: #343a40;
                margin-bottom: 30px;
                font-weight: bold;
                border-bottom: 3px solid #343a40;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <%@include file="../navBar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
                    <h1 class="my-4">Blog Management</h1>

                    <!-- Button to Create New Blog -->
                    <div class="mb-4">
                        <a href="/staff/blog/new" class="btn btn-success">Create New Blog</a>
                    </div>

                    <!-- Search and Filter Form -->
                    <form action="/staff/blogs" method="GET" class="d-flex flex-wrap align-items-center justify-content-start gap-3 mb-4">
                        <!-- Search by name -->
                        <div class="form-group mb-0">
                            <input type="text" name="name" class="form-control" placeholder="Search by name" value="${param.name}">
                        </div>

                        <!-- Status Dropdown -->
                        <div class="form-group mb-0">
                            <select name="status" class="form-control">
                                <option value="" ${status == null ? 'selected' : ''}>All Statuses</option>
                                <option value="1" ${status != null && status == 1 ? 'selected' : ''}>Active</option>
                                <option value="0" ${status != null && status == 0 ? 'selected' : ''}>Inactive</option>
                            </select>

                        </div>

                        <!-- Date From -->
                        <div class="form-group mb-0">
                            <input type="date" name="dateFrom" class="form-control" value="${param.dateFrom}">
                        </div>

                        <!-- Date To -->
                        <div class="form-group mb-0">
                            <input type="date" name="dateTo" class="form-control" value="${param.dateTo}">
                        </div>

                        <!-- Search Button -->
                        <div class="form-group mb-0">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>

                    <!-- Blog List -->
                    <div class="row">
                        <c:forEach var="blog" items="${blogs}">
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card h-100">
                                    <!-- Adjusted Image Height -->
                                    <img src="/uploads/${blog.imgUrl}" class="card-img-top" alt="Blog Image" style="height: 250px; object-fit: cover;">

                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title">${blog.name}</h5>

                                        <!-- Limit Description Text to 3 lines -->
                                        <p class="card-text text-truncate" style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                            ${blog.description}
                                        </p>

                                        <p class="card-text">
                                            <small class="text-muted">Posted on ${blog.datePost}</small>
                                        </p>

                                        <!-- Button aligned at the bottom -->
                                        <a href="/staff/blog/viewDetail/${blog.id}" class="btn btn-info mt-auto">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Pagination Controls -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage == 0}">
                                <li class="page-item disabled">
                                    <a class="page-link" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <!-- Page number indicator -->
                            <li class="page-item disabled">
                                <a class="page-link">Page ${currentPage + 1} of ${totalPages}</a>
                            </li>

                            <c:if test="${currentPage < totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}&sortBy=${sortBy}&sortDirection=${sortDirection}&statusFilter=${statusFilter}&searchName=${searchName}&fromDate=${fromDate}&toDate=${toDate}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${currentPage == totalPages - 1}">
                                <li class="page-item disabled">
                                    <a class="page-link" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </main>
            </div>
        </div>

        <!-- JS and Bootstrap scripts -->
        <script src="/assets/js/vendor/bootstrap.bundle.min.js"></script>

    </body>
</html>
