<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Design Project Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                padding-top: 80px;
            }

            .container {
                max-width: 95%;
                margin: 20px auto;
                padding: 0;
                flex: 1;
            }

            .nav {
                margin-bottom: 10px;
                padding: 20px;
                background-color: #343a40;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 10px;
                position: fixed;
                top: 0;
                width: 95%;
                z-index: 1000;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .nav a {
                color: #ffffff;
                margin-right: 15px;
                text-decoration: none;
                font-weight: bold;
            }

            .nav a:hover {
                text-decoration: underline;
            }

            .nav .btn-logout {
                background-color: #dc3545;
                color: white;
                padding: 8px 15px;
                border-radius: 5px;
                border: none;
                font-size: 16px;
                font-weight: bold;
            }

            .nav .btn-logout:hover {
                background-color: #c82333;
            }

            .row {
                display: flex;
                justify-content: space-between;
            }

            .left-column {
                width: 33%;
                margin: 15px;
                padding: 20px;
                background-color: #fff;
            }

            .right-column {
                width: 62%;
                padding: 20px;
                margin: 15px;
                background-color: #fff;
            }

            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin-bottom: 20px;
            }

            .card-body h4 {
                font-size: 1.5rem;
                margin-bottom: 15px;
            }

            .card-body p {
                font-size: 1rem;
                margin-bottom: 10px;
            }

            .stage-tabs {
                display: flex;
                justify-content: center;
                margin-bottom: 20px;
            }

            .stage-tabs button {
                margin-right: 10px;
            }

            .img-box {
                height: 300px;
                width: 100%;
                background-color: #e9ecef;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.2rem;
                color: #6c757d;
                margin-bottom: 20px;
            }

            .notes-box {
                background-color: #f0f0f0;
                padding: 15px;
                height: 200px;
                border-radius: 5px;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container mt-5">
            <!-- Navigation -->
            <header>
                <div class="nav">
                    <a href="/designer/manage" class="nav-link">My Projects</a>
                    <a href="/logout" class="btn btn-logout">Logout</a>
                </div>
            </header>
            <div class="row">
                <!-- Left Column -->
                <div class="left-column">
                    <div class="img-box">
                        <img src="/uploads/${project.imgURL}" alt="Project Image">
                    </div>
                    <!-- Notes Section -->
                    <div class="notes-box">
                        <h4>Notes</h4>
                        <p>Add your notes here...</p>
                    </div>
                </div>
                <!-- Right Column -->
                <div class="right-column">
                    <h2 class="card-title mb-3 text-center">Project Information</h2>
                    <br>
                    <!-- Stage Selection Buttons -->
                    <div class="stage-tabs" id="stage-buttons">
                        <button class="btn btn-outline-primary" data-stage="Conceptual Design" data-status="0">Conceptual Design</button>
                        <button class="btn btn-outline-primary" data-stage="Detail Design" data-status="0">Detail Design</button>
                        <button class="btn btn-outline-primary" data-stage="Construction Design" data-status="0">Construction Design</button>
                    </div>

                    <!-- Display the Design Stages -->
                    <c:forEach var="stage" items="${designStages}">
                        <div class="card mb-3">
                            <div class="card-body">
                                <!-- Add Link to Blueprint Management Page -->
                                <h4><a href="${pageContext.request.contextPath}/designer/manage/blueprint/${stage.designStageId}">${stage.designStageName}</a></h4>
                                <p>
                                    <c:choose>
                                        <c:when test="${stage.designStageStatus == 1}">
                                            <span class="badge badge-secondary badge-status">Pending</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 2}">
                                            <span class="badge badge-primary badge-status">Processing</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 3}">
                                            <span class="badge badge-secondary badge-status">Canceled</span>
                                        </c:when>
                                        <c:when test="${stage.designStageStatus == 4}">
                                            <span class="badge badge-success badge-status">Accepted</span>
                                        </c:when>
                                    </c:choose>
                                </p>
                                <p><strong>Price:</strong> ${stage.designStagePrice}</p>
                                <c:if test="${stage.designStageStatus == 4}">
                                    <p><strong>Summary File:</strong> <a href="/download/${stage.summaryFile}">Download</a></p>
                                </c:if>
                                <a href="/designer/updateStatus/designStage/${stage.designStageId}?designId=${designId}" class="btn btn-info">Update Status</a>

                            </div>
                        </div>

                        <!-- Pass the stage status to the buttons via data attributes -->
                        <script>
                            document.querySelector(`[data-stage='${stage.designStageName}']`).setAttribute('data-status', '${stage.designStageStatus}');
                        </script>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- JavaScript to dynamically change button color based on stage status -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Loop over the buttons
                document.querySelectorAll('#stage-buttons button').forEach(function (button) {
                    const stageStatus = button.getAttribute('data-status');

                    // If stage status is 4, change the button color to success
                    if (stageStatus == 4) {
                        button.classList.remove('btn-outline-primary');
                        button.classList.add('btn-success');
                    }
                });
            });
        </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
    <%@include file="../footer.jsp"%>

</html>
