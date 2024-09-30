<%-- 
    Document   : quoteDetail
    Created on : Sep 24, 2024, 11:31:05 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            .consultant-section {
                margin-bottom: 40px;
            }
            .quotes-section, .PreDesign-section, .customer-section {
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
                <!-- Consultant Details Section (70%) -->
                <div class="col-md-8 consultant-section">
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
                                <!-- 1 pending, 2 approved(manager ok),3. rejected(by manage),
                                4.accepted(customer), 5.refused(customer),
                                6.refused(by staff),7. cancel-->
                                <c:choose>
                                    <c:when test="${quotes.quotesStatus == 1}">
                                        <span class="badge badge-warning badge-status">Pending</span>
                                    </c:when>
                                    <c:when test="${quotes.quotesStatus == 2}">
                                        <span class="badge badge-success badge-status">Approved By Manager</span>
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
                                        <span class="badge badge-warning badge-status">Refused By Staff</span>
                                    </c:when>
                                    <c:when test="${quotes.quotesStatus == 7}">
                                        <span class="badge badge-danger badge-status">cancel</span>
                                    </c:when>                
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>Quotes Create Date</th>
                            <td>${quotes.quotesDate}</td>
                        </tr>
                        <tr>
                            <th>Quotes Area</th>
                            <td>${quotes.quotesArea}</td>
                        </tr>
                        <tr>
                            <th>Quotes Total Cost</th>
                            <td>${quotes.quotesTotalPrice}</td>
                        </tr>
                        <tr>
                            <th>Quotes Design Cost</th>
                            <td>${quotes.quotesDesignCost}</td>
                        </tr>
                        <tr>
                            <th>Quotes Construction Cost</th>
                            <td>${quotes.quotesDesignCost}</td>
                        </tr>                        
                        <!-- Contract Status moved back into the table -->
                    </table>

                    <!-- Approve/Reject buttons placed below the main table -->
                    <c:choose>
                        <c:when test="${quotes.quotesStatus == 3}">
                            <div class="">
                                <form action="/consultant/quote/updateQuote" method="post" class="d-inline">
                                    <input type="hidden" name="quoteId" value="${quotes.quotesId}" >
                                    <button type="submit" class="btn btn-info">Edit Quotes</button>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${quotes.quotesStatus == 4 and empty quotes.contract}">
                            <div class="">
                                <form action="/consultant/contract/create" method="get" class="d-inline">
                                    <input type="hidden" name="quoteId" value="${quotes.quotesId}" >
                                    <button type="submit" class="btn btn-info">Create Contract</button>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${quotes.quotesStatus == 5}">
                            <div class="">
                                <form action="/consultant/quote/updateQuote" method="post" class="d-inline">
                                    <input type="hidden" name="quoteId" value="${quotes.quotesId}" >
                                    <button type="submit" class="btn btn-info">Edit Quotes</button>
                                </form>
                                <form action="/consultant/quote/detail/updateStatus" method="get" class="d-inline">
                                    <input type="hidden" name="quoteId" value="${quotes.quotesId}">
                                    <input type="hidden" name="statusId" value="6">
                                    <button type="submit" class="btn btn-danger">Deny Request</button>
                                </form>
                            </div>
                        </c:when>
                    </c:choose>
                </div>

                <!-- customer and quotes and predesign Details Section (30%) -->
                <div class="col-md-4">
                    <!-- Associated Customer Details -->
                    <div class="quotes-section mb-4">
                        <h4 class="section-header text-primary">Associated Customer</h4>
                        <table class="table table-bordered">
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
                        </table>                       
                    </div>

                    <!-- Associated package Details -->
                    <div class="customer-section mb-4">
                        <h4 class="section-header text-primary">Associated Package</h4>                       
                        <table class="table table-bordered">
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

                    <!-- Associated Contract Details -->
                    <div class="PreDesign-section mb-4">
                        <h4 class="section-header text-primary">Associated Contract</h4>
                        <c:if test="${not empty quotes.contract}">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <th>Contract Id</th>
                                        <td>${quotes.contract.contractId}</td>
                                    </tr>
                                    <tr>
                                        <th>Contract Create Date</th>
                                        <td>${quotes.contract.dateCreate}</td>
                                    </tr>                                                                   
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty quotes.contract}">
                            <p>No Contract are associated with this Consultant.</p>
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
