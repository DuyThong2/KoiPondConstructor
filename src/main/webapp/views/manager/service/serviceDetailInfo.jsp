<%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
               <meta charset="UTF-8">
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
               <title>Service Detail Information</title>
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

                    .status-badge {
                         font-size: 1rem;
                         padding: 8px 15px;
                         text-transform: uppercase;
                         border-radius: 12px;
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

                    .action-buttons {
                         display: flex;
                         justify-content: center;
                         gap: 15px;
                    }
               </style>
          </head>

          <body>
               <div class="container-fluid mt-5">
                    <div class="row">
                         <%@include file="../navBar.jsp" %>
                              <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                                   <!-- Service Detail Section -->
                                   <div class="section-card">
                                        <h2 class="section-header"><i class="fas fa-info-circle"></i> Service Detail
                                             Information</h2>
                                        <table class="table table-striped">
                                             <tr>
                                                  <th>Service Detail ID</th>
                                                  <td>${serviceDetail.id}</td>
                                             </tr>
                                             <tr>
                                                  <th>Service Name</th>
                                                  <td>${serviceDetail.service.serviceName}</td>
                                             </tr>
                                             <tr>
                                                  <th>Service Description</th>
                                                  <td>${serviceDetail.service.serviceDescription}</td>
                                             </tr>
                                             <tr>
                                                  <th>Service Status</th>
                                                  <td>
                                                       <c:choose>
                                                            <c:when test="${serviceDetail.serviceDetailStatus == 1}">
                                                                 <span class="badge badge-secondary">Pending</span>
                                                            </c:when>
                                                            <c:when test="${serviceDetail.serviceDetailStatus == 2}">
                                                                 <span class="badge badge-primary">Processing</span>
                                                            </c:when>
                                                            <c:when test="${serviceDetail.serviceDetailStatus == 3}">
                                                                 <span class="badge badge-success">Completed</span>
                                                            </c:when>
                                                            <c:when test="${serviceDetail.serviceDetailStatus == 4}">
                                                                 <span class="badge badge-warning">Requesting
                                                                      Cancel</span>
                                                            </c:when>
                                                            <c:when test="${serviceDetail.serviceDetailStatus == 5}">
                                                                 <span class="badge badge-danger">Canceled</span>
                                                            </c:when>
                                                       </c:choose>
                                                  </td>
                                             </tr>
                                             <tr>
                                                  <th>Price</th>
                                                  <td>${serviceDetail.price}</td>
                                             </tr>
                                        </table>
                                   </div>

                                   <div class="row">
                                        <!-- Staff Details Section -->
                                        <div class="col-md-6">
                                             <div class="section-card">
                                                  <h4 class="section-header"><i class="fas fa-user-tie"></i> Associated
                                                       Staff</h4>
                                                  <c:if test="${not empty staff}">
                                                       <table class="table table-hover">
                                                            <tr>
                                                                 <th>Staff Name</th>
                                                                 <td>${staff.name}</td>
                                                            </tr>
                                                            <tr>
                                                                 <th>Staff Email</th>
                                                                 <td>${staff.email}</td>
                                                            </tr>
                                                            <tr>
                                                                 <th>Staff Phone</th>
                                                                 <td>${staff.phone}</td>
                                                            </tr>

                                                       </table>
                                                       <div class="row justify-content-around">
                                                            <button class="btn btn-info"
                                                                 onclick="window.location.href = '${pageContext.request.contextPath}/manager/manageStaff/detail/${staff.id}'">
                                                                 Staff Details
                                                            </button>
                                                            <a href="${pageContext.request.contextPath}/manager/serviceDetails/assign/${serviceDetail.id}"
                                                                 class="btn btn-warning">Edit Staff</a>
                                                       </div>
                                                  </c:if>
                                                  <c:if test="${empty staff}">
                                                       <p class="text-muted">No staff is associated with this service
                                                            detail.</p>
                                                  </c:if>
                                             </div>
                                        </div>

                                        <!-- Customer Details Section -->
                                        <div class="col-md-6">
                                             <div class="section-card">
                                                  <h4 class="section-header"><i class="fas fa-user"></i> Associated
                                                       Customer</h4>
                                                  <c:if test="${not empty customer}">
                                                       <table class="table table-hover">
                                                            <tr>
                                                                 <th>Customer Name</th>
                                                                 <td>${customer.name}</td>
                                                            </tr>
                                                            <tr>
                                                                 <th>Customer Email</th>
                                                                 <td>${customer.email}</td>
                                                            </tr>
                                                            <tr>
                                                                 <th>Customer Phone</th>
                                                                 <td>${customer.phone}</td>
                                                            </tr>
                                                       </table>
                                                       <div class="row justify-content-center">
                                                            <td>
                                                                 <button class="btn btn-info"
                                                                      onclick="window.location.href = '${pageContext.request.contextPath}/manager/manageCustomer/detail/${customer.id}'">
                                                                      Customer Details
                                                                 </button>
                                                            </td>
                                                       </div>
                                                  </c:if>
                                                  <c:if test="${empty customer}">
                                                       <p class="text-muted">No customer is associated with this service
                                                            detail.</p>
                                                  </c:if>
                                             </div>
                                        </div>
                                   </div>
                              </main>
                    </div>
               </div>

               <!-- Bootstrap JS and dependencies -->
               <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
               <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
               <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
          </body>

          </html>