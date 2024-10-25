
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
            .content-panel {
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .view-account .side-bar .user-info .meta li span {
                width: 140px;
                margin-right: 5px;
                text-align: center;
            }
            body{
                background: #f9f9fb;
            }
            /* Table Styling */
            .table {
                margin-top: 20px;
                border-collapse: collapse;
                width: 100%;
                font-size: 19px;
                background-color: #fff;
            }

            .table thead th {
                background-color: #2c3e50;
                color: white;
                padding: 10px;
                text-align: left;
                border-bottom: 2px solid #ddd;
            }

            .table tbody td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            .table tbody tr:hover {
                background-color: #f2f2f2;
            }
            .badge-warning{
                background-color: #ffc107 ;
            }
            .badge-success{
                background-color: #28a745;
            }
            .badge-danger{
                background-color: #dc3545;
            }
            .badge-secondary{
                background-color: #6c757d;
            }
            h2 {
                color: #2c3e50;
                font-weight: bold;
                margin-bottom: 20px;
                font-size: 3.5rem;
            }
        </style>
    </head>
    <%@include file="../homePageNavbar.jsp"%>

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
                                                                                              class="left-separetor"></span>Yourself</span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">Information
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container-fluid mt-5">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
            <div class="container">
                <div class="view-account">
                    <section class="module">
                        <div class="module-inner">
                            <div class="side-bar">
                                <div class="user-info">
                                    <img class="img-profile img-circle img-responsive center-block"  src="${user.getShowingImg(user.imgURL)}" alt />
                                    <ul class="meta list list-unstyled">
                                        <li class="name">${user.name}
                                            <br>
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
                                            <a href="${pageContext.request.contextPath}/customer/consultant"
                                               style="font-size: 16px">
                                                <span class="bi bi-briefcase"></span> My
                                                Consultant</a>
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
                                            <a href="${pageContext.request.contextPath}/customer/quote">
                                                <i class="bi bi-file-earmark-text"></i> Quotes</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/customer/serviceDetails/"><span class="bi bi-bar-chart-line"></span> Service</a>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                            <div class="content-panel">


                                <!-- Main content -->
                                    <h2>Quote List</h2>
                                    <table class="table table-bordered table-hover mt-5">
                                        <thead>
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
                                        <form id="declineForm" action="${pageContext.request.contextPath}/customer/quote/updateStatusAndFeedback" method="post">
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
                                        <form id="acceptForm" action="${pageContext.request.contextPath}/customer/quote/updateStatus" method="post">
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
        </div>
    </body>
    <div style="height:10vh;"></div>

    <%@include file="../footer.jsp"%>
    <%@include file="../scriptTemplate.jsp"%>

</html>


