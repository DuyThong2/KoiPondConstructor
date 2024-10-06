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
    <%@include file="../homePageNavbar.jsp"%>

    <body>

        <div class="container">
            <header>
                <div class="nav">
                    <a href="/designer/manage" class="nav-link">
                        <i class="fas fa-project-diagram"></i> My Projects
                    </a>
                    <!-- Search box -->
                    <input type="text" placeholder="Search..." id="search">

                    <!-- Notifications icon with badge -->
                    <div class="nav-item-group">
                        <a href="#" class="nav-link">
                            <i class="fas fa-bell"></i>
                            <span class="badge badge-danger">3</span> <!-- Số thông báo chưa đọc -->
                        </a>

                        <!-- Dropdown menu for Settings -->
                        <div class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cogs"></i> Settings
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/profile">Profile</a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#themeModal">Theme</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/help">Help</a>
                                <div class="dropdown-divider"></div>
                                <!-- Logout button in dropdown -->
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
                            <th>Project Id</th>
                            <th>Project Name</th>
                            <th>Customer</th>
                            <th>Status</th>
                            <th class="action-column">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="designs" items="${designs}">
                            <tr>
                                <td>${designs.project.projectId}</td>
                                <td>${designs.project.projectName}</td>
                                <td>${designs.project.contract.customer.name}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${designs.project.status == 1}">
                                            <span class="badge badge-secondary">Pending</span>
                                        </c:when>
                                        <c:when test="${designs.project.status == 2}">
                                            <span class="badge badge-primary">Processing</span>
                                        </c:when>
                                        <c:when test="${designs.project.status == 3}">
                                            <span class="badge badge-success">Completed</span>
                                        </c:when>
                                        <c:when test="${designs.project.status == 4}">
                                            <span class="badge badge-warning">Canceled</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="/designer/manage/viewDetail/${designs.designId}" class="btn btn-info">Detail</a>
                                    <a href="/designer/design/${designs.designId}" class="btn btn-secondary">To Design</a>
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

        <!-- script for change theme -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Gán sự kiện cho các nút chọn theme
                var lightThemeBtn = document.getElementById('lightTheme');
                var darkThemeBtn = document.getElementById('darkTheme');

                if (lightThemeBtn) {
                    lightThemeBtn.addEventListener('click', function () {
                        document.body.classList.remove('dark-mode');
                        localStorage.setItem('theme', 'light'); // Lưu lựa chọn vào localStorage
                        $('#themeModal').modal('hide');
                    });
                }

                if (darkThemeBtn) {
                    darkThemeBtn.addEventListener('click', function () {
                        document.body.classList.add('dark-mode');
                        localStorage.setItem('theme', 'dark'); // Lưu lựa chọn vào localStorage
                        $('#themeModal').modal('hide');
                    });
                }

                // Kiểm tra và áp dụng theme từ LocalStorage khi load trang
                var savedTheme = localStorage.getItem('theme');
                if (savedTheme === 'dark') {
                    document.body.classList.add('dark-mode');
                } else if (savedTheme === 'light') {
                    document.body.classList.remove('dark-mode');
                }
            });

        </script>


        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- Modal for Theme Selection -->
        <div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-labelledby="themeModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="themeModalLabel">Choose Theme</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <button id="lightTheme" class="btn btn-light btn-block">Light Theme</button>
                        <button id="darkTheme" class="btn btn-dark btn-block">Dark Theme</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <%@include file="../footer.jsp"%>

</html>
