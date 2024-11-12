<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quote Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #e9ecef;
                font-family: 'Mukta', sans-serif;
            }
            .section-header {
                margin-bottom: 20px;
                border-bottom: 2px solid #007bff;
                padding-bottom: 5px;
            }
            .quotes-section, .customer-section {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 20px;
            }
            .status-badge {
                font-size: 1.2em;
                padding: 10px 15px;
            }
        </style>
    </head>
    <div style="height:6vh;"></div>
    <body>
        <div class="container-fluid mt-5">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-2">
                    <div class="row">
                        <!-- Quotes Details Section (70%) -->
                        <div class="col-md-8">
                            <div class="quotes-section">
                                <h2 class="section-header text-primary">Quotes Details</h2>
                                <table class="table table-hover table-striped">
                                    <tr>
                                        <th>Quotes ID</th>
                                        <td>${quotes.quotesId}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Name</th>
                                        <td>${quotes.quotesName}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Content</th>
                                        <td>${quotes.quotesContent}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Status</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${quotes.quotesStatus == 1}">
                                                    <span class="badge badge-warning badge-status">Pending</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 2}">
                                                    <span class="badge badge-success badge-status">Approved</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 3}">
                                                    <span class="badge badge-warning badge-status">Rejected By Manager</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 4}">
                                                    <span class="badge badge-success badge-status">Accepted By Customer</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 5}">
                                                    <span class="badge badge-warning badge-status">Refused By Customer</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 6}">
                                                    <span class="badge badge-warning badge-status">Refuse By Staff</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 7}">
                                                    <span class="badge badge-danger badge-status">cancel</span>
                                                </c:when>
                                                <c:when test="${quotes.quotesStatus == 8}">
                                                    <span class="badge badge-success badge-status">Contract Created</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Create Date</th>
                                        <td>${quotes.quotesDate}</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Area In m&sup2</th>
                                        <td>${quotes.quotesArea} m&sup2</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Total Cost</th>
                                        <td>${quotes.quotesTotalPrice}$</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Design Cost</th>
                                        <td>${quotes.quotesDesignCost}$</td>
                                    </tr>
                                    <tr>
                                        <th>Quotes Construction Cost</th>
                                        <td>${quotes.quotesConstructionCost}$</td>
                                    </tr>
                                    <tr>
                                        <th>Deposit On Contract</th>
                                        <td>${quotes.depositOnContract}$</td>
                                    </tr>
                                </table>

                                <!-- Nút Approve/Reject -->
                                <c:choose>
                                    <c:when test="${quotes.quotesStatus == 1}">
                                        <div class="">
                                            <c:if test="${quotes.consultant != null}">
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/consultant/detail/${quotes.consultant.consultantId}">
                                                    View Consultant Detail
                                                </a>
                                            </c:if>
                                            <form action="${pageContext.request.contextPath}/manager/quote/detail/updateStatus" method="post" class="d-inline">
                                                <input type="hidden" name="quoteId" value="${quotes.quotesId}">
                                                <input type="hidden" name="statusId" value="2">
                                                <button type="submit" class="btn btn-success">Approved</button>
                                            </form>

                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#declineModal"
                                                    onclick="document.getElementById('declineForm').quoteId.value = '${quotes.quotesId}';
                                                            document.getElementById('declineForm').toUserId.value = '${quotes.staff.id}';
                                                            document.getElementById('declineForm').statusId.value = '3';">Rejected
                                            </button>
                                        </div>
                                    </c:when>
                                    <c:when test="${quotes.quotesStatus == 3}">
                                        <div class="">
                                            <div class="alert alert-danger" role="alert">
                                                <strong>Rejection Reason: </strong> ${feedback.feedbackContent}
                                            </div>
                                            <c:if test="${quotes.consultant != null}">
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/consultant/detail/${quotes.consultant.consultantId}">
                                                    View Consultant Detail
                                                </a>
                                            </c:if>
                                        </div>
                                    </c:when>
                                    <c:when test="${quotes.quotesStatus == 5}">
                                        <div class="">
                                            <div class="alert alert-danger" role="alert">
                                                <strong>Rejection Reason: </strong> ${feedback.feedbackContent}
                                            </div>
                                            <c:if test="${quotes.consultant != null}">
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/consultant/detail/${quotes.consultant.consultantId}">
                                                    View Consultant Detail
                                                </a>
                                            </c:if>
                                        </div>
                                    </c:when>
                                    <c:when test="${quotes.quotesStatus == 6}">
                                        <div class="">
                                            <div class="alert alert-danger" role="alert">
                                                <strong>Rejection Reason: </strong> ${feedback.feedbackContent}
                                            </div>
                                            <c:if test="${quotes.consultant != null}">
                                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/consultant/detail/${quotes.consultant.consultantId}">
                                                    View Consultant Detail
                                                </a>
                                            </c:if>
                                            <!--Nút Cancel báo giá-->
                                            <form action="${pageContext.request.contextPath}/manager/quote/detail/updateStatus" method="post" class="d-inline">
                                                <input type="hidden" name="quoteId" value="${quotes.quotesId}">
                                                <input type="hidden" name="statusId" value="7">
                                                <button type="submit" class="btn btn-danger">Cancel</button>
                                            </form>
                                            <!--Nút Tiếp tục báo giá-->
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#declineModal"
                                                    onclick="document.getElementById('declineForm').quoteId.value = '${quotes.quotesId}';
                                                            document.getElementById('declineForm').toUserId.value = '${quotes.staff.id}';
                                                            document.getElementById('declineForm').statusId.value = '3';">Continue Customer Request
                                            </button>
                                        </div>
                                    </c:when>
                                    <c:when test="${quotes.quotesStatus == 8}">
                                        <c:if test="${quotes.consultant != null}">
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/consultant/detail/${quotes.consultant.consultantId}">
                                                View Consultant Detail
                                            </a>
                                        </c:if>
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/contract/detail/${quotes.contract.contractId}">
                                            View Contract Detail
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${quotes.consultant != null}">
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/consultant/detail/${quotes.consultant.consultantId}">
                                                View Consultant Detail
                                            </a>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Associated Customer Section (30%) -->
                        <div class="col-md-4">
                            <!-- Associated Contract Section -->
                            <div class="customer-section">
                                <h4 class="section-header text-primary">Associated Contract</h4>
                                <c:if test="${not empty quotes.contract}">
                                    <table class="table table-hover">
                                        <tr>
                                            <th>Contract Id</th>
                                            <td>${quotes.contract.contractId}</td>
                                        </tr>
                                        <tr>
                                            <th>Contract Create Date</th>
                                            <td>${quotes.contract.dateCreate}</td>
                                        </tr>
                                    </table>
                                </c:if>
                                <c:if test="${empty quotes.contract}">
                                    <p>No Contract are associated with this Consultant.</p>
                                </c:if>
                            </div>

                            <div class="customer-section">
                                <h4 class="section-header text-primary">Associated Customer</h4>
                                <table class="table table-hover">
                                    <tr>
                                        <th>Customer Name</th>
                                        <td>${quotes.customer.name}</td>
                                    </tr>
                                    <tr>
                                        <th>Customer Phone</th>
                                        <td>${quotes.customer.phone}</td>
                                    </tr>
                                    <tr>
                                        <th>Customer Email</th>
                                        <td>${quotes.customer.email}</td>
                                    </tr>
                                    <tr>
                                        <th>Point</th>
                                        <td>${totalPoint}</td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Associated Package Section -->
                            <div class="customer-section">
                                <h4 class="section-header text-primary">Associated Package</h4>
                                <table class="table table-hover">
                                    <tr>
                                        <th>Package Name</th>
                                        <td>${quotes.parcel.packageName}</td>
                                    </tr>
                                    <tr>
                                        <th>Description</th>
                                        <td>${quotes.parcel.packageDescription}</td>
                                    </tr>
                                    <tr>
                                        <th>Design Cost Per Square</th>
                                        <td>${quotes.parcel.designOnSquareRoot}</td>
                                    </tr>
                                    <tr>
                                        <th>Construction Cost Per Square</th>
                                        <td>${quotes.parcel.constructionPriceOnSquareRoot}</td>
                                    </tr>
                                </table>
                            </div>


                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- Decline Modal -->
        <div class="modal fade" id="declineModal" tabindex="-1" role="dialog" aria-labelledby="declineModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="declineModalLabel">Reason for Declining</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="declineForm" action="${pageContext.request.contextPath}/manager/quote/detail/updateStatusAndFeedback" method="POST">
                            <input type="hidden" name="quoteId" value="">
                            <input type="hidden" name="statusId" value="">
                            <input type="hidden" name="toUserId" value="">
                            <div class="form-group">
                                <label for="declineReason">Please provide a reason for declining this quote:</label>
                                <textarea class="form-control" id="declineReason" name="declineReason" rows="4" required></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" form="declineForm" class="btn btn-danger">Submit Reason & Decline</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
