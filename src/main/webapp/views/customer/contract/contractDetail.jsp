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
            <!-- FontAwesome Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
            <%@include file="../cssTemplate.jsp" %>

                <style>
                    .section-header {
                        margin-bottom: 20px;
                        border-bottom: 2px solid #007bff;
                        padding-bottom: 5px;
                        font-weight: 500;
                        color: #007bff;
                    }

                    .contract-section,
                    .project-section,
                    .term-section,
                    .customer-section {
                        background-color: #f9f9f9;
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        margin-bottom: 40px;
                    }

                    .btn-custom {
                        margin-top: 20px;
                        padding: 10px 20px;
                        font-size: 1rem;
                        border-radius: 5px;
                        width: 100%;
                        /* Make it full width */
                    }

                    .status-badge {
                        font-size: 1.1rem;
                        padding: 8px 15px;
                    }

                    .table th,
                    .table td {
                        vertical-align: middle;
                    }

                    .table th {
                        background-color: #f0f0f0;
                    }

                    .icon-btn {
                        margin-right: 8px;
                    }

                    .action-buttons {
                        display: flex;
                        justify-content: space-between;
                        margin-top: 20px;
                    }
                </style>
        </head>
        <%@include file="../homePageNavbar.jsp" %>

            <body>
                <section id="services"
                    class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
                    <div class="container rr-shape-p-c_1">
                        <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                            <div></div>
                        </div>

                        <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                            <div class="col-md-6">
                                <div class="section__title-wrapper text-center text-xl-start">
                                    <span class="section__subtitle justify-content-start mb-13"><span data-width="40px"
                                            class="left-separetor"></span>Contract</span>
                                    <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                        data-cursor="-opaque">Contract Details
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container mt-5">
                    <div class="row">
                        <!-- Contract Details Section (50%) -->
                        <div class="col-md-6 contract-section">
                            <h2 class="section-header"><i class="fas fa-file-contract"></i> Contract
                                Details</h2>
                            <table class="table table-hover table-striped">
                                <tr>
                                    <th>Contract ID</th>
                                    <td>${contract.contractId}</td>
                                </tr>
                                <tr>
                                    <th>Contract Document</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty contract.fileURL}">
                                                <form
                                                    action="${pageContext.request.contextPath}/download/${contract.fileURL}"
                                                    method="get">
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
                                    <th>Contract Status</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${contract.contractStatus == 1}">
                                                <span class="badge badge-warning status-badge">Pending</span>
                                            </c:when>
                                            <c:when test="${contract.contractStatus == 2}">
                                                <span class="badge badge-success status-badge">Approved by
                                                    company</span>
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
                        </div>

                        <!-- Term Details Section (50%) -->
                        <div class="col-md-6 term-section">
                            <h2 class="section-header text-primary"><i class="fas fa-file-alt"></i> Associated Term</h2>
                            <c:if test="${not empty contract.term}">
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
                            </c:if>
                            <c:if test="${empty contract.term}">
                                <p>No terms are associated with this contract.</p>
                            </c:if>
                        </div>
                    </div>

                    <!-- Project and Customer Details Row -->
                    <div class="row">
                        <!-- Project Details (50%) -->
                        <div class="col-md-6 project-section">
                            <h4 class="section-header text-primary"><i class="fas fa-project-diagram"></i> Associated
                                Project</h4>
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

                        <!-- Customer Details (50%) -->
                        <div class="col-md-6 customer-section">
                            <h4 class="section-header text-primary"><i class="fas fa-user"></i> Associated Customer</h4>
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
                                <p>No customer is associated with this contract.</p>
                            </c:if>
                        </div>
                    </div>

                    <!-- Action Button (Spanning Full Width) -->
                    <div class="row">
                        <div class="col-md-12">
                            <c:choose>
                                <c:when test="${contract.contractStatus == 2}">
                                    <div class="mt-4 text-center">
                                        <form action="${pageContext.request.contextPath}/customer/contract/editStatus"
                                            method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="${contract.contractId}">
                                            <input type="hidden" name="status" value="6">
                                            <button type="submit" class="btn btn-success">Accept</button>
                                        </form>
                                        <!--                            <form action="/customer/contract/editStatus" method="POST" class="d-inline">
                                                            <input type="hidden" name="id" value="$/{contract.contractId}">
                                                            <input type="hidden" name="status" value="3">
                                                            <button type="submit" class="btn btn-warning">Reject</button>
                                                        </form>-->
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#declineModal" onclick="document.getElementById('declineForm').id.value = '${contract.contractId}';
                                        document.getElementById('declineForm').toUserId.value = '${contract.quote.staff.id}';
                                        document.getElementById('declineForm').status.value = '3';"><i
                                                class="fas fa-times icon-btn"></i>
                                            Reject
                                        </button>
                                        <form action="${pageContext.request.contextPath}/customer/contract/editStatus"
                                            method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="${contract.contractId}">
                                            <input type="hidden" name="status" value="5">
                                            <button type="submit" class="btn btn-danger">Cancel</button>
                                        </form>
                                    </div>
                                </c:when>
                                <c:when test="${contract.contractStatus == 3}">
                                    <div class="mt-4 text-center">
                                        <div class="alert alert-danger text-center" role="alert">
                                            <strong>Rejection Reason: </strong> ${feedback.feedbackContent}
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Decline Modal -->
                <div class="modal fade" id="declineModal" tabindex="-1" role="dialog"
                    aria-labelledby="declineModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="declineModalLabel">Reason for Declining</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="declineForm"
                                    action="${pageContext.request.contextPath}/customer/contract/editStatusAndFeedback"
                                    method="post">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="status" value="">
                                    <input type="hidden" name="toUserId" value="">
                                    <div class="form-group">
                                        <label for="declineReason">Please provide a reason for declining this
                                            quote:</label>
                                        <textarea class="form-control" id="declineReason" name="declineReason" rows="4"
                                            required></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" form="declineForm" class="btn btn-danger">Submit Reason &
                                    Decline</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap JS and dependencies -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            </body>
            <%@include file="../footer.jsp" %>
                <%@include file="../scriptTemplate.jsp" %>

        </html>