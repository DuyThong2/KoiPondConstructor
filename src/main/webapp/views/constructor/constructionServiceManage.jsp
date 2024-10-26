<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
               <meta charset="UTF-8">
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
               <title>Construction Manage</title>
               <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
               <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
               <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
               <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
          </head>

          <body>

               <div class="container">
                    <%@include file="navbarConstruction.jsp" %>


                         <!-- Service Detail Table -->
                         <table class="table table-bordered table-hover">
                              <thead class="thead-dark">
                                   <tr>
                                        <th>Service ID</th>
                                        <th>Service Name</th>
                                        <th>Pricing</th>
                                        <th>Date Register</th>
                                        <th>Status</th>
                                        <th>More</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:forEach var="service" items="${serviceDetailsList}">
                                        <!-- Main Service Row -->
                                        <tr onclick="toggleDetails(${service.id})">
                                             <td>${service.id}</td>
                                             <td>${service.service.serviceName}</td>
                                             <td>${service.price}</td>
                                             <td>${service.dateRegister}</td>

                                             <td>
                                                  <c:choose>
                                                       <c:when test="${service.serviceDetailStatus == 1}">
                                                            <span class="badge badge-secondary">Pending</span>
                                                       </c:when>
                                                       <c:when test="${service.serviceDetailStatus == 2}">
                                                            <span class="badge badge-primary">Processing</span>
                                                       </c:when>
                                                       <c:when test="${service.serviceDetailStatus == 3}">
                                                            <span class="badge badge-success">Completed</span>
                                                       </c:when>
                                                       <c:when test="${service.serviceDetailStatus == 4}">
                                                            <span class="badge badge-warning">Requesting Cancel</span>
                                                       </c:when>
                                                       <c:when test="${service.serviceDetailStatus == 5}">
                                                            <span class="badge badge-danger">Canceled</span>
                                                       </c:when>
                                                  </c:choose>

                                             </td>
                                             <td>
                                                  <a href="${pageContext.request.contextPath}/constructor/serviceDetail/${service.id}"
                                                       class="btn btn-warning">Manage</a>
                                             </td>
                                        </tr>

                                        <!-- Collapsible Row for Customer and Staff Information -->

                                   </c:forEach>
                                   <c:if test="${empty serviceDetailsList}">
                                        <tr>
                                             <td colspan="6" class="text-center">No services available</td>
                                        </tr>
                                   </c:if>
                              </tbody>
                         </table>
                         <!-- Pagination Controls -->
                         <div class="d-flex justify-content-center align-items-center mt-4">
                              <!-- Previous Button -->
                              <form method="get" action="${pageContext.request.contextPath}/constructor/serviceDetailManage/">
                                   <button class="btn btn-primary mx-3" type="submit" <c:if test="${currentPage == 1}">
                                        disabled
                                        </c:if>> < </button>
                                             <input type="hidden" name="page" value="${currentPage - 1}">
                                             <input type="hidden" name="size" value="${size}">
                                             <input type="hidden" name="sortBy" value="${sortBy}">
                                             <input type="hidden" name="sortType" value="${sortType}">
                                             <!-- Pass the statusFilter if it is set -->
                                             <c:if test="${statusFilter != null}">
                                                  <input type="hidden" name="statusFilter" value="${statusFilter}">
                                             </c:if>
                              </form>

                              <!-- Page Number Display -->
                              <span>Page <strong>${currentPage}</strong> of <strong>${totalPage}</strong></span>

                              <!-- Next Button -->
                              <form method="get" action="${pageContext.request.contextPath}/constructor/serviceDetailManage/">
                                   <button class="btn btn-primary mx-3" type="submit" <c:if
                                        test="${currentPage == totalPage}">
                                        disabled
                                        </c:if>> > </button>
                                   <input type="hidden" name="page" value="${currentPage + 1}">
                                   <input type="hidden" name="size" value="${size}">
                                   <input type="hidden" name="sortBy" value="${sortBy}">
                                   <input type="hidden" name="sortType" value="${sortType}">
                                   <!-- Pass the statusFilter if it is set -->
                                   <c:if test="${statusFilter != null}">
                                        <input type="hidden" name="statusFilter" value="${statusFilter}">
                                   </c:if>
                              </form>
                         </div>


                         </main>


                         <script>
                              // JavaScript for handling search
                              document.getElementById('search').addEventListener('input', function () {
                                   // Handle search functionality
                              });
                         </script>
                         <!-- jQuery -->
                        
                         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

          </body>

          </html>