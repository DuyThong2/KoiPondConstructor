<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Pre Design Detail</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
        <style>
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
            .blog-footer {
                margin-top: 30px;
                text-align: center;
            }
            .blog-footer a, .blog-footer button {
                display: inline-block;
                margin-right: 10px;
            }
            .btn{
                padding: 10px 20px;
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

        <!-- Pre Design Detail Container -->
        <div class="container">

            <%@include file="navbarDesign.jsp" %>

            <!-- Main content -->

            <!-- Pre Design Header -->
            <h1 class="my-4">Design Template</h1>
          
            <!-- Pre Design Card -->
            <div class="card blog-card">
                <!-- Pre Design Image -->
                <img src="${preDesign.getShowingImg(preDesign.preDesignImgUrl)}" class="blog-image" alt="Blog Image">

                <!-- Pre Design Content -->
                <div class="card-body blog-content text-center">

                    <!-- Pre Design Title -->
                    <h2 class="blog-title">${preDesign.preDesignName}</h2>
                    <!-- Pre Design Date and Status -->

                    <br>
                    <!-- Pre Design Content Section -->
                    <div class="blog-body">
                        <p>${preDesign.content.content}</p>
                    </div>

                </div>
            </div>



            <!-- Footer Section with Back Button -->

        </div>


        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

