<%-- 
    Document   : consultantDetail
    Created on : Sep 25, 2024, 6:50:08 PM
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
                    <h2 class="section-header text-primary">Consultant Details</h2>
                    <table class="table table-hover table-striped">
                        <tr>
                            <th>Consultant ID</th>
                            <td>${consultant.consultantId}</td>
                        </tr>                        
                        <tr>
                            <th>Date Created</th>
                            <td><fmt:formatDate value="${consultant.consultantDateTime.time}" pattern="yyyy-MM-dd HH:mm"/></td>
                        </tr>
                        <tr>
                            <th>Contract Status</th>
                            <td>
                                <!-- 1: Pending 2: Assign 3: Processing 4:Completed(khi hợp đồng đc ký) 5.Cancel(khi khác ko muốn tư vấn)-->
                                <c:choose>
                                    <c:when test="${consultant.consultantStatus == 1}">
                                        <span class="badge badge-warning badge-status">Pending</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 2}">
                                        <span class="badge badge-secondary badge-status">Assigned</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 3}">
                                        <span class="badge badge-info badge-status">Processing</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 4}">
                                        <span class="badge badge-success badge-status">Completed</span>
                                    </c:when>
                                    <c:when test="${consultant.consultantStatus == 5}">
                                        <span class="badge badge-danger badge-status">Cancel</span>
                                    </c:when>    
                                </c:choose>
                            </td>
                        </tr>

                        <tr>
                            <th>Consultant type</th>
                            <td>${consultant.consultantType}</td>
                        </tr>
                        <tr>
                            <th>Consultant Content</th>
                            <td>${consultant.consultantContent}</td>
                        </tr>
                    </table>

                    <!-- Staff Table -->
                    <h2 class="section-header text-primary">Assigned staff</h2>
                    <c:if test="${not empty consultant.staff}"> 
                        <table class="table table-hover table-striped">
                            <tr>
                                <th>Staff Id</th>
                                <td>${consultant.staff.id}</td>
                            </tr>
                            <tr>
                                <th>Staff Name</th>
                                <td>${consultant.staff.name}</td>
                            </tr>
                            <tr>
                                <th>Staff Phone</th>
                                <td>${consultant.staff.phone}</td>
                            </tr>
                            <tr>
                                <th>Staff Email</th>
                                <td>${consultant.staff.email}</td>
                            </tr>
                        </table>
                    </c:if>
                    <c:if test="${empty consultant.staff}"> 
                        <p>Need to assign staff</p>
                    </c:if>

                    <!-- Approve/Reject buttons placed below the main table -->
                    <c:choose>
                        <c:when test="${consultant.consultantStatus == 1}">
                            <div class="">
                                <form action="/manager/consultant/viewConsultantStaffList/${consultant.consultantId}" method="get" class="d-inline">                                   
                                    <button type="submit" class="btn btn-secondary">Assign staff</button>
                                </form>
                            </div>
                        </c:when>                        
                    </c:choose>
                </div>

                <!-- customer and quotes and predesign Details Section (30%) -->
                <div class="col-md-4">
                    <!-- Associated Quotes Details -->
                    <div class="quotes-section mb-4">
                        <h4 class="section-header text-primary">Associated Quotes</h4>
                        <c:if test="${not empty consultant.quotes}">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Quotes ID</th>
                                    <td>${consultant.quotes.quotesId}</td>
                                </tr>
                                <tr>
                                    <th>Quotes Name</th>
                                    <td>${consultant.quotes.quotesName}</td>
                                </tr>
                                <tr>
                                    <th>Quotes Total Price</th>
                                    <td>${consultant.quotes.quotesTotalPrice}</td>
                                </tr>
                                <tr>
                                    <th>Quotes Description</th>
                                    <td>${consultant.quotes.quotesContent}</td>
                                </tr>
                            </table>
                        </c:if>
                        <c:if test="${empty consultant.quotes}">
                            <p class="text-muted">No Quotes is associated with this consultant.</p>
                        </c:if>
                    </div>

                    <!-- Associated customer Details -->
                    <div class="customer-section mb-4">
                        <h4 class="section-header text-primary">Associated Customer</h4>                       
                        <table class="table table-bordered">
                            <tr>
                                <th>Customer ID</th>
                                <td>${consultant.customer.id}</td>
                            </tr>
                            <tr>
                                <th>Customer Name</th>
                                <td>${consultant.customer.name}</td>
                            </tr>
                            <tr>
                                <th>Customer Email</th>
                                <td>${consultant.customer.email}</td>
                            </tr>
                            <tr>
                                <th>Customer phone</th>
                                <td>${consultant.customer.phone}</td>
                            </tr>
                        </table>                                            
                    </div>

                    <!-- Associated Pre-Design Details -->
                    <div class="PreDesign-section mb-4">
                        <h4 class="section-header text-primary">Associated Pre-Design</h4>
                        <c:if test="${not empty consultant.predesign}">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <th>Pre-design Name</th>
                                        <td>${consultant.predesign.preDesignName}</td>
                                    </tr>
                                    <tr>
                                        <th>Pre-design Description</th>
                                        <td>${consultant.predesign.preDesignDescription}</td>
                                    </tr>
                                    <tr>
                                <a href="" class="btn btn-info">View Pre Design</a>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty consultant.predesign}">
                            <p>No Pre-Design are associated with this Consultant.</p>
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

