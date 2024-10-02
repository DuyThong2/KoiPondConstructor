<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Blog Management</title>
    <link rel="stylesheet" href="/assets/css/vendor/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1 class="my-4">Blog Management</h1>

    <!-- Button to Create New Blog -->
    <div class="mb-4">
        <a href="/blogs/create" class="btn btn-success">Create New Blog</a>
    </div>

    <!-- Search and Filter Form -->
    <form action="/blogs/manage" method="GET" class="mb-4">
        <div class="form-row">
            <div class="col-md-4">
                <input type="text" name="name" class="form-control" placeholder="Search by name" value="${param.name}">
            </div>
            <div class="col-md-2">
                <select name="status" class="form-control">
                    <option value="">All Statuses</option>
                    <option value="1" ${param.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${param.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            <div class="col-md-2">
                <input type="date" name="dateFrom" class="form-control" value="${param.dateFrom}">
            </div>
            <div class="col-md-2">
                <input type="date" name="dateTo" class="form-control" value="${param.dateTo}">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary btn-block">Search</button>
            </div>
        </div>
    </form>

    <!-- Blog List -->
    <div class="row">
        <c:forEach var="blog" items="${blogs}">
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="${blog.imgUrl}" class="card-img-top" alt="Blog Image">
                    <div class="card-body">
                        <h5 class="card-title">${blog.name}</h5>
                        <p class="card-text">${blog.description}</p>
                        <p class="card-text"><small class="text-muted">Posted on ${blog.datePost}</small></p>
                        
                        <!-- View Details Button -->
                        <a href="/blogs/view/${blog.id}" class="btn btn-info">View Details</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination Controls -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}&name=${param.name}&status=${param.status}&dateFrom=${param.dateFrom}&dateTo=${param.dateTo}">
                        ${i}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>

</body>
</html>
