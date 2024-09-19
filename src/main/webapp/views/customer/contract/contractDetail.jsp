<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .section-header {
                margin-bottom: 20px;
                border-bottom: 2px solid #007bff;
                padding-bottom: 5px;
            }
            .contract-section {
                margin-bottom: 40px;
            }
            .project-section, .term-section {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
            }
            .btn-custom {
                margin-top: 20px;
                padding: 10px 20px;
            }
            .status-badge {
                font-size: 1.2em;
                padding: 10px 15px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <!-- Contract Details Section (70%) -->
                <div class="col-md-8 contract-section">
                    <h2 class="section-header text-primary">Contract Details</h2>
                    <table class="table table-hover table-striped">
                        <tr>
                            <th>Contract ID</th>
                            <td>${contract.contractId}</td>
                        </tr>
                        <tr>
                            <th>Contract Document</th>
                            <td>
                                <form action="/download/${contract.fileURL}" method="get">
                                    <button type="submit" class="btn btn-primary">Download Contract</button>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <th>Date Created</th>
                            <td>${contract.dateCreate}</td>
                        </tr>
                        <tr>
                            <th>Contract Status</th>
                            <td>
                                <c:choose>
                                    <c:when test="${contract.contractStatus == 1}">
                                        <span class="badge badge-warning ">Pending</span>
                                    </c:when>
                                    <c:when test="${contract.contractStatus == 2}">
                                        <span class="badge badge-success ">Approved</span>
                                    </c:when>
                                    <c:when test="${contract.contractStatus == 3}">
                                        <span class="badge badge-danger ">Rejected</span>
                                    </c:when>
                                </c:choose>
                            </td>
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
                        <!-- Replaced file URL with a button -->
                        
                        <!-- Contract Status moved back into the table -->
                        
                    </table>

                    <!-- Approve/Reject buttons placed below the main table -->
                    <c:choose>
                        <c:when test="${contract.contractStatus == 1}">
                            <div class="">
                                <form action="/customer/contract/statusEdit" method="PUT" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}" >
                                    <button name="status" type="submit" value="2" class="btn btn-success">Approve</button>
                                </form>
                                <form action="/customer/contract/statusEdit" method="PUT" class="d-inline">
                                    <input type="hidden" name="id" value="${contract.contractId}" >
                                    <button name="status" type="submit" value="3" class="btn btn-danger">Reject</button>
                                </form>
                            </div>
                        </c:when>
                    </c:choose>
                </div>

                <!-- Term and Project Details Section (30%) -->
                <div class="col-md-4">
                    <!-- Associated Project Details -->
                    <div class="project-section mb-4">
                        <h4 class="section-header text-primary">Associated Project</h4>
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
                                    <th>Customer Name</th>
                                    <td>${contract.customer.username}</td>
                                </tr>
                                <tr>
                                    <th>Project Description</th>
                                    <td>${contract.project.description}</td>
                                </tr>
                            </table>
                        </c:if>
                        <c:if test="${empty contract.project}">
                            <p class="text-muted">No project is associated with this contract.</p>
                        </c:if>
                    </div>

                    <!-- Associated Term Details -->
                    <div class="term-section mb-4">
                        <h4 class="section-header text-primary">Associated Term</h4>
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
                            <p class="text-muted">No terms are associated with this contract.</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
