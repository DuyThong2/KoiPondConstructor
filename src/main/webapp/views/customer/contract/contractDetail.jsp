<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Contract Details</h2>

    <table class="table table-bordered">
        <tr>
            <th>Contract ID</th>
            <td>${contract.contractId}</td>
        </tr>
        <tr>
            <th>Date Created</th>
            <td>${contract.dateCreate}</td>
        </tr>
        <tr>
            <th>File URL</th>
            <td><a href="/download/${contract.fileURL}">contract download</a></td>
        </tr>
        <tr>
            <th>Total Price</th>
            <td>${contract.totalPrice}</td>
        </tr>
        <tr>
            <th>Price on Concept Design</th>
            <td>${contract.priceOnConceptDesign}</td>
        </tr>
        <tr>
            <th>Price on Construction Design</th>
            <td>${contract.priceOnConstructionDesign}</td>
        </tr>
        <tr>
            <th>Price on Detail Design</th>
            <td>${contract.priceOnDetailDesign}</td>
        </tr>
        <tr>
            <th>Price on Raw Construction</th>
            <td>${contract.priceOnRawConstruction}</td>
        </tr>
        <tr>
            <th>Price on Complete Construction</th>
            <td>${contract.priceOnCompleteConstruction}</td>
        </tr>
        <tr>
            <th>Contract Term</th>
            <td>${contract.contractTerm}</td>
        </tr>
        <tr>
            <th>Contract Status</th>
            <td>
                <c:choose>
                    <c:when test="${contract.contractStatus == 1}">
                        <span class="badge badge-warning">Pending</span>
                    </c:when>
                    <c:when test="${contract.contractStatus == 2}">
                        <span class="badge badge-success">Approved</span>
                    </c:when>
                    <c:when test="${contract.contractStatus == 3}">
                        <span class="badge badge-danger">Rejected</span>
                    </c:when>
                </c:choose>
            </td>
        </tr>
        <tr>
            <th>Contract Note</th>
            <td>${contract.contractNote}</td>
        </tr>
    </table>

    <!-- Buttons for Edit or Cancel when the status is Rejected (status == 3) -->
    <c:choose>
        <c:when test="${contract.contractStatus == 3}">
            <div class="mt-4">
                <a href="/contract/edit/${contract.contractId}" class="btn btn-primary">Edit</a>
                <a href="/contract/cancel/${contract.contractId}" class="btn btn-danger">Cancel</a>
            </div>
        </c:when>
        <c:otherwise>
            <!-- If not rejected, show the current status with no buttons -->
            <p>Status: 
                <c:choose>
                    <c:when test="${contract.contractStatus == 1}">
                        <span class="badge badge-warning">Pending</span>
                    </c:when>
                    <c:when test="${contract.contractStatus == 2}">
                        <span class="badge badge-success">Approved</span>
                    </c:when>
                    <c:when test="${contract.contractStatus == 3}">
                        <span class="badge badge-danger">Rejected</span>
                    </c:when>
                </c:choose>
            </p>
        </c:otherwise>
    </c:choose>

    <h3 class="mt-5">Associated Project Details</h3>
    <c:if test="${not empty contract.project}">
        <table class="table table-bordered">
            <tr>
                <th>Project ID</th>
                <td>${contract.project.projectId}</td>
            </tr>
            <tr>
                <th>Project Name</th>
                <td>${contract.project.projectName}</td>
            </tr>
            <tr>
                <th>Project Description</th>
                <td>${contract.project.description}</td>
            </tr>
        </table>
    </c:if>
    <c:if test="${empty contract.project}">
        <p>No project is associated with this contract.</p>
    </c:if>

    <h3 class="mt-5">Associated Term Details</h3>
    <c:if test="${not empty contract.term}">
        <table class="table table-bordered">
            <tr>
                <th>Term ID</th>
                <td>${contract.term.termId}</td>
            </tr>
            <tr>
                <th>Term Description</th>
                <td>${contract.term.description}</td>
            </tr>
        </table>
    </c:if>
    <c:if test="${empty contract.term}">
        <p>No terms are associated with this contract.</p>
    </c:if>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
