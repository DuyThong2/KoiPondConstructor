<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Design Stage Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            h2 {
                margin-bottom: 20px;
                text-align: center;
                color: #343a40;
                font-weight: bold;
            }

            th, td {
                padding: 15px;
                text-align: center;
                vertical-align: middle;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            td {
                font-size: 15px;
                background-color: #f9f9f9;
                transition: background-color 0.3s ease;
            }
            td:hover {
                background-color: #e9ecef;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
                transition: background-color 0.3s ease;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .form-control {
                display: inline-block; /* Align select and button */
                width: auto; /* Adjust width */
                margin-right: 10px; /* Space between select and button */
            }
            .action-buttons {
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .alert {
                margin: 20px 0;
                text-align: center;
            }
            .card {
                margin-top: 20px;
                border: none;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>
    <div class="container">
        <header>
            <div class="nav">
                <a href="/designer/manage" class="nav-link">
                    <i class="fas fa-project-diagram"></i> My Projects
                </a>

                <!-- Thông báo và cài đặt -->
                <div class="nav-item-group">
                    <!-- Notifications icon with badge -->
                    <a href="#" class="nav-link">
                        <i class="fas fa-bell"></i>
                        <span class="badge badge-danger">3</span> <!-- Số thông báo chưa đọc -->
                    </a>

                    <!-- Avatar và tên người dùng -->
                    <div class="dropdown">
                        <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="/uploads/${sessionScope.user.imgURL}" alt="User Avatar" class="rounded-circle" width="40">
                            <span class="ml-2 user-name">${sessionScope.user.name}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/designer/profile">Profile</a>
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

        <div class="container mt-5">

            <h2>Design Stage Details</h2>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="previousComplete" value="true" />
                    <c:forEach var="detail" items="${details}">
                    <form action="${pageContext.request.contextPath}/designStageDetail/updateStatus" method="post" onsubmit="return confirmStatusChange();">
                        <tr>
                            <td>${detail.id}</td>
                            <td>${detail.name}</td>
                            <td>${detail.description}</td>
                            <td>
                                <!-- Logic to show select only if previous stage is complete and not completed or canceled -->
                                <c:choose>
                                    <c:when test="${previousComplete && detail.status != 4 && detail.status != 3}">
                                        <select class="form-control text-center" name="newStatus" required>
                                            <!-- Restricting Editing and Payment to Processing only -->
                                            <c:if test="${detail.name == 'Payment' || detail.name == 'Editing'}">
                                                <option value="2" ${detail.status == 2 ? 'selected' : ''}>Processing</option>
                                            </c:if>
                                            <c:if test="${detail.name != 'Payment' && detail.name != 'Editing'}">
                                                <!-- Exclude Pending if already in Processing state -->
                                                <c:choose>
                                                    <c:when test="${detail.status == 2}">
                                                        <option value="2" ${detail.status == 2 ? 'selected' : ''}>Processing</option>
                                                        <option value="4" ${detail.status == 4 ? 'selected' : ''}>Completed</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1" ${detail.status == 1 ? 'selected' : ''}>Pending</option>
                                                        <option value="2" ${detail.status == 2 ? 'selected' : ''}>Processing</option>
                                                        <option value="4" ${detail.status == 4 ? 'selected' : ''}>Completed</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </select>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Show current status as text if select is disabled -->
                                        <span>
                                            <c:choose>
                                                <c:when test="${detail.status == 1}">Pending</c:when>
                                                <c:when test="${detail.status == 2}">Processing</c:when>
                                                <c:when test="${detail.status == 3}">Canceled</c:when>
                                                <c:when test="${detail.status == 4}">Completed</c:when>
                                            </c:choose>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <input type="hidden" name="designId" value="${designId}">
                                <input type="hidden" name="detailId" value="${detail.id}">
                                <input type="hidden" name="designStageId" value="${designStageId}">
                                <!-- Only show the update button if the select is enabled -->
                                <c:if test="${previousComplete && detail.status != 4 && detail.status != 3}">
                                    <button type="submit" class="btn btn-primary mt-2">Update</button>
                                </c:if>
                            </td>
                        </tr>
                    </form>

                    <!-- Update the previousComplete flag based on current status -->
                    <c:choose>
                        <c:when test="${detail.status == 3 || detail.status == 4}">
                            <c:set var="previousComplete" value="true" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="previousComplete" value="false" />
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${not empty message}">
                <script>
                    alert("${message}");
                </script>
            </c:if>

            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/designer/design/${designId}" class="btn btn-secondary">Back to Design</a>
            </div>
        </div>
    </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
            function confirmStatusChange() {
                return confirm("Are you sure you want to change the status?");
            }
        </script>

    </body>

</html>
