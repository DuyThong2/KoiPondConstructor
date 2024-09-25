<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Construction Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/designStyle.css'/>" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <div class="header-container d-flex justify-content-between align-items-center mt-3 mb-4">
                <a href="/manager/construction" class="btn btn-secondary">Back</a>
                <h1 class="text-center">Construction Detail</h1>
            </div>

            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Stage Id</th>
                        <th>Stage Name</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>View More Detail</th>
                        <th></th> <!-- Thêm cột cho nút View -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="stage" items="${list.ConstructionStage}">
                        <tr>                           
                            <td>${stage.constructionStageId}</td>
                            <td>${stage.constructionStageName}</td>
                            <td>${stage.constructionStagePrice}</td>
                            <td>${stage.constructionStageDetail}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${stage.constructionStageStatus == 1}">
                                        <span class="badge badge-success">Complete finishing phase: decoration, testing, inspection, etc.</span>
                                    </c:when>
                                    <c:when test="${stage.constructionStageStatus == 2}">
                                        <span class="badge badge-secondary">Complete raw construction phase: site preparation, excavation, liner install, etc.</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/manager/construction/detail/${stage.constructionStageId}" class="btn btn-info">Detail</a>
                            </td>
                        </c:forEach>
                </tbody>
            </table>

            <!-- Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </div>
    </body>
</html>
