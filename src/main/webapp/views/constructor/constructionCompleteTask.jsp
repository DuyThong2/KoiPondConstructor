<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Construction Stage Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
        <style>
            h2 {
                margin-bottom: 20px;
                text-align: center;
                color: #343a40;
                font-weight: bold;
            }

            th,
            td {
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
                display: inline-block;
                /* Align select and button */
                width: auto;
                /* Adjust width */
                margin-right: 10px;
                /* Space between select and button */
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
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>
        <div class="container">
            <%@include file="navbarConstruction.jsp" %>
            <div class="container mt-5">
                <h2>Construction Stage Details</h2>

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
                        <c:set var="canUpdateNext" value="true" /> <!-- Initialize canUpdateNext to true -->

                        <c:forEach var="detail" items="${details}" varStatus="status">
                        <form action="${pageContext.request.contextPath}/constructionStageDetail/updateStatus"
                              method="post" onsubmit="return confirmStatusChange();">
                            <input type="hidden" name="constructionId" value="${constructionId}">
                            <input type="hidden" name="detailId" value="${detail.constructionStageDetailId}">
                            <input type="hidden" name="constructionStageId" value="${id}">
                            <tr>
                                <td>${detail.constructionStageDetailId}</td>
                                <td>${detail.constructionStageDetailName}</td>
                                <td>${detail.constructionStageDetailDescription}</td>

                                <td>
                                    <!-- Check if previous detail is completed (if it's not the first detail) -->
                                    <c:set var="previousCompleted" value="true" />
                                    <!-- Default to true if it's the first detail -->
                                    <c:if test="${!status.first}">
                                        <!-- Only check previous detail if not the first -->
                                        <c:if
                                            test="${details[status.index - 1].constructionStageDetailStatus != 4}">
                                            <c:set var="previousCompleted" value="false" />
                                            <!-- Previous detail is not completed -->
                                        </c:if>
                                    </c:if>

                                    <!-- Display status label if it's Payment, Inspection, or already completed/canceled, or if the previous detail is not completed -->
                                    <c:choose>
                                        <c:when
                                            test="${detail.constructionStageDetailName == 'Payment' || detail.constructionStageDetailStatus == 4  || !previousCompleted}">
                                            <span class="status-label">
                                                 <c:choose>
                                                    <c:when test="${detail.constructionStageDetailStatus == 1}">
                                                        Pending</c:when>
                                                    <c:when test="${detail.constructionStageDetailStatus == 2}">
                                                        Processing</c:when>
                                                    <c:when test="${detail.constructionStageDetailStatus == 4}">
                                                        Completed</c:when>
                                                </c:choose>
                                            </span>
                                        </c:when>

                                        <c:when
                                            test="${detail.constructionStageDetailName == 'Inspection' && previousCompleted && detail.constructionStageDetailStatus != 4}">
                                            <select class="form-control text-center" name="newStatus" required>
                                                <option value="2" ${detail.constructionStageDetailStatus==2
                                                                    ? 'selected' : '' }>Processing</option>
                                            </select>

                                        </c:when>


                                        <c:otherwise>
                                            <select class="form-control text-center" name="newStatus" required>
                                                
                                                <option value="2" ${detail.constructionStageDetailStatus==2
                                                                    ? 'selected' : '' }>Processing</option>
                                                <option value="4" ${detail.constructionStageDetailStatus==4
                                                                    ? 'selected' : '' }>Completed</option>
                                            </select>
                                        </c:otherwise>
                                    </c:choose>

                                </td>

                                <td>
                                    <!-- Disable the button if Payment, Inspection, or the previous detail is incomplete -->
                                    <c:if
                                        test="${canUpdateNext && detail.constructionStageDetailName != 'Payment' && previousCompleted && detail.constructionStageDetailStatus != 4}">
                                        <button type="submit" class="btn btn-primary mt-2">Update</button>
                                    </c:if>
                                </td>
                            </tr>

                           
                            <!-- Update canUpdateNext to false if this stage is not completed or canceled -->
                            <c:if
                                test="${detail.constructionStageDetailStatus != 4 && detail.constructionStageDetailStatus != 3}">
                                <c:set var="canUpdateNext" value="false" />
                                
                            </c:if>
                        </form>
                    </c:forEach>
                    </tbody>

                </table>

                <div class="text-center mt-3">
                    <a href="${pageContext.request.contextPath}/constructor/construction/${constructionId}"
                       class="btn btn-secondary">Back to Construction</a>
                </div>

                <!-- Popup -->
                <%@include file="../popup.jsp"%>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <c:if test="${not empty message}">
            <script>
                                  alert("${message}");
            </script>
        </c:if>
        <script>
            function confirmStatusChange() {
                return confirm("Are you sure you want to change the status?");
            }

        </script>

    </body>

</html>

