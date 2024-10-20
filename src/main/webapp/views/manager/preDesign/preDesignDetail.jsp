<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pre Design Detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .blog-header {
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #212529;
        }
        .blog-card {
            margin-top: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .blog-image {
            max-height: 400px;
            object-fit: cover;
            width: 100%;
        }
        .blog-content {
            padding: 20px;
            background-color: #fff;
        }
        .blog-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .blog-description {
            font-size: 1.1rem;
            margin-bottom: 20px;
        }
        .blog-status {
            margin-top: 15px;
        }
        .blog-status span {
            font-weight: bold;
        }
        .blog-footer {
            margin-top: 30px;
            text-align: center;
        }
        .blog-footer a {
            padding: 10px 30px;
            font-size: 1.1rem;
        }
        .author-section {
            margin-top: 40px;
            padding: 15px;
            background-color: #f1f1f1;
            border-radius: 8px;
            display: flex;
            align-items: center;
        }
        .author-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-right: 20px;
            object-fit: cover;
        }
        .author-name {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .author-email {
            font-size: 1rem;
            color: #6c757d;
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>

<!-- Pre Design Detail Container -->
<div class="container mt-5">
    <div class="row">
        <%@include file="../navBar.jsp" %>

        <!-- Main content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <!-- Pre Design Header -->
            <div class="blog-header">
                <h1>Pre Design Detail</h1>
            </div>

            <!-- Pre Design Card -->
            <div class="card blog-card">
                <!-- Pre Design Image -->
                <img src="${preDesign.getShowingImg(preDesign.preDesignImgUrl)}" class="blog-image" alt="Blog Image">

                <!-- Pre Design Content -->
                <div class="card-body blog-content">

                    <!-- Pre Design Title -->
                    <h2 class="blog-title">${preDesign.preDesignName}</h2>

                    <!-- Pre Design Date and Status -->
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="text-muted">Posted on: ${preDesign.content.createDate}</p>
                        <div class="blog-status">
                            Status:
                            <c:choose>
                                <c:when test="${preDesign.preDesignStatus == true}">
                                    <span class="badge bg-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Inactive</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <!-- Pre Design Description -->
                    <p class="blog-description">
                        ${preDesign.preDesignDescription}
                    </p>

                    <!-- Pre Design Content Section -->
                    <h4>Full Content</h4>
                    <div class="blog-body">
                        <p>${preDesign.content.content}</p>
                    </div>

                </div>
            </div>
        </main>
        <!-- Footer Section with Back Button -->
        <div class="blog-footer">
            <a href="${pageContext.request.contextPath}/manager/preDesign" class="btn btn-outline-secondary">Back to Pre Design List</a>
            <a href="${pageContext.request.contextPath}/manager/preDesign/update/${preDesign.preDesignId}" class="btn btn-outline-info">Update</a>
        </div>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

