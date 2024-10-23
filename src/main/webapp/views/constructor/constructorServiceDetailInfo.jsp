<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Service Detail Information</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
    </head>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .info-section {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .info-box {
            background-color: #fff;
            padding: 23px;
            margin: 5px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .info-box-small {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .info-item p {
            background-color: #f0f0f0;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 1rem;
        }

        h3 {
            font-size: 1.5rem;
            color: #343a40;
            margin-bottom: 20px;
            font-weight: bold;
            border-bottom: 2px solid #343a40;
            padding-bottom: 10px;
        }

        .info-box:hover,
        .info-box-small:hover {
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .star-rating i {
            font-size: 2rem;
            color: #ddd;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .star-rating i:hover,
        .star-rating i.fas {
            color: #f39c12;
        }

        .modal-header {
            border-bottom: 0;
        }

        .modal-body h6 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .form-group textarea {
            resize: none;
        }

        .modal-footer {
            border-top: 0;
            justify-content: flex-end;
        }

        /* Custom modal size for width and height */
        .modal-lg-custom {
            max-width: 900px;
            /* Adjust width */
        }

        .modal-lg-custom .modal-content {
            height: 80vh;
            /* Adjust height */
        }
    </style>

    <body>

        <div class="container">
            <%@include file="navbarConstruction.jsp" %>
            <main role="main" class="mt-4 container">
                <div class="info-section">
                    <!-- Customer Information -->
                    <div class="col-md-4">
                        <div class="info-box info-box-small">
                            <h3>Customer Information</h3>
                            <div class="info-item">
                                <p><strong>Name:</strong> ${customer.name}</p>
                            </div>
                            <div class="info-item">
                                <p><strong>Phone Number:</strong> ${customer.phone}</p>
                            </div>
                            <div class="info-item">
                                <p><strong>Email:</strong> ${customer.email}</p>
                            </div>

                        </div>
                        < </div>

                    <!-- Service Information -->
                    <div class="col-md-8">
                        <div class="info-box">
                            <div>
                                <h3 class="w-100 d-flex justify-content-between"> <span>Service Detail
                                        Information</span>
                                        <c:if
                                            test="${serviceDetail.serviceDetailStatus!=3 && serviceDetail.serviceDetailStatus!=5}">
                                        <span>
                                            <c:if test="${serviceDetail.serviceDetailStatus!=4}">
                                                <button id="confirmBtn" class="btn btn-md  btn-success"
                                                        data-toggle="modal"
                                                        data-target="#confirmationModal">Confirm
                                                    Complete</button>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${serviceDetail.serviceDetailStatus!=4}">
                                                    <button id="cancelBtn" class="btn btn-md  btn-danger"
                                                            data-toggle="modal"
                                                            data-target="#cancelRequestModal">Request
                                                        Cancel</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <button id="cancelBtn" class="btn btn-md  btn-danger"
                                                            data-toggle="modal"
                                                            data-target="#cancelRequestModal" disabled>
                                                        Requesting
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </c:if>
                                </h3>
                            </div>
                            <div class="info-item">
                                <p><strong>Service Name:</strong> ${serviceDetail.service.serviceName}</p>
                            </div>
                            <div class="info-item">
                                <p><strong>Description:</strong> ${serviceDetail.service.serviceDescription}
                                </p>
                            </div>
                            <div class="info-item">
                                <p><strong>Price:</strong> ${serviceDetail.price}</p>
                            </div>
                            <div class="info-item">
                                <p><strong>Date Registered:</strong> ${serviceDetail.dateRegister}</p>
                            </div>

                            <div class="info-item">
                                <p><strong>Status:</strong>
                                    <c:choose>
                                        <c:when test="${serviceDetail.serviceDetailStatus == 1}">
                                            <span class="badge badge-secondary">Planning</span>
                                        </c:when>
                                        <c:when test="${serviceDetail.serviceDetailStatus == 2}">
                                            <span class="badge badge-primary">Processing</span>
                                        </c:when>
                                        <c:when test="${serviceDetail.serviceDetailStatus == 3}">
                                            <span class="badge badge-success">Complete</span>
                                        </c:when>
                                        <c:when test="${serviceDetail.serviceDetailStatus == 4}">
                                            <span class="badge badge-warning">Requesting Cancel</span>
                                        </c:when>
                                        <c:when test="${serviceDetail.serviceDetailStatus == 5}">
                                            <span class="badge badge-danger">Canceled</span>
                                        </c:when>
                                    </c:choose>
                                </p>
                            </div>
                            <div>
                                <h3 class="section-header"><i class="fas fa-comments"></i> Customer
                                    Feedback</h3>

                                <!-- Display feedback only if available -->
                                <c:if test="${serviceDetail.feedback != null}">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <!-- Display customer name -->
                                            <h5 class="card-title">Feedback from:
                                                ${serviceDetail.customer.name}</h5>

                                            <!-- Star rating display -->
                                            <div class="star-rating mb-2">
                                                <c:forEach var="i" begin="1" end="5">
                                                    <i class="<c:choose>
                                                           <c:when test='${i <= serviceDetail.rating}'>
                                                               fas fa-star
                                                           </c:when>
                                                           <c:otherwise>
                                                               far fa-star
                                                           </c:otherwise>
                                                       </c:choose>" data-value="${i}"></i>
                                                </c:forEach>
                                            </div>

                                            <!-- Feedback comment -->
                                            <p class="card-text">${serviceDetail.feedback}</p>

                                            <!-- Date of feedback (optional) -->
                                            <p class="text-muted small">Posted on:
                                                ${serviceDetail.feedbackDate}</p>
                                        </div>
                                    </div>
                                </c:if>

                                <!-- Display message if no feedback available -->
                                <c:if test="${serviceDetail.feedback == null}">
                                    <p>No feedback available for this service.</p>
                                </c:if>
                            </div>

                        </div>
                    </div>
                </div>
            </main>

            <!-- Confirmation Modal -->
            <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog"
                 aria-labelledby="confirmationModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmationModalLabel">Confirm Completion</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to mark this service as complete?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-success"
                                    id="confirmCompleteButton">Confirm</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Cancel Request Modal -->
            <div class="modal fade" id="cancelRequestModal" tabindex="-1" role="dialog"
                 aria-labelledby="cancelRequestModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cancelRequestModalLabel">Request Service Cancellation</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="cancelRequestForm">
                                <div class="form-group">
                                    <label for="cancelMessage">Please provide a message for the manager:</label>
                                    <textarea class="form-control" id="cancelMessage" rows="4"
                                              placeholder="Enter your reason for cancellation"></textarea>
                                    <!-- Error message area -->
                                    <small id="errorText" class="text-danger" style="display:none;">Please enter a
                                        message
                                        before submitting.</small>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-danger" id="submitCancelRequest">Submit
                                Request</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Notification Modal for Success or Error -->
            <!-- Cancel Request Modal -->
            <div class="modal fade" id="notificationModal" tabindex="-1" role="dialog"
                 aria-labelledby="notificationModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="notificationModalLabel">Notification</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="notificationMessage">
                            <!-- Notification message will be dynamically updated -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                var serviceDetailId = ${ serviceDetail.id };
                // Success and error background handling
                function showNotification(message, isSuccess) {
                    var modalBody = $("#notificationMessage");

                    if (isSuccess) {
                        // Apply success styling (green background)
                        modalBody.removeClass('alert-danger').addClass('alert-success');
                    } else {
                        // Apply error styling (red background)
                        modalBody.removeClass('alert-success').addClass('alert-danger');
                    }

                    // Set the message
                    modalBody.text(message);

                    // Show the notification modal
                    $('#notificationModal').modal('show');
                }

                // Confirm Completion
                $("#confirmCompleteButton").on('click', function () {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/construction/serviceDetail/update/",
                        method: "POST",
                        data: {
                            serviceDetailId: serviceDetailId
                        },
                        success: function (response) {
                            // Update status to 'Complete'
                            $("p:contains('Status:')").find('span').removeClass().addClass('badge badge-success').text('Complete');

                            // Hide confirm button
                            $("#confirmBtn").prop("disabled", true).hide();

                            // Hide confirmation modal and show success message
                            $('#confirmationModal').modal('hide');
                            showNotification("Service marked as complete successfully!", true);
                        },
                        error: function (xhr, status, error) {
                            showNotification("An error occurred while updating the service status. Please try again.", false);
                        }
                    });
                });

                // Cancel Request

                // Cancel Request
                $("#submitCancelRequest").on('click', function () {
                    var message = $("#cancelMessage").val().trim();
                    var errorText = $("#errorText");

                    if (message === "") {
                        errorText.text("Please enter a message before submitting.");
                        errorText.show();
                    } else {
                        errorText.hide();
                        $.ajax({
                            url: "${pageContext.request.contextPath}/construction/serviceDetail/cancelRequest/",
                            method: "POST",
                            data: {
                                serviceDetailId: serviceDetailId,
                                cancelMessage: message
                            },
                            success: function (response) {
                                // Change the status badge to 'Requesting'
                                $("p:contains('Status:')").find('span').removeClass().addClass('badge badge-warning').text('Requesting');

                                // Disable and change the text of the cancel button
                                $('#cancelBtn').prop('disabled', true).text('Requesting');
                                $("#confirmBtn").prop("disabled", true).hide();

                                // Hide cancel request modal
                                $('#cancelRequestModal').modal('hide');

                                // Show success message
                                showNotification("Cancellation request sent successfully!", true);
                            },
                            error: function (xhr, status, error) {
                                showNotification("An error occurred while sending the cancellation request. Please try again.", false);
                            }
                        });
                    }
                });
            });
        </script>
    </body>

</html>