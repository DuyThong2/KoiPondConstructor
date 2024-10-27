<%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
               <meta charset="UTF-8">
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
               <title>Service Details</title>
               <!-- Bootstrap CSS -->
               <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
               <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
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

                    .table th,
                    .table td {
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
                    }
               </style>


          </head>



          <body>
               <div class="container-fluid mt-5">
                    <div class="row">
                         <!-- Include Navbar -->
                         <%@include file="../navBar.jsp" %>

                              <!-- Main content -->
                              <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                                   <!-- Service Information Section -->
                                   <div class="section-card">
                                        <h2 class="section-header"><i class="fas fa-cogs"></i> Service Information</h2>
                                        <table class="table table-striped">
                                             <tr>
                                                  <th>Service ID</th>
                                                  <td>${service.serviceId}</td>
                                             </tr>
                                             <tr>
                                                  <th>Service Name</th>
                                                  <td>${service.serviceName}</td>
                                             </tr>
                                             <tr>
                                                  <th>Description</th>
                                                  <td>${service.serviceDescription}</td>
                                             </tr>
                                             <tr>
                                                  <th>Status</th>
                                                  <td>
                                                       <c:choose>
                                                            <c:when test="${service.serviceStatus}">
                                                                 <span class="badge badge-success">Active</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                 <span class="badge badge-danger">Inactive</span>
                                                            </c:otherwise>
                                                       </c:choose>
                                                  </td>
                                             </tr>
                                        </table>
                                        <button class="btn btn-primary" id="updateServiceBtn">Update
                                             Service</button>

                                   </div>

                                   <!-- Price List Section -->
                                   <div class="section-card">
                                        <h4 class="section-header"><i class="fas fa-dollar-sign"></i> Price List</h4>
                                        <c:if test="${not empty service.servicePrice}">
                                             <div style="max-height: 300px; overflow-y: auto;">
                                                  <table class="table table-bordered">
                                                       <thead>
                                                            <tr>
                                                                 <th>Price ID</th>
                                                                 <th>Value</th>
                                                                 <th>Date Apply</th>
                                                                 <th>Status</th>
                                                            </tr>
                                                       </thead>
                                                       <tbody>
                                                            <c:forEach var="price" items="${service.servicePrice}">
                                                                 <tr>
                                                                      <td>${price.servicePriceId}</td>
                                                                      <td>${price.value}</td>
                                                                      <td>${price.dateApply}</td>
                                                                      <td>
                                                                           <c:choose>
                                                                                <c:when
                                                                                     test="${price.servicePriceStatus}">
                                                                                     <span
                                                                                          class="badge badge-success">Active</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                     <span
                                                                                          class="badge badge-secondary">Inactive</span>
                                                                                </c:otherwise>
                                                                           </c:choose>
                                                                      </td>
                                                                 </tr>
                                                            </c:forEach>
                                                       </tbody>
                                                  </table>
                                             </div>
                                        </c:if>
                                        <c:if test="${empty service.servicePrice}">
                                             <p class="text-muted">No price information available for this service.</p>
                                        </c:if>
                                   </div>

                                   <!-- Service Content Section -->
                                   <div class="section-card">
                                        <h4 class="section-header"><i class="fas fa-file-alt"></i> Service Content</h4>
                                        <button class="btn btn-success"
                                             onclick="window.location.href='${pageContext.request.contextPath}/manager/serviceContent/updateDetail/${service.serviceId}'">Update
                                             Content</button>

                                        <c:if test="${not empty service.content}">
                                             <div>

                                                  <div class="content-item">
                                                       <p>${service.content.content}</p>
                                                  </div>

                                             </div>
                                        </c:if>
                                        <c:if test="${empty service.content}">
                                             <p class="text-muted">No content available for this service.</p>
                                        </c:if>
                                   </div>
                                   <div id="updateServiceModal" class="modal fade" tabindex="-1" role="dialog"
                                        aria-labelledby="updateServiceModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document" style="max-width: 70%;">
                                             <div class="modal-content">
                                                  <div class="modal-header">
                                                       <h5 class="modal-title" id="updateServiceModalLabel">Update
                                                            Service</h5>
                                                       <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                       </button>
                                                  </div>
                                                  <form method="POST"
                                                       action="${pageContext.request.contextPath}/manager/services/update"
                                                       enctype="multipart/form-data">
                                                       <div class="modal-body"
                                                            style="max-height: calc(100vh - 150px); overflow-y: auto;">
                                                            <input type="hidden" id="updateServiceId" name="serviceId"
                                                                 value="${service.serviceId}">
                                                            <div class="form-group">
                                                                 <label for="updateServiceName">Service Name</label>
                                                                 <input type="text" class="form-control"
                                                                      id="updateServiceName" name="serviceName"
                                                                      required>
                                                            </div>
                                                            <div class="form-group">
                                                                 <label for="updateServiceDescription">Service
                                                                      Description</label>
                                                                 <textarea class="form-control"
                                                                      id="updateServiceDescription"
                                                                      name="serviceDescription" rows="3"
                                                                      required></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                 <label for="file">Upload Image</label>
                                                                 <input type="file" accept="image/*" id="file"
                                                                      name="file" class="form-control-file">
                                                            </div>
                                                            <div class="form-group">
                                                                 <label for="updateServicePriceValue">Price
                                                                      Value</label>
                                                                 <input type="number" class="form-control"
                                                                      id="updateServicePriceValue"
                                                                      name="servicePriceValue" step="0.01" required>
                                                            </div>
                                                       </div>
                                                       <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                 data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Update
                                                                 Service</button>
                                                       </div>
                                                  </form>
                                             </div>
                                        </div>
                                   </div>
                              </main>
                    </div>
               </div>
               </main>
               </div>
               </div>
               <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
               <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
          </body>
          <script>
               var serviceName = "${service.serviceName}";
               var serviceDescription = "${service.serviceDescription}";
               var servicePriceValue = "${service.servicePrice[0].value}";
               $("#updateServiceBtn").click(function () {

                    // Set the values to the form fields in the modal
                    document.getElementById('updateServiceName').value = serviceName;
                    document.getElementById('updateServiceDescription').value = serviceDescription;
                    document.getElementById('updateServicePriceValue').value = servicePriceValue;

                    // Show the modal using jQuery or Bootstrap's modal function
                    $('#updateServiceModal').modal('show');
               });
          </script>
          <!-- Update Service Modal -->

          </body>
          <!-- Bootstrap JS and dependencies -->


          </html>