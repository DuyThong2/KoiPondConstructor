<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Blog Management</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap.min.css">
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
            <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
            <style>
                /* Custom Styling for better layout */
                body {
                    background-color: #f8f9fa;
                    font-family: 'Arial', sans-serif;
                }

                .card {
                    min-height: 450px;
                    /* Ensuring all cards have equal height */
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

                .btn.btn-success {
                    font-size: 17px;
                    padding: 10px;

                }

                .btn.btn-primary {
                    font-size: 17px;
                    padding: 10px;
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

                /* Card Container for Form */
                .filter-card {
                    background-color: #ffffff;
                    padding: 30px 0 10px 10px;
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    margin-bottom: 30px;
                }

                .form-control {
                    border-radius: 10px;
                    padding: 10px;
                    font-size: 19px;
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

                .btn-success {
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
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-end;
                    /* Align the form elements to the bottom */
                    flex-wrap: wrap;
                    /* Allow wrapping for smaller screens */
                    gap: 15px;
                    /* Adjust gap between form elements */
                }

                .filter-card .form-control,
                .filter-card select,
                .filter-card .btn-primary {
                    flex: 1 1 150px;
                    /* Allows the fields to scale and ensures consistency in size */
                    margin-bottom: 10px;
                    /* Adds spacing between the form elements */
                }

                .filter-card label {
                    margin-bottom: 5px;
                    /* Space between labels and inputs */
                    display: inline-block;
                }
            </style>
        </head>

        <body>
            <div class="container-fluid">
                <div class="row">
                    <%@include file="../navBar.jsp" %>

                        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-5">
                            <h2 class="my-4">Blog Management</h2>


                            <!-- Search and Filter Form -->
                            <div class="filter-card">
                                <form action="${pageContext.request.contextPath}/staff/blogs" method="GET"
                                    class="d-flex flex-wrap align-items-center justify-content-start gap-3 mb-4">
                                    <!-- Search by name -->
                                    <div class="form-group mb-0">
                                        <input type="text" name="name" class="form-control" placeholder="Search by name"
                                            value="${param.name}">
                                    </div>

                                    <!-- Status Dropdown -->
                                    <div class="form-group mb-0">
                                        <select name="status" class="form-control">
                                            <option value="" ${status==null ? 'selected' : '' }>All Statuses</option>
                                            <option value="1" ${status !=null && status==1 ? 'selected' : '' }>Active
                                            </option>
                                            <option value="0" ${status !=null && status==0 ? 'selected' : '' }>Inactive
                                            </option>
                                        </select>

                                    </div>

                                    <!-- Date From -->
                                    <div class="form-group mb-0">
                                        <input type="date" name="dateFrom" class="form-control"
                                            value="${param.dateFrom}">
                                    </div>

                                    <!-- Date To -->
                                    <div class="form-group mb-0">
                                        <input type="date" name="dateTo" class="form-control" value="${param.dateTo}">
                                    </div>

                                    <!-- Search Button -->
                                    <div class="form-group mb-0">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-search"></i> Search</button>
                                    </div>
                                    <!-- Button to Create New Blog -->
                                    <div class="form-group " style="margin-bottom:0.8rem;">
                                        <a href="${pageContext.request.contextPath}/staff/blog/new"
                                            class="btn btn-success">
                                            <i class="fas fa-plus"></i> Create Blog</a>
                                    </div>

                                </form>
                            </div>
                            <!-- Blog List -->
                            <div class="row">
                                <c:forEach var="blog" items="${blogs}">
                                    <div class="col-md-6 col-lg-4 mb-4">
                                        <div class="card h-100">
                                            <!-- Adjusted Image Height -->
                                            <img src="${blog.getShowingImg(blog.imgUrl)}" class="card-img-top"
                                                alt="Blog Image" style="height: 250px; object-fit: cover;">

                                            <div class="card-body d-flex flex-column">
                                                <h5 class="card-title">${blog.name}</h5>

                                                <!-- Limit Description Text to 3 lines -->
                                                <p class="card-text text-truncate"
                                                    style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
                                                    ${blog.description}
                                                </p>

                                                <p class="card-text">
                                                    <small class="text-muted">Posted on ${blog.datePost}</small>
                                                </p>

                                                <!-- Button aligned at the bottom -->
                                                <a href="${pageContext.request.contextPath}/staff/blog/viewDetail/${blog.id}"
                                                    class="btn btn-info mt-auto">Detail</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Pagination Controls -->
                            <div class="pagination-controls">
                                <!-- Previous Button -->
                                <c:if test="${currentPage > 0}">
                                    <a href="?page=${currentPage - 1}&size=${pageSize}&name=${param.name}&status=${status}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}" class="btn btn-primary">&lt;</a>
                                </c:if>
                                <c:if test="${currentPage == 0}">
                                    <button class="btn btn-primary" disabled> &lt; </button>
                                </c:if>

                                <!-- Page Indicator -->
                                <span>Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                                <!-- Next Button -->
                                <c:if test="${currentPage < totalPages - 1}">
                                    <a href="?page=${currentPage + 1}&size=${pageSize}&name=${param.name}&status=${status}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}" class="btn btn-primary">&gt;</a>
                                </c:if>
                                <c:if test="${currentPage == totalPages - 1}">
                                    <button class="btn btn-primary" disabled> &gt; </button>
                                </c:if>
                            </div>
                        </main>
                </div>
            </div>

            <div style="height:15vh"></div>

            <!-- JS and Bootstrap scripts -->
            <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.bundle.min.js"></script>
            <!-- jQuery, Bootstrap JS, and Chart.js -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


        </body>

        </html>