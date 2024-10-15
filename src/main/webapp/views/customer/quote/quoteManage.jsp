<%-- 
    Document   : quoteManage
    Created on : Sep 27, 2024, 12:36:33 AM
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
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
            <%@include file="../cssTemplate.jsp"%>
        <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
        <style>
            /* Custom styles for the sidebar */
            .sidebar {
                height: 100vh;
                background-color: #343a40;
                color: white;
            }
            .sidebar a {
                color: white;
                display: block;
                padding: 10px;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #495057;
            }
            @media (min-width: 992px) {
                .view-account .content-panel {
                    min-height: 800px;
                    border-left: 1px solid #f3f3f7;
                    margin-left: 250px;
                }
                .view-account .side-bar .side-menu .nav > li > a {
                    display: block;
                    color: #9499a3;
                    padding: 13px 15px;
                    padding-left: 30px;
                    width: 250px;
                }
            }
            .view-account .side-bar .user-info .meta li span {
                width: 140px;
                margin-right: 5px;
                text-align: center;
            }
            body{
                background: #f9f9fb;
            }
        </style>
    </head>
            <%@include file="../homePageNavbar.jsp"%>

    <body>
        <div class="container-fluid">
            <link
                    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
                    rel="stylesheet" />
            <div class="container">
                <div class="view-account">
                    <section class="module">
                        <div class="module-inner">
                            <div class="side-bar">
                                <div class="user-info">
                                    <img
                                            class="img-profile img-circle img-responsive center-block"
                                            src="${user.getShowingImg(user.imgURL)}"
                                            alt />
                                    <ul class="meta list list-unstyled">
                                        <li class="name">
                                            ${user.name}
                                            <br />
                                            <label class="label label-info">Customer</label>
                                        </li>
                                        <li class="email">
                                            <a href="#"><span>${user.email}</span></a>
                                        </li>
                                    </ul>
                                </div>
                                <nav class="side-menu">
                                    <ul class="nav">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/profile"
                                            ><span class="fa fa-user"></span> Profile</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/contract">
                                                <span class="fas fa-file-contract"></span> My Contract</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/projects/">
                                                <span class="fas fa-project-diagram"></span> My Project</a>
                                        </li>
                                        <li  class="active">
                                            <a href="${pageContext.request.contextPath}/customer/quote"><span class="bi bi-bar-chart-line"></span> Quotes</a>
                                        </li>
                                        <li>
                                            <a href="#"><span class="bi bi-bar-chart-line"></span> Service</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                            <div class="content-panel">


                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <h2 class="mb-4">Quote List</h2>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>Date</th>
                                <th>Quote Name</th>
                                <th>Content</th>
                                <th>Area</th>
                                <th>Design Cost</th>
                                <th>Construction Cost</th>
                                <th>Total Price</th>                                
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="quote" items="${quoteList}">
                                <tr>
                                    <td>${quote.quotesDate}</td>               
                                    <td>${quote.quotesName}</td>
                                    <td>${quote.quotesContent}</td>
                                    <td>${quote.quotesArea}</td>
                                    <td>${quote.quotesDesignCost}</td>
                                    <td>${quote.quotesConstructionCost}</td>
                                    <td>${quote.quotesTotalPrice}</td>
                                    <td>
                                        <!--1 pending, 2 approved(manager ok),3. rejected(by manage),4.accepted(customer), 
                                            5.refused(customer), 6.refused(by staff), 7. cancel -->
                                        <c:choose>                                
                                            <c:when test="${quote.quotesStatus == 2}">
                                                <span class="badge badge-secondary badge-status">Customer view</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 4}">
                                                <span class="badge badge-success badge-status">Accepted</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 5}">
                                                <span class="badge badge-warning badge-status">Refused</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 6}">
                                                <span class="badge badge-warning badge-status">Refused</span>
                                            </c:when>
                                            <c:when test="${quote.quotesStatus == 7}">
                                                <span class="badge badge-danger badge-status">cancel</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${quote.quotesStatus == 2}"> 
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#acceptModal"
                                                        onclick="document.getElementById('acceptForm').quoteId.value = '${quote.quotesId}';">Accept</button>
                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#declineModal"
                                                        onclick="document.getElementById('declineForm').quoteId.value = '${quote.quotesId}';
                                                                 document.getElementById('declineForm').toUserId.value = '${quote.staff.id}';">Decline</button>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <!-- Previous Button -->
                        <c:if test="${currentPage > 1}">
                            <a href="?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
                        </c:if>
                        <c:if test="${currentPage == 1}">
                            <button class="btn btn-primary" disabled>Previous</button>
                        </c:if>

                        <!-- Page Indicator (Format: <1/99>) -->
                        <span>Page <strong>${currentPage}</strong> of <strong>${totalPages}</strong></span>

                        <!-- Next Button -->
                        <c:if test="${currentPage < totalPages}">
                            <a href="?page=${currentPage + 1}" class="btn btn-primary">Next</a>
                        </c:if>
                        <c:if test="${currentPage == totalPages}">
                            <button class="btn btn-primary" disabled>Next</button>
                        </c:if>
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
                        <form id="declineForm" action="/customer/quote/updateStatusAndFeedback" method="post">
                            <input type="hidden" name="quoteId" value="">
                            <input type="hidden" name="statusId" value="5">
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

        <!-- Accept Modal -->
        <div class="modal fade" id="acceptModal" tabindex="-1" role="dialog" aria-labelledby="acceptModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="acceptModalLabel">Confirm Acceptance</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to accept this quote?
                        <form id="acceptForm" action="/customer/quote/updateStatus" method="post">
                            <input type="hidden" name="quoteId" value="">
                            <input type="hidden" name="statusId" value="4">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" form="acceptForm" class="btn btn-success">Yes, Accept</button>
                    </div>
                </div>
            </div>
        </div>

                    </section>
                </div>
            </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
                    <%@include file="../spacing.jsp"%>

    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>

</html>


