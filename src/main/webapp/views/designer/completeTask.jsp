<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Design Stage Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f0f2f5;
                padding-top: 80px; /* Space for fixed navbar */
            }
            .container {
                max-width: 90%;
                margin: auto;
                padding: 20px;
                background: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            }
            h2 {
                margin-bottom: 20px;
                text-align: center;
                color: #343a40;
                font-weight: bold;
            }
            table {
                margin-top: 20px;
                background-color: #ffffff;
                border-radius: 10px;
                overflow: hidden; /* For rounded corners */
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
                    <c:forEach var="detail" items="${details}">
                    <form action="${pageContext.request.contextPath}/designStageDetail/updateStatus" method="post" onsubmit="return confirmStatusChange();">
                        <tr>
                            <td>${detail.id}</td>
                            <td>${detail.name}</td>
                            <td>${detail.description}</td>
                            <td>
                                <select class="form-control text-center" name="newStatus" 
                                        <c:choose>
                                            <c:when test="${detail.status == 3 || detail.status == 4}">
                                                disabled
                                            </c:when>
                                            <c:otherwise>
                                                required
                                            </c:otherwise>
                                        </c:choose>>
                                    <c:if test="${detail.status != 2}">
                                        <option value="1" ${detail.status == 1 ? 'selected' : ''}>Pending</option>
                                    </c:if>
                                    <option value="2" ${detail.status == 2 ? 'selected' : ''}>Processing</option>
                                    <option value="3" ${detail.status == 3 ? 'selected' : ''}>Cancel</option>
                                    <option value="4" ${detail.status == 4 ? 'selected' : ''}>Completed</option>
                                </select>
                            </td>
                            <td>
                                <input type="hidden" name="designId" value="${designId}">
                                <input type="hidden" name="detailId" value="${detail.id}">
                                <input type="hidden" name="designStageId" value="${id}">
                                <c:if test="${detail.status != 3 && detail.status != 4}">
                                    <button type="submit" class="btn btn-primary mt-2">Update</button>
                                </c:if>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${not empty success}">
                <div class="alert alert-success mt-3" style="font-size: large">
                    ${success}
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">
                    ${error}
                </div>
            </c:if>
            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/designer/design/${designId}" class="btn btn-secondary">Back to Design</a>
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



