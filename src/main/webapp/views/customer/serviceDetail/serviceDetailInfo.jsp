<%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <!doctype html>
          <html lang="zxx">

          <head>
               <meta charset="utf-8">
               <meta http-equiv="x-ua-compatible" content="ie=edge">
               <title>HappiKoi</title>
               <meta name="viewport" content="width=device-width, initial-scale=1">
               <link rel="shortcut icon" type="image/x-icon" href="assets/imgs/favicon.svg">
               <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
               <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
               <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
               <%@include file="../cssTemplate.jsp" %>
                    <style>
                         body {
                              background-color: #f8f9fa;
                              font-family: 'Arial', sans-serif;
                              min-height: 100vh;
                         }

                         .info-box {
                              background-color: #fff;
                              padding: 20px;
                              margin: 5px;
                              border-radius: 10px;
                              box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                         }

                         .section-header {
                              font-size: 1.8rem;
                              font-weight: 600;
                              color: #007bff;
                              margin-bottom: 15px;
                              border-bottom: 2px solid #007bff;
                              padding-bottom: 10px;
                         }

                         .info-item p {
                              background-color: #f0f0f0;
                              padding: 12px;
                              border-radius: 5px;
                              margin-bottom: 15px;
                         }

                         .info-box:hover {
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

                         .modal {
                              opacity: 1 !important;
                         }
                    </style>
          </head>

          <body>

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
                                                                                              class="left-separetor">
                                </span><a href="${pageContext.request.contextPath}/customer/serviceDetails/" class="theme-color">Service</a></span>
                            <h2 class="section__title color-white title-animation text-capitalize mb-0 rr-br-hidden-xl"
                                data-cursor="-opaque">Service Detail
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                    <main role="main" class="mt-4 mb-5 container">
                         <div class="row">
                              <!-- Staff Information Column -->
                              <div class="col-md-4">
                                   <div class="info-box">
                                        <h3 class="section-header"><i class="fas fa-user"></i> Staff Information</h3>
                                        <div class="info-item">
                                             <p><strong>Name:</strong> ${serviceDetail.staff.name}</p>
                                        </div>
                                        <div class="info-item">
                                             <p><strong>Phone Number:</strong> ${serviceDetail.staff.phone}</p>
                                        </div>
                                        <div class="info-item">
                                             <p><strong>Email:</strong> ${serviceDetail.staff.email}</p>
                                        </div>
                                        <div class="info-item">
                                             <p><strong>Department:</strong> ${serviceDetail.staff.department}</p>
                                        </div>
                                   </div>
                              </div>

                              <!-- Service Information Column -->
                              <div class="col-md-8">
                                   <div class="info-box">
                                        <h3 class="section-header"><i class="fas fa-info-circle"></i> Service Detail
                                             Information</h3>
                                        <div class="info-item">
                                             <p><strong>Service Name:</strong> ${serviceDetail.service.serviceName}</p>
                                        </div>
                                        <div class="info-item">
                                             <p><strong>Description:</strong>
                                                  ${serviceDetail.service.serviceDescription}</p>
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

                                        <c:if test="${serviceDetail.serviceDetailStatus==3}">
                                             <div class="info-item text-center">

                                                  <button type="button" class="btn rr-btn" data-toggle="modal"
                                                       data-target="#reviewServiceModal">
                                                       <c:choose>
                                                            <c:when test="${not empty serviceDetail.feedback}">
                                                                 Update Feedback
                                                            </c:when>
                                                            <c:otherwise>
                                                                 Write A Feedback
                                                            </c:otherwise>
                                                       </c:choose>
                                                  </button>
                                             </div>
                                        </c:if>
                                   </div>
                              </div>
                         </div>

                         <!-- Modal -->
                         <div class="modal fade" id="reviewServiceModal" tabindex="-1" role="dialog"
                              aria-labelledby="reviewServiceModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-lg modal-lg-custom" role="document">
                                   <div class="modal-content">
                                        <!-- Form for submitting feedback -->
                                        <form action="${pageContext.request.contextPath}/customer/serviceDetail/feedback"
                                             method="POST">
                                             <div class="modal-header">
                                                  <h5 class="modal-title" id="reviewServiceModalLabel">Review Service
                                                  </h5>
                                                  <button type="button" class="close" data-dismiss="modal"
                                                       aria-label="Close">
                                                       <span aria-hidden="true">&times;</span>
                                                  </button>
                                             </div>
                                             <div class="modal-body">
                                                  <h6>Feedback for the Service</h6>

                                                  <!-- Hidden input to store the serviceDetail ID -->
                                                  <input type="hidden" name="serviceDetailId"
                                                       value="${serviceDetail.id}">

                                                  <!-- Star Rating -->
                                                  <div id="star-rating" class="star-rating mb-3">
                                                       <i class="far fa-star" data-value="1"></i>
                                                       <i class="far fa-star" data-value="2"></i>
                                                       <i class="far fa-star" data-value="3"></i>
                                                       <i class="far fa-star" data-value="4"></i>
                                                       <i class="far fa-star" data-value="5"></i>
                                                  </div>
                                                  <input type="hidden" name="rating" id="rating-input" value="0">

                                                  <!-- Feedback Textarea -->
                                                  <div class="form-group">
                                                       <label for="feedback">Review your experience with this
                                                            service</label>
                                                       <textarea class="form-control" id="feedback" name="feedback"
                                                            rows="20" placeholder="Write your review"
                                                            required></textarea>
                                                  </div>
                                             </div>
                                             <div class="modal-footer">
                                                  <button type="button" class="btn rr-btn btn-outline-dark"
                                                       data-dismiss="modal"
                                                       style="background-color: gray;">Cancel</button>

                                                  <button type="submit" class="btn rr-btn">Post Review</button>
                                             </div>
                                        </form>
                                   </div>
                              </div>
                         </div>

                         <!-- Popup -->
                         <%@include file="../../popup.jsp"%>
                    </main>

                    <%@include file="../footer.jsp" %>

                         <!-- JS Scripts -->
                         <%@include file="../scriptTemplate.jsp" %>
                          <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <!-- Load a compatible jQuery version -->
                          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                              <script
                                   src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
                              <script>
                                   $(document).ready(function () {
                                        // Star rating hover logic
                                        $('#star-rating i').on('mouseover', function () {
                                             var value = $(this).data('value');
                                             $('#star-rating i').each(function () {
                                                  if ($(this).data('value') <= value) {
                                                       $(this).removeClass('far').addClass('fas');
                                                  } else {
                                                       $(this).removeClass('fas').addClass('far');
                                                  }
                                             });
                                        });

                                        // When a star is clicked, set the value
                                        $('#star-rating i').on('click', function () {
                                             var value = $(this).data('value');
                                             $('#rating-input').val(value);
                                        });
                                   });
                              </script>
          </body>

          </html>