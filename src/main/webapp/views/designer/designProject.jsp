
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project and Customer Information</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .info-section {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .info-box {
                width: 68%;
                background-color: #fff;
                padding: 23px;
                margin: 5px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .info-box-small {
                width: 30%;
                background-color: #ffffff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .info-item p, .info-item textarea {
                background-color: #f0f0f0;
                padding: 12px;
                border-radius: 5px;
                margin-bottom: 15px;
                font-size: 1rem;
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
                font-weight: bold;
                padding: 10px 20px;
                width: 100%;
                border-radius: 5px;
            }

            h4 {
                font-size: 1.5rem;
                color: #343a40;
                margin-bottom: 20px;
            }

            .btn {
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn-primary {
                background-color: #6c63ff;
                border-color: #6c63ff;
            }

            .btn-primary:hover {
                background-color: #5753e8;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>

        <div class="container">
            <!-- Header -->
            <header>
                <div class="nav">
                    <a href="/designer/manage" class="nav-link">My Projects</a>
                    <a href="/logout" class="btn btn-logout">Logout</a>
                </div>
            </header>

            <!-- Info Sections -->
            <div class="info-section">
                <!-- Customer Information -->
                <div class="info-box info-box-small">
                    <h4>Customer Information</h4>
                    <div class="info-item">
                        <p><strong>Name:</strong> ${customer.name}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Phone Number:</strong> ${customer.phone}</p>
                    </div>
                    <div class="info-item mb-4">
                        <p><strong>Email:</strong> ${customer.email}</p>
                    </div>

                </div>

                <!-- Project Information -->
                <div class="info-box">
                    <h4>Project Information</h4>
                    <div class="info-item">
                        <p><strong>Project Name:</strong> ${project.projectName}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Address:</strong> ${project.address}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Design Aesthetic:</strong> ${project.style}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Area (m²):</strong> ${quote.quotesArea}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Description:</strong> ${project.description}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>Start Date:</strong> ${project.dateStart}</p>
                    </div>
                    <div class="info-item">
                        <p><strong>End Date:</strong>
                            <c:choose>
                                <c:when test="${empty project.dateEnd}">Not yet</c:when>
                                <c:otherwise>${project.dateEnd}</c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <div class="info-item">
                        <p><strong>Project Status:</strong>
                            <c:choose>
                                <c:when test="${project.status == 1}">Pending</c:when>
                                <c:when test="${project.status == 2}">Processing</c:when>
                                <c:when test="${project.status == 3}">Completed</c:when>
                                <c:when test="${project.status == 4}">Canceled</c:when>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
    <%@include file="../footer.jsp"%>

</html>
