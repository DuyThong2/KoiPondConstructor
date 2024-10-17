<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Construction Manage</title>
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        </head>

        <body>

            <div class="container">
                <header>
                    <div class="nav">
                        <div class="d-flex flex-row">
                            <a href="${pageContext.request.contextPath}/constructor/manage" class="nav-link">
                                <i class="fas fa-project-diagram"></i>Projects
                            </a>
                            <a href="${pageContext.request.contextPath}/constructor/serviceDetailManage/"
                                class="nav-link">
                                <i class="fas fa-project-diagram"></i>Service Details
                            </a>
                        </div>
                        <input type="text" placeholder="Search..." id="search">

                        <div class="nav-item-group">

                            <a href="#" class="nav-link">
                                <i class="fas fa-bell"></i>
                                <span class="badge badge-danger">3</span>
                            </a>

                            <div class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="userDropdown"
                                    role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "
                                        /assets/imgs/logo/final_resized_colored_logo_image.png"}" alt="User Avatar"
                                        class="rounded-circle" width="40">
                                    <span class="ml-2 user-name">${sessionScope.user.name}</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="/constructor/profile">Profile</a>
                                    <a class="dropdown-item" href="#" data-toggle="modal"
                                        data-target="#themeModal">Theme</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="/help">Help</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="/logout" class="dropdown-item btn-logout">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>

                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center">
                        <thead>
                            <tr>
                                <th>Construction Id</th>
                                <th>Construction Name</th>
                                <th>Project Name</th>
                                <th>Customer</th>
                                <th>Status</th>
                                <th class="action-column" style="width: 250px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="construction" items="${constructions}">
                                <tr>
                                    <td>${construction.constructionId}</td>
                                    <td>${construction.constructionName}</td>
                                    <td>${construction.project.projectName}</td>
                                    <td>${construction.project.contract.customer.name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${construction.constructionStatus == 1}">
                                                <span class="badge badge-secondary">Pending</span>
                                            </c:when>
                                            <c:when test="${construction.constructionStatus == 2}">
                                                <span class="badge badge-primary">Processing</span>
                                            </c:when>
                                            <c:when test="${construction.constructionStatus == 3}">
                                                <span class="badge badge-success">Completed</span>
                                            </c:when>
                                            <c:when test="${construction.constructionStatus == 4}">
                                                <span class="badge badge-warning">Canceled</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/constructor/manage/viewDetail/${construction.constructionId}"
                                            class="btn btn-info">Detail</a>
                                        <a href="/constructor/construction/${construction.constructionId}"
                                            class="btn btn-secondary">Manage Stages</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Pagination Controls -->
            <div class="pagination-controls d-flex justify-content-center mt-4">
                <!-- Previous Button -->
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}" class="btn btn-primary">&lt</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <button class="btn btn-primary" disabled>&lt;</button>
                </c:if>

                <!-- Page Indicator -->
                <span class="mx-3">Page <strong>${currentPage + 1}</strong> of <strong>${totalPages}</strong></span>

                <!-- Next Button -->
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}" class="btn btn-primary">&gt;</a>
                </c:if>
                <c:if test="${currentPage == totalPages - 1}">
                    <button class="btn btn-primary" disabled>&gt;</button>
                </c:if>
            </div>

            <script>
                // JavaScript for handling search
                document.getElementById('search').addEventListener('input', function () {
                    // Handle search functionality
                });
            </script>
            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        </body>

        </html>