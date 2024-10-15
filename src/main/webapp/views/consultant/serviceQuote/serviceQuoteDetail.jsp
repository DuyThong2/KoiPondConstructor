<%-- 
    Document   : serviceQuoteDetail
    Created on : Oct 13, 2024, 3:15:18 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Service Quote Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <!-- Custom Styles -->
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
    <body>
        <div class="container-fluid mt-5">
            <div class="row">
                <!-- Include Navbar -->

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <!-- Contract Details Section -->
                    <div class="section-card">
                        <h2 class="section-header"><i class="fas fa-file-contract"></i> Service Quote Details</h2>
                        <table class="table table-striped">
                            <tr>
                                <th>Service Quote ID</th>
                                <td>${serviceQuote.serviceQuotesId}</td>
                            </tr>
                            <tr>
                                <th>Service Quote Name</th>
                                <td>
                                    ${serviceQuote.serviceQuotesName}
                                </td>
                            </tr>
                            <tr>
                                <th>Date Created</th>
                                <td>${serviceQuote.serviceQuotesDate}</td>
                            </tr>
                            <tr>
                                <th>Service Quote Content</th>
                                <td>${serviceQuote.serviceQuotesContent}</td>
                            </tr>                            
                            <tr>
                                <th>Service Quote Status</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 1}">
                                            <span class="badge badge-warning badge-status">Pending</span>
                                        </c:when>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 2}">
                                            <span class="badge badge-success badge-status">Approved By Manager</span>
                                        </c:when>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 3}">
                                            <span class="badge badge-warning badge-status">Rejected (Manager)</span>
                                        </c:when>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 4}">
                                            <span class="badge badge-success badge-status">Approved By Customer</span>
                                        </c:when>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 5}">
                                            <span class="badge badge-warning badge-status">Rejected (Customer)</span>
                                        </c:when>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 6}">
                                            <span class="badge badge-warning badge-status">Rejected (Staff)</span>
                                        </c:when>
                                        <c:when test="${serviceQuote.serviceQuotesStatus == 7}">
                                            <span class="badge badge-danger badge-status">Cancel</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>Service Quote Area</th>
                                <td>${serviceQuote.serviceQuotesArea}</td>
                            </tr>
                            <tr>
                                <th>Service Quote Total Price</th>
                                <td>${serviceQuote.serviceQuotesTotalPrice}</td>
                            </tr>                            
                        </table>
                    </div>

                    <div class="row">
                        <!-- Term Details Section -->
                        <div class="col-md-6">
                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-file-alt"></i> Associated Service</h4>
                                <c:if test="${not empty serviceQuote.service}">
                                    <table class="table table-hover">
                                        <tr>
                                            <th>Service ID</th>
                                            <td>${serviceQuote.service.serviceId}</td>
                                        </tr>
                                        <tr>
                                            <th>Service Name</th>
                                            <td>${serviceQuote.service.serviceName}</td>
                                        </tr>
                                        <tr>
                                            <th>Service Description</th>
                                            <td>${serviceQuote.service.serviceDescription}</td>
                                        </tr>                                        
                                    </table>
                                </c:if>
                                <c:if test="${empty serviceQuote.service}">
                                    <p class="text-muted">No Service are associated with this contract.</p>
                                </c:if>
                            </div>
                            
                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-project-diagram"></i> Associated Consultant</h4>
                                <c:if test="${not empty serviceQuote.consultant}">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Consultant ID</th>
                                            <td>${serviceQuote.consultant.consultantId}</td>
                                        </tr>
                                        <tr>
                                            <th>Consultant Content</th>
                                            <td>${serviceQuote.consultant.consultantContent}</td>
                                        </tr>
                                        <tr>
                                            <th>Consultant Type</th>
                                            <td>${serviceQuote.consultant.consultantType}</td>
                                        </tr>
                                    </table>
                                </c:if>
                                <c:if test="${empty serviceQuote.consultant}">
                                    <p class="text-muted">No consultant is associated with this contract.</p>
                                </c:if>
                            </div>
                        </div>

                        <!-- Project and Customer Details Section -->
                        <div class="col-md-6">
                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-project-diagram"></i> Associated Staff</h4>
                                <c:if test="${not empty serviceQuote.staff}">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Staff Name</th>
                                            <td>${serviceQuote.staff.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Staff Email</th>
                                            <td>${serviceQuote.staff.email}</td>
                                        </tr>
                                        <tr>
                                            <th>Staff Phone</th>
                                            <td>${serviceQuote.staff.phone}</td>
                                        </tr>
                                    </table>
                                </c:if>
                                <c:if test="${empty serviceQuote.staff}">
                                    <p class="text-muted">No staff is associated with this contract.</p>
                                </c:if>
                            </div>

                            <div class="section-card">
                                <h4 class="section-header"><i class="fas fa-user"></i> Associated Customer</h4>
                                <c:if test="${not empty serviceQuote.customer}">
                                    <table class="table table-hover">
                                        <tr>
                                            <th>Customer Name</th>
                                            <td>${serviceQuote.customer.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Customer Email</th>
                                            <td>${serviceQuote.customer.email}</td>
                                        </tr>
                                        <tr>
                                            <th>Customer Phone</th>
                                            <td>${serviceQuote.customer.phone}</td>
                                        </tr>
                                    </table>
                                </c:if>
                                <c:if test="${empty serviceQuote.customer}">
                                    <p class="text-muted">No customer is associated with this contract.</p>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons Section -->
                    <div class="action-buttons">
                        <c:choose>
                        <c:when test="${serviceQuote.serviceQuotesStatus == 1}">
                            <div class="">
                                <form action="/consultant/serviceQuote/update" method="get" class="d-inline">
                                    <input type="hidden" name="serviceQuoteId" value="${serviceQuote.serviceQuotesId}" >
                                    <button type="submit" class="btn btn-info">Edit Service Quotes</button>
                                </form>
                            </div>
                        </c:when>
                        
                    </c:choose>
                    </div>

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
                        <form id="declineForm" action="/manager/contract/editStatusAndFeedback" method="post">
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

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>