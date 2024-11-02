<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f7f9fc;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* General Layout */
            .container {
                max-width: 1200px;
                margin: auto;
                padding: 20px;
            }

            .section-header {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #007bff;
                font-weight: bold;
                color: #007bff;
            }

            /* Cards for sections */
            .section-card {
                background-color: #fff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
                transition: transform 0.3s ease;
            }

            .section-card:hover {
                transform: translateY(-5px);
            }

            .btn-custom {
                margin-top: 20px;
                padding: 12px 25px;
                font-size: 1rem;
                border-radius: 5px;
                width: 100%;
            }

            .status-badge {
                font-size: 1rem;
                padding: 8px 15px;
                text-transform: uppercase;
                border-radius: 12px;
            }

            .table th, .table td {
                vertical-align: middle;
                padding: 15px;
            }

            .table th {
                background-color: #f0f0f0;
                font-weight: bold;
            }

            .icon-btn {
                margin-right: 8px;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .table {
                    font-size: 0.9rem;
                }

                .btn-custom {
                    font-size: 0.9rem;
                }
            }

            .action-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
            }

            .section-header i {
                margin-right: 8px;
            }
        </style>
    </head>
    <div style="height:6vh;"></div>
    <body>
        <div class="container-fluid mt-5">
            <div class="row">
                <!-- Include Navbar -->
                <%@include file="../navBar.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <!-- Contract Details Section -->
                    <div class="section-card">
                        <h2 class="section-header"><i class="fas fa-file-contract"></i> Contract Details</h2>
                        <table class="table table-striped">
                            <tr>
                                <th>Contract ID</th>
                                <td>${contract.contractId}</td>
                            </tr>
                            <tr>
                                <th>Contract Document</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty contract.fileURL}">
                                            <form action="${pageContext.request.contextPath}/download/${contract.fileURL}" method="get">
                                                <button type="submit" class="btn btn-outline-primary">
                                                    <i class="fas fa-download"></i> Download Contract
                                                </button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit" class="btn btn-outline-danger">
                                                <i class="fas fa-download"></i> File not available
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>Date Created</th>
                                <td>${contract.dateCreate}</td>
                            </tr>
                            <tr>
                                <th>Estimated End Date</th>
                                <td>${contract.estimatedEndDate}</td>
                            </tr>
                            <tr>
                                <th>Contract Status</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${contract.contractStatus == 1}">
                                            <span class="badge badge-warning status-badge">Pending</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 2}">
                                            <span class="badge badge-success status-badge">Wait for customer</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 3}">
                                            <span class="badge badge-danger status-badge">Rejected (Customer)</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 4}">
                                            <span class="badge badge-danger status-badge">Rejected (Manager)</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 5}">
                                            <span class="badge badge-secondary status-badge">Canceled</span>
                                        </c:when>
                                        <c:when test="${contract.contractStatus == 6}">
                                            <span class="badge badge-success status-badge">Accepted</span>
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
                        </table>
                        <div class="action-buttons">
                            <c:choose>
                                <c:when test="${contract.contractStatus == 1}">
                                    <form action="${pageContext.request.contextPath}/manager/contract/editStatus" method="POST" class="d-inline">
                                        <input type="hidden" name="id" value="${contract.contractId}">
                                        <input type="hidden" name="status" value="2">
                                        <button type="submit" class="btn btn-success"><i class="fas fa-check icon-btn"></i> Approve</button>
                                    </form>
                                    <!--                            <form action="/manager/contract/editStatus" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="$/{contract.quote.staff.id}">
                                    <input type="hidden" name="status" value="4">
                                    <button type="submit" class="btn btn-warning"><i class="fas fa-times icon-btn"></i> Reject</button>
                                    </form>-->
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#declineModal"
                                            onclick="document.getElementById('declineForm').id.value = '${contract.contractId}';
                                                    document.getElementById('declineForm').toUserId.value = '${contract.quote.staff.id}';
                                                    document.getElementById('declineForm').status.value = '4';"><i class="fas fa-times icon-btn"></i>
                                        Reject
                                    </button>
                                    <form action="${pageContext.request.contextPath}/manager/contract/editStatus" method="POST" class="d-inline">
                                        <input type="hidden" name="id" value="${contract.contractId}">
                                        <input type="hidden" name="status" value="5">
                                        <button type="submit" class="btn btn-danger"><i class="fas fa-ban icon-btn"></i> Cancel</button>
                                    </form>
                                </c:when>

                                <c:when test="${contract.contractStatus == 3}">
                                    <div class="mt-4 text-center">
                                        <div class="alert alert-danger text-center" role="alert">
                                            <strong>Rejection Reason: </strong> ${feedback.feedbackContent}
                                        </div>
                                        <p>Status: <span class="badge badge-danger">Refused by Customer</span></p>
                                        <form action="${pageContext.request.contextPath}/manager/contract/edit" method="GET" class="d-inline">
                                            <input type="hidden" name="id" value="${contract.contractId}">
                                            <button type="submit" class="btn btn-primary">Edit</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/manager/contract/editStatus" method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="${contract.contractId}">
                                            <input type="hidden" name="status" value="5">
                                            <button type="submit" class="btn btn-danger">Cancel</button>
                                        </form>
                                    </div>
                                </c:when>

                                <c:when test="${contract.contractStatus == 4}">
                                    <div class="text-center">
                                        <div class="alert alert-danger text-center" role="alert">
                                            <strong>Rejection Reason: </strong> ${feedback.feedbackContent}
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${contract.contractStatus == 6 && empty contract.project}">
                                    <div class="mt-4 text-center">
                                        <p>Status: <span class="badge badge-success">Accepted by Customer</span></p>
                                        <form action="${pageContext.request.contextPath}/manager/project/create" method="GET" class="d-inline">
                                            <input type="hidden" name="id" value="${contract.contractId}">
                                            <button type="submit" class="btn btn-primary"><i class="fas fa-plus icon-btn"></i> Create Project</button>
                                        </form>
                                    </div>

                                </c:when>
                                <c:when test="${not empty contract.project}">
                                    <div class="mt-4 text-center">
                                        <p>Status: <span class="badge badge-success">Accepted by Customer</span></p>
                                        <form action="${pageContext.request.contextPath}/manager/projects/detail/${contract.contractId}" method="GET" class="d-inline">
                                            <button type="submit" class="btn btn-success">VIEW PROJECT</button>
                                        </form>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-file-alt"></i> Associated Term</h4>
                                <c:if test="${not empty contract.term}">
                                    <c:choose>
                                        <c:when test="${contract.term.followContract}">
                                            <p>This contract follows the predefined terms, with payments scheduled exactly as per the contract’s phases.</p>
                                            <table class="table table-hover">
                                                <tr>
                                                    <th>Term ID</th>
                                                    <td>${contract.term.termId}</td>
                                                </tr>
                                                <tr>
                                                    <th>Term Description</th>
                                                    <td>${contract.term.description}</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment Timing for Design</th>
                                                    <td>
                                                        <c:if test="${contract.term.payOnStartOfDesign}">
                                                            Pay at the start of the design stage.
                                                        </c:if>
                                                        <c:if test="${!contract.term.payOnStartOfDesign}">
                                                            Payment follows normal design stage completion.
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Payment Timing for Construction</th>
                                                    <td>
                                                        <c:if test="${contract.term.payOnStartOfConstruction}">
                                                            Pay at the start of the construction stage.
                                                        </c:if>
                                                        <c:if test="${!contract.term.payOnStartOfConstruction}">
                                                            Payment follows normal construction stage completion.
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </table>
                                        </c:when>

                                        <c:otherwise>
                                            <table class="table table-hover">
                                                <tr>
                                                    <th>Term ID</th>
                                                    <td>${contract.term.termId}</td>
                                                </tr>
                                                <tr>
                                                    <th>Term Description</th>
                                                    <td>${contract.term.description}</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment on Concept Design</th>
                                                    <td>${contract.term.percentOnDesign1}%</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment on Detailed Design</th>
                                                    <td>${contract.term.percentOnDesign2}%</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment on Construction Design</th>
                                                    <td>${contract.term.percentOnDesign3}%</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment on Rough Construction</th>
                                                    <td>${contract.term.percentOnConstruct1}%</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment on Final Construction</th>
                                                    <td>${contract.term.percentOnConstruct2}%</td>
                                                </tr>
                                                <tr>
                                                    <th>Payment Timing for Design</th>
                                                    <td>
                                                        <c:if test="${contract.term.payOnStartOfDesign}">
                                                            Pay at the start of the design stage.
                                                        </c:if>
                                                        <c:if test="${!contract.term.payOnStartOfDesign}">
                                                            Payment follows normal design stage completion.
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Payment Timing for Construction</th>
                                                    <td>
                                                        <c:if test="${contract.term.payOnStartOfConstruction}">
                                                            Pay at the start of the construction stage.
                                                        </c:if>
                                                        <c:if test="${!contract.term.payOnStartOfConstruction}">
                                                            Payment follows normal construction stage completion.
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </table>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${empty contract.term}">
                                    <p class="text-muted">No terms are associated with this contract.</p>
                                </c:if>
                            </div>
                        </div>


                        <!-- Project and Customer Details Section -->
                        <div class="col-md-6">
                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-project-diagram"></i> Associated Project</h4>
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
                                    <p class="text-muted">No project is associated with this contract.</p>
                                </c:if>
                            </div>

                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-user"></i> Associated Customer</h4>
                                <c:if test="${not empty contract.customer}">
                                    <table class="table table-hover">
                                        <tr>
                                            <th>Customer Name</th>
                                            <td>${contract.customer.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Customer Email</th>
                                            <td>${contract.customer.email}</td>
                                        </tr>
                                        <tr>
                                            <th>Customer Phone</th>
                                            <td>${contract.customer.phone}</td>
                                        </tr>
                                    </table>
                                </c:if>
                                <c:if test="${empty contract.customer}">
                                    <p class="text-muted">No customer is associated with this contract.</p>
                                </c:if>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- Action Buttons Section -->

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
                <form id="declineForm" action="${pageContext.request.contextPath}/manager/contract/editStatusAndFeedback" method="post">
                    <input type="hidden" name="id" value="">
                    <input type="hidden" name="status" value="">
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
<div style="height:6vh;"></div>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
