<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!doctype html>
            <html class="no-js" lang="zxx">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="x-ua-compatible" content="ie=edge">
                <title>My Project</title>
                <meta name="description" content="HappiKoi">
                <meta name="author" content="ahmmedsabbirbd">
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
                <%@include file="../cssTemplate.jsp" %>
                    <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
                    <style>
                        .card-active p,
                        .card-active span,
                        .card-active i {
                            color: #FFFFFF !important;
                        }

                        .card-success p,
                        .card-success span,
                        .card-success i {
                            color: #28a745 !important;
                        }

                        .card-white {
                            background-color: #FFFFFF;
                            /* White background */
                            border: 2px solid #df2453;
                            color: #000000;
                        }

                        .card-white p,
                        .card-white span,
                        .card-white i {
                            color: #000000;
                        }

                        .customer-button-large {
                            padding: 15px 30px;
                            font-size: 1.2rem;
                            font-weight: bold;
                        }

                        .btn-md {
                            font-weight: 600;
                            font-size: 1.5rem;
                            padding: 10px 25px;
                            border-radius: 8px;
                            width: 100%;
                            max-width: 300px;
                            display: inline-block;
                            text-align: center;
                            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                            transition: box-shadow 0.3s ease, transform 0.3s ease;
                        }

                        .btn-md:hover {
                            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
                            /* Thêm đổ bóng khi hover */
                            transform: translateY(-2px);
                            /* Di chuyển nhẹ nút khi hover */
                        }

                        .form-control {
                            font-size: 1.9rem;
                        }

                        @media (min-width: 1201px) {
                            .view-account .content-panel {
                                min-height: 800px;
                                border-left: 1px solid #f3f3f7;
                                margin-left: 250px;
                            }

                            .view-account .side-bar .side-menu .nav>li>a {
                                display: block;
                                color: #9499a3;
                                padding: 13px 15px;
                                padding-left: 30px;
                                width: 250px;
                            }

                            .current-project-details,
                            .done-project {
                                width: 790px;
                            }
                        }

                        @media (min-width: 768px) and (max-width: 1200px) {

                            .current-project-details,
                            .done-project {
                                width: 550px;
                            }
                        }

                        .view-account .side-bar .user-info .meta li span {
                            width: 140px;
                            margin-right: 5px;
                            text-align: center;
                        }

                        .content-panel {
                            background: #ffffff;
                            padding: 20px;
                            border-radius: 8px;
                            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                            margin-bottom: 20px;
                        }

                        h2 {
                            color: #2c3e50;
                            font-weight: bold;
                            margin-bottom: 20px;
                            font-size: 3.5rem;
                        }

                        .modal {
                            z-index: 1050;
                        }

                        .modal-backdrop {
                            z-index: 1040;
                        }

                        .modal-content {
                            background-color: white;
                            color: black;
                            padding: 20px;
                            border-radius: 5px;
                            box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
                        }

                        .modal-dialog {
                            position: relative;
                            width: auto;
                            margin: 10px auto;
                            max-width: 600px;
                        }

                        .modal-body,
                        .modal-header,
                        .modal-footer {
                            display: block !important;
                        }

                        .modal-backdrop {
                            z-index: 1050 !important;
                        }

                        .modal {
                            z-index: 1060 !important;
                        }


                        .modal {
                            opacity: 1 !important;
                        }
                        .btn-model{
                            padding: 10px;
                            font-size: 15px;
                        }
                    </style>
            </head>

            <body>

                <!-- Header area start -->
                <%@include file="../homePageNavbar.jsp" %>

                    <section id="services"
                        class="service section-space__top section-space__bottom-80 theme-bg-heading-primary">
                        <div class="container rr-shape-p-c_1">
                            <div class="service__shape-1 rr-shape-p-s_1 leftRight">
                                <div></div>
                            </div>

                            <div class="row mb-30 mb-sm-40 mb-xs-35 align-items-lg-end align-items-center">
                                <div class="col-md-6">
                                    <div class="section__title-wrapper text-center text-xl-start">
                                        <span class="section__subtitle justify-content-start mb-13"><span
                                                data-width="40px" class="left-separetor"></span>Projects</span>
                                        <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                            data-cursor="-opaque">Manage Your Project
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <main class="main-section m-5 p-5">
                        <div class="container mt-5">
                            <div class="row">
                                <!-- Project Details Section -->
                                <div class="col-md-12 project-section">
                                    <div>
                                        <h2 class="section-header w-100 d-flex justify-content-between">
                                            <span><i class="fas fa-project-diagram"></i> Project Details</span>
                                            <c:if test="${project.status != 3 && project.status != 4}">
                                                <c:choose>
                                                    <c:when test="${project.status != 5}">
                                                        <button id="cancelBtn" class="btn btn-md  btn-danger"
                                                            data-toggle="modal"
                                                            data-target="#cancelRequestModal">Request
                                                            Cancel</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button id="cancelBtn" class="btn btn-md  btn-danger"
                                                            data-toggle="modal" data-target="#cancelRequestModal"
                                                            disabled>
                                                            Requesting
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </h2>
                                    </div>
                                    <div class="card">
                                        <div class="card-body">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <th>Project ID:</th>
                                                    <td>${project.projectId}</td>
                                                </tr>
                                                <tr>
                                                    <th>Project Name:</th>
                                                    <td>${project.projectName}</td>
                                                </tr>
                                                <tr>
                                                    <th>Description:</th>
                                                    <td>${project.description}</td>
                                                </tr>
                                                <tr>
                                                    <th>Start Date:</th>
                                                    <td>${project.dateStart}</td>
                                                </tr>
                                                <tr>
                                                    <th>End Date:</th>
                                                    <td>${project.dateEnd}</td>
                                                </tr>
                                                <tr>
                                                    <th>Status:</th>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${project.status == 1}">
                                                                <span class="badge bg-warning project-badge">Pending</span>
                                                            </c:when>
                                                            <c:when test="${project.status == 2}">
                                                                <span class="badge bg-primary project-badge">Processing</span>
                                                            </c:when>
                                                            <c:when test="${project.status == 3}">
                                                                <span class="badge bg-success project-badge">Completed</span>
                                                            </c:when>
                                                            <c:when test="${project.status == 4}">
                                                                <span class="badge bg-danger project-badge">Cancel</span>
                                                            </c:when>
                                                            <c:when test="${project.status == 5}">
                                                                <span class="badge bg-warning project-badge">Request Cancel</span>
                                                            </c:when>

                                                        </c:choose>
                                                    </td>
                                                </tr>

                                            </table>
                                        </div>
                                        <div class="project-stages-container mt-4">
                                            <div class="row justify-content-between">
                                                <c:set var="currentStage" value="${project.stage}" />

                                                <!-- Stage 1: Planning -->
                                                <c:set var="buttonClass"
                                                    value="${(currentStage > 1) ? 'btn-success' : (currentStage == 1) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                        Planning
                                                    </button>
                                                </div>

                                                <!-- Stage 2: Design -->
                                                <c:set var="buttonClass"
                                                    value="${(currentStage > 2) ? 'btn-success' : (currentStage == 2) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <c:choose>
                                                        <c:when test="${currentStage >= 2}">
                                                            <a href="${pageContext.request.contextPath}/customer/design/detail/${project.design.designId}"
                                                                class="btn stage-button btn-md btn-block px-3 ${buttonClass} stage-with-details">
                                                                Design <i class="fas fa-info-circle"></i>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button"
                                                                class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                Design
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <!-- Stage 3: Construction -->
                                                <c:set var="buttonClass"
                                                    value="${(currentStage > 3) ? 'btn-success' : (currentStage == 3) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <c:choose>
                                                        <c:when test="${currentStage >= 3}">
                                                            <a href="${pageContext.request.contextPath}/customer/construction/detail/${project.construction.constructionId}"
                                                                class="btn stage-button btn-md btn-block px-3 ${buttonClass} stage-with-details">
                                                                Construction <i class="fas fa-info-circle"></i>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button"
                                                                class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                                Construction
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>

                                                <!-- Stage 4: Maintenance -->
                                                <c:set var="buttonClass"
                                                    value="${(currentStage > 4) ? 'btn-success' : (currentStage == 4) ? 'btn-primary' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                        Maintenance
                                                    </button>
                                                </div>

                                                <!-- Stage 5: Complete -->
                                                <c:set var="buttonClass"
                                                    value="${(currentStage == 5) ? 'btn-success' : 'btn-outline-secondary'}" />
                                                <div class="col text-center mb-2">
                                                    <button type="button"
                                                        class="btn stage-button btn-md btn-block px-3 ${buttonClass}">
                                                        Complete
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Project Image -->


                                    <!-- Stage Section -->

                                </div>

                                <!-- Contract Details Section -->

                            </div>

                            <!-- Customer Details Row -->
                            <div class="row mt-4">
                                <div class="col-md-6 contract-section">
                                    <h2 class="section-header"><i class="fas fa-file-contract"></i> Associated Contract
                                    </h2>
                                    <div class="card">
                                        <div class="card-body">
                                            <c:choose>
                                                <c:when test="${not empty project.contract}">
                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <th>Contract ID:</th>
                                                            <td>${project.contract.contractId}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Date Created:</th>
                                                            <td>${project.contract.dateCreate}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Total Price:</th>
                                                            <td>${project.contract.totalPrice}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Status:</th>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when
                                                                        test="${project.contract.contractStatus == 1}">
                                                                        <span class="badge bg-warning">Pending</span>
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${project.contract.contractStatus == 2}">
                                                                        <span class="badge bg-info">Wait for
                                                                            customer</span>
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${project.contract.contractStatus == 3}">
                                                                        <span class="badge bg-danger">Rejected
                                                                            (Customer)</span>
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${project.contract.contractStatus == 4}">
                                                                        <span class="badge bg-danger">Rejected
                                                                            (Manager)</span>
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${project.contract.contractStatus == 5}">
                                                                        <span class="badge bg-secondary">Canceled</span>
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${project.contract.contractStatus == 6}">
                                                                        <span class="badge bg-success">Accepted</span>
                                                                    </c:when>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="text-muted">No contract is associated with this project.
                                                    </p>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 customer-section">
                                    <h2 class="section-header"><i class="fas fa-user"></i> Customer Information</h2>
                                    <div class="card">
                                        <div class="card-body">
                                            <c:choose>
                                                <c:when test="${not empty customer}">
                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <th>Name:</th>
                                                            <td>${customer.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Email:</th>
                                                            <td>${customer.email}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Phone:</th>
                                                            <td>${customer.phone}</td>
                                                        </tr>
                                                    </table>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="text-muted">No customer is associated with this project.
                                                    </p>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Cancel Request Modal -->
                        <!-- Cancel Request Modal -->
                        <div class="modal fade" id="cancelRequestModal" tabindex="-1" role="dialog"
                            aria-labelledby="cancelRequestModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="cancelRequestModalLabel">Request Project
                                            Cancellation</h5>

                                    </div>
                                    <div class="modal-body">
                                        <form id="cancelRequestForm">
                                            <div class="form-group">
                                                <label for="cancelMessage">Please provide a message for the
                                                    manager:</label>
                                                <textarea class="form-control" id="cancelMessage" rows="3"
                                                    required></textarea>

                                                <small id="errorText" class="text-danger" style="display:none;">Please
                                                    enter a
                                                    message
                                                    before submitting.</small>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary btn-model" id="TurnOffAppear"
                                            data-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-danger btn-model" id="submitCancelRequest">Submit
                                            Request</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </main>

                    <!-- Footer area start -->
                  
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <!-- Load a compatible jQuery version -->
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                    <%@include file="../spacing.jsp" %>
                        <%@include file="../footer.jsp" %>
                            <%@include file="../scriptTemplate.jsp" %>
                            <script>
                                $(document).ready(function () {
                                    var projectId = ${ project.projectId };

                                    // Manually trigger modal
                                    $("#cancelBtn").on('click', function () {
                                        $('#cancelRequestModal').addClass('canRequestModalAppear');
                                        $('#cancelRequestModal').modal('show');
                                    });

                                    $('#TurnOffAppear').on('click', function () {
                                        $('#cancelRequestModal').removeClass('canRequestModalAppear');
                                        $('#cancelRequestModal').modal('hide');
                                    });
                                    // Rest of your existing JavaScript...

                                    $("#submitCancelRequest").on('click', function () {
                                        var message = $("#cancelMessage").val().trim();
                                        var errorText = $("#errorText");

                                        if (message === "") {
                                            errorText.text("Please enter a message before submitting.").show();
                                        } else {
                                            errorText.hide();
                                            $.ajax({
                                                url: "${pageContext.request.contextPath}/customer/project/cancelRequest",
                                                method: "POST",
                                                data: {
                                                    projectId: projectId,
                                                    cancelMessage: message
                                                },
                                                success: function (response) {
                                                    // Update status to 'Request Cancel'
                                                    $("td:contains('Status:')").next().html('<span class="badge bg-warning">Request Cancel</span>');
                                                    $(".project-badge").removeClass("badge-primary").addClass("badge-warning").text("Request Cancel")
                                                    // Disable and change the text of the cancel button
                                                    $('#cancelBtn').prop('disabled', true).text('Requesting');

                                                    // Hide cancel request modal
                                                    $('#cancelRequestModal').modal('hide');
                                                    $('#cancelRequestModal').removeClass('canRequestModalAppear');
                                                    $('.modal-backdrop').remove();
                                                    // Show success message
                                                },
                                                error: function (xhr, status, error) {
                                                    alert("An error occurred while sending the cancellation request. Please try again.");
                                                }
                                            });
                                        }
                                    });
                                });
                            </script>

                            <!-- JS here -->


            </body>

            </html>