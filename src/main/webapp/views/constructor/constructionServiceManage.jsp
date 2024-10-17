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
          </head>

          <body>

               <div class="container">
                    <header>
                         <div class="nav">
                              <div class="d-flex flex-row">
                                   <a href="${pageContext.request.contextPath}/constructor/manage" class="nav-link">
                                        <i class="fas fa-project-diagram"></i>Projects
                                   </a>
                                   <a href="${pageContext.request.contextPath}/constructor/serviceDetailManage/"
                                        class="nav-link">
                                        <i class="fas fa-project-diagram"></i>Service Details
                                   </a>
                              </div>
                              <input type="text" placeholder="Search..." id="search">

                              <div class="nav-item-group">

                                   <a href="#" class="nav-link">
                                        <i class="fas fa-bell"></i>
                                        <span class="badge badge-danger">3</span>
                                   </a>

                                   <div class="dropdown">
                                        <a href="#" class="nav-link dropdown-toggle d-flex align-items-center"
                                             id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                             aria-expanded="false">
                                             <img src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "
                                                  /assets/imgs/logo/final_resized_colored_logo_image.png"}"
                                                  alt="User Avatar" class="rounded-circle" width="40">
                                             <span class="ml-2 user-name">${sessionScope.user.name}</span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                             <a class="dropdown-item" href="/constructor/profile">Profile</a>
                                             <a class="dropdown-item" href="#" data-toggle="modal"
                                                  data-target="#themeModal">Theme</a>
                                             <div class="dropdown-divider"></div>
                                             <a class="dropdown-item" href="/help">Help</a>
                                             <div class="dropdown-divider"></div>
                                             <a href="/logout" class="dropdown-item btn-logout">
                                                  <i class="fas fa-sign-out-alt"></i> Logout
                                             </a>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </header>
                    <main role="main" class="mt-4 container">
                         <div class="row justify-content-between">
                              <div>
                                   <h2 class="mb-4">Service Detail List</h2>
                              </div>

                              <!-- Filter Card -->
                              <div class="filter-card">
                                   <form method="get" action="/manager/serviceDetails">
                                        <div class="form-row align-items-center">
                                             <!-- Sort By -->
                                             <div class="col-auto">
                                                  <label for="sortBy">Sort by:</label>
                                                  <select name="sortBy" id="sortBy" class="form-control">
                                                       <option value="serviceDetailStatus"
                                                            ${sortBy=='serviceDetailStatus' ? 'selected' : '' }>
                                                            Service Detail Status
                                                       </option>
                                                       <option value="price" ${sortBy=='price' ? 'selected' : '' }>Price
                                                       </option>
                                                       <option value="dateRegister" ${sortBy=='dateRegister'
                                                            ? 'selected' : '' }>
                                                            Date Registered
                                                       </option>
                                                       <option value="rating" ${sortBy=='rating' ? 'selected' : '' }>
                                                            Rating
                                                       </option>
                                                  </select>
                                             </div>

                                             <!-- Sort Direction -->
                                             <div class="col-auto">
                                                  <label for="sortType">Type:</label>
                                                  <select name="sortType" id="sortType" class="form-control">
                                                       <option value="asc" ${sortType=='asc' ? 'selected' : '' }>
                                                            Ascending
                                                       </option>
                                                       <option value="desc" ${sortType=='desc' ? 'selected' : '' }>
                                                            Descending
                                                       </option>
                                                  </select>
                                             </div>

                                             <!-- Filter By Status -->
                                             <div class="col-auto">
                                                  <label for="statusFilter">Status:</label>
                                                  <select name="statusFilter" id="statusFilter" class="form-control">
                                                       <option value="" ${statusFilter==null ? 'selected' : '' }>All
                                                       </option>
                                                       <option value="1" ${statusFilter==1 ? 'selected' : '' }>Pending
                                                       </option>
                                                       <option value="2" ${statusFilter==2 ? 'selected' : '' }>In
                                                            Progress
                                                       </option>
                                                       <option value="3" ${statusFilter==3 ? 'selected' : '' }>Completed
                                                       </option>
                                                       <option value="4" ${statusFilter==4 ? 'selected' : '' }>
                                                            Requesting Cancel
                                                       </option>
                                                       <option value="5" ${statusFilter==4 ? 'selected' : '' }>Cancelled
                                                       </option>
                                                  </select>
                                             </div>

                                             <input type="hidden" name="page" value="${currentPage}">
                                             <div class="col-auto">
                                                  <button type="submit" class="btn btn-primary"
                                                       style="margin-top: 2rem">Apply</button>
                                             </div>
                                        </div>
                                   </form>
                              </div>
                         </div>


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
                                                  <a href="/constructor/serviceDetail/${service.id}"
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
                              <form method="get" action="/constructor/serviceDetailManage/">
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
                              <form method="get" action="/constructor/serviceDetailManage/">
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
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

          </body>

          </html>