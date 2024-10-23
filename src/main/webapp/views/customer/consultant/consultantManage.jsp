<%-- 
    Document   : consultantManage
    Created on : Oct 20, 2024, 2:15:13 PM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
          <!DOCTYPE html>
          <html>

          <head>
               <title>My Consultant</title>
               <%@include file="../cssTemplate.jsp" %>
                    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                         rel="stylesheet" />
                    <link rel="stylesheet"
                         href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
                    <link href="<c:url value='/css/profile.css'/>" rel="stylesheet" />
                    <style>
                         @media (min-width: 992px) {
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
                         }

                         .view-account .side-bar .user-info .meta li span {
                              display: inline-block;
                              width: 150px;
                              margin-right: 5px;
                              text-align: right;
                         }

                         .btn-default {
                              padding: 10px 17px;
                              font-size: 13px;
                              border-radius: 10px;
                         }

                         .row {
                              margin-right: -190px;
                              margin-left: -15px;
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
                         }

                         /* Filter Card */
                         .filter-card {
                              background-color: #f9f9f9;
                              border: 1px solid #e1e1e1;
                              padding: 15px;
                              border-radius: 8px;
                              margin-bottom: 20px;
                         }

                         .filter-card label {
                              font-weight: bold;
                              color: #555;
                         }

                         .filter-card .form-control {
                              border-radius: 6px;
                              padding: 8px;
                         }

                         .filter-card button {
                              margin-top: 10px;
                              padding: 10px 20px;
                              background-color: #3498db;
                              border: none;
                              color: white;
                              border-radius: 6px;
                              transition: background-color 0.3s ease;
                         }

                         .filter-card button:hover {
                              background-color: #2980b9;
                         }

                         /* Table Styling */
                         .table {
                              margin-top: 20px;
                              border-collapse: collapse;
                              width: 100%;
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

                         .badge {
                              font-size: 12px;
                              padding: 5px 10px;
                         }

                         .btn-info {
                              background-color: #3498db;
                              border: none;
                              padding: 8px 15px;
                              color: white;
                              border-radius: 5px;
                              transition: background-color 0.3s ease;
                         }

                         .btn-info:hover {
                              background-color: #2980b9;
                         }

                         .pagination-controls button {
                              padding: 10px 20px;
                              background-color: #3498db;
                              border: none;
                              color: white;
                              border-radius: 6px;
                              transition: background-color 0.3s ease;
                         }

                         .pagination-controls button:hover {
                              background-color: #2980b9;
                         }

                         .pagination-controls span {
                              font-weight: bold;
                         }

                         @media (min-width: 1200px) {
                              .container {
                                   width: 1400px;
                              }
                         }
                    </style>
          </head>
          <%@include file="../homePageNavbar.jsp" %>

               <body>
                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
                         rel="stylesheet" />
                    <div class="container mt-5">
                         <div class="view-account">
                              <section class="module">
                                   <div class="module-inner">
                                        <div class="side-bar">
                                             <div class="user-info">
                                                  <img class="img-profile img-circle img-responsive center-block"
                                                       src= "${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiContructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt />
                                                  <ul class="meta list list-unstyled">
                                                       <li class="name" style="font-size: 18px;">${user.name}
                                                            <br>
                                                            <label class="label label-info">Customer</label>
                                                       </li>
                                                       <li class="email" style="font-size: 17px;">
                                                            <a href="#"><span>${user.email}</span></a>
                                                       </li>
                                                  </ul>
                                             </div>
                                             <nav class="side-menu">
                                                  <nav class="side-menu">
                                                       <ul class="nav">
                                                            <li>
                                                                 <a href="${pageContext.request.contextPath}/customer/profile"
                                                                      style="font-size: 16px"><span
                                                                           class="fa fa-user"></span> Profile</a>
                                                            </li>
                                                            <li class="active">
                                                                 <a href="${pageContext.request.contextPath}/customer/consultant"
                                                                      style="font-size: 16px">
                                                                      <span class="bi bi-briefcase"></span> My
                                                                      Consultant</a>
                                                            </li>
                                                            <li>
                                                                 <a href="${pageContext.request.contextPath}/customer/contract"
                                                                      style="font-size: 16px">
                                                                      <span class="fas fa-file-contract"></span> My
                                                                      Contract</a>
                                                            </li>
                                                              <li>
                                                                 <a href="${pageContext.request.contextPath}/customer/projects/"
                                                                      style="font-size: 16px">
                                                                      <span class="fas fa-project-diagram"></span> My
                                                                      Project</a>
                                                            </li>
                                                            <li>
                                                                 <a href="${pageContext.request.contextPath}/customer/quote"
                                                                      style="font-size: 16px">
                                                                      <i class="bi bi-file-earmark-text"></i> Quotes</a>
                                                            </li>
                                                          
                                                            <li>
                                                                 <a href="${pageContext.request.contextPath}/customer/serviceDetails/"
                                                                      style="font-size: 16px">
                                                                      <span class="bi bi-bar-chart-line"></span>
                                                                      Service</a>
                                                            </li>
                                                       </ul>
                                                  </nav>
                                             </nav>
                                        </div>
                                        <div class="content-panel">

                                             <div class="row">
                                                  <main role="main" class="col-md-9 ml-sm-auto col-lg-10 mt-4">
                                                       <h2 class="mb-4">Consultant List</h2>

                                                       <!-- Filter Card -->
                                                       <div class="filter-card">
                                                            <form method="get" action="${pageContext.request.contextPath}/customer/consultant">
                                                                 <div class="form-row align-items-center">
                                                                      <!-- Sort By -->
                                                                      <div class="col-auto">
                                                                           <label for="sortBy">Sort by:</label>
                                                                           <select name="sortBy" id="sortBy"
                                                                                class="form-control"
                                                                                size="padding: 20px">
                                                                                <option value="consultantDateTime"
                                                                                     ${sortBy=='consultantDateTime'
                                                                                     ? 'selected' : '' }>Consultant Date
                                                                                </option>
                                                                                <option value="consultantType" ${sortBy=='consultantType'
                                                                                     ? 'selected' : '' }>Consultant Type
                                                                                </option>
                                                                                <option value="consultantStatus"
                                                                                     ${sortBy=='consultantStatus'
                                                                                     ? 'selected' : '' }>
                                                                                     Consultant Status
                                                                                </option>
                                                                           </select>
                                                                      </div>

                                                                      <!-- Sort Direction -->
                                                                      <div class="col-auto">
                                                                           <label for="sortDirection">Sort Direction: </label>
                                                                           <select name="sortDirection" id="sortDirection"
                                                                                class="form-control"
                                                                                size="padding: 20px">
                                                                                <option value="asc" ${sortDirection=='asc'
                                                                                     ? 'selected' : '' }>Ascending
                                                                                </option>
                                                                                <option value="desc" ${sortDirection=='desc'
                                                                                     ? 'selected' : '' }>Descending
                                                                                </option>
                                                                           </select>
                                                                      </div>

                                                                      <!-- Filter By Status -->
                                                                      <div class="col-auto">
                                                                           <label for="statusFilter">Status:</label>
                                                                           <select name="statusFilter" id="statusFilter"
                                                                                class="form-control"
                                                                                size="padding: 20px">
                                                                                <option value="" ${statusFilter==null
                                                                                     ? 'selected' : '' }>All
                                                                                </option>
                                                                                <option value="1" ${statusFilter==1
                                                                                     ? 'selected' : '' }>Pending
                                                                                </option>
                                                                                <option value="2" ${statusFilter==2
                                                                                     ? 'selected' : '' }>Staff Assigned
                                                                                </option>
                                                                                <option value="3" ${statusFilter==3
                                                                                     ? 'selected' : '' }>In-Progress
                                                                                </option>
                                                                                <option value="4" ${statusFilter==4
                                                                                     ? 'selected' : '' }>Completed
                                                                                </option>
                                                                                <option value="5" ${statusFilter==5
                                                                                     ? 'selected' : '' }>Cancel
                                                                                </option>
                                                                           </select>
                                                                      </div>

                                                                      <input type="hidden" name="page"
                                                                           value="${currentPage}">
                                                                      <div class="col-auto">
                                                                           <button type="submit"
                                                                                class="btn btn-default btn-primary"
                                                                                style="margin-top: 1rem">Apply</button>
                                                                      </div>
                                                                 </div>
                                                            </form>
                                                       </div>

                                                       <!-- Service Detail Table -->
                                                       <table class="table table-bordered table-hover mt-3">
                                                            <thead class="thead-dark">
                                                                 <tr>
                                                                      <th>Consultant ID</th>
                                                                      <th>Date</th>
                                                                      <th>Consultant Type</th>
                                                                      <th>Consultant Status</th>
                                                                      <th>Staff Assigned Name</th>
                                                                      <th>Action</th>
                                                                 </tr>
                                                            </thead>
                                                            <tbody>
                                                                 <c:forEach var="consultant" items="${consultant}">
                                                                      <!-- Main Service Row -->
                                                                      <tr>
                                                                           <td>${consultant.consultantId}</td>
                                                                           <td><fmt:formatDate value="${consultant.consultantDateTime.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                                           <td>${consultant.consultantType}</td>
                                                                           <td>
                                                                                <c:choose>
                                                                                     <c:when
                                                                                          test="${consultant.consultantStatus == 1}">
                                                                                          <span
                                                                                               class="badge badge-secondary">Pending</span>
                                                                                     </c:when>
                                                                                     <c:when
                                                                                          test="${consultant.consultantStatus == 2}">
                                                                                          <span
                                                                                               class="badge badge-primary">Staff Assigned</span>
                                                                                     </c:when>
                                                                                     <c:when
                                                                                          test="${consultant.consultantStatus == 3}">
                                                                                          <span
                                                                                               class="badge badge-success">In-Progress</span>
                                                                                     </c:when>
                                                                                     <c:when
                                                                                          test="${consultant.consultantStatus == 4}">
                                                                                          <span
                                                                                               class="badge badge-warning">Complete</span>
                                                                                          
                                                                                     </c:when>
                                                                                     <c:when
                                                                                          test="${consultant.consultantStatus == 5}">
                                                                                          <span
                                                                                               class="badge badge-danger">Canceled</span>
                                                                                     </c:when>
                                                                                </c:choose>
                                                                           </td>
                                                                           <td>
                                                                               <c:choose> 
                                                                                   <c:when test="${consultant.staff != null}"> ${consultant.staff.name}</c:when>
                                                                                   <c:otherwise>No Staff Available Yet</c:otherwise>
                                                                               </c:choose>
                                                                               
                                                                           </td>
                                                                           <td>
                                                                               <c:if test="${consultant.consultantStatus < 4}">
                                                                                   <form method="get" action="${pageContext.request.contextPath}/customer/consultant/updateStatus">
                                                                                       <input type="hidden" name="consultantId" value="${consultant.consultantId}">
                                                                                       <input type="hidden" name="statusId" value="${5}">
                                                                                       <button type="submit" class="btn btn-danger">Cancel</button>
                                                                                   </form>
                                                                               </c:if>
                                                                           </td>
                                                                      </tr>

                                                                      <!-- Collapsible Row for Customer and Staff Information -->

                                                                 </c:forEach>
                                                                 <c:if test="${empty consultant}">
                                                                      <tr>
                                                                           <td colspan="6" class="text-center">No
                                                                                Consultant Available
                                                                           </td>
                                                                      </tr>
                                                                 </c:if>
                                                            </tbody>
                                                       </table>
                                                       <!-- Pagination Controls -->

                                                       <div
                                                            class="d-flex  justify-content-between align-items-center mt-4">
                                                            <c:if test="${currentPage != 1}">

                                                                 <form method="get" action="${pageContext.request.contextPath}/customer/serviceDetails/">
                                                                      <button class="btn btn-primary" type="submit">
                                                                           < </button>
                                                                                <input type="hidden" name="page"
                                                                                     value="${currentPage - 1}">
                                                                                <input type="hidden" name="size"
                                                                                     value="${size}">
                                                                                <input type="hidden" name="sortBy"
                                                                                     value="${sortBy}">
                                                                                <input type="hidden" name="sortType"
                                                                                     value="${sortType}">
                                                                                <c:if test="${statusFilter != null}">
                                                                                     <input type="hidden"
                                                                                          name="statusFilter"
                                                                                          value="${statusFilter}">
                                                                                </c:if>
                                                                 </form>

                                                            </c:if>


                                                            <span>Page <strong>${currentPage}</strong> of
                                                                 <strong>${totalPage}</strong></span>


                                                            <c:if test="${currentPage != totalPage}">

                                                                 <form method="get" action="${pageContext.request.contextPath}/customer/serviceDetails/">
                                                                      <button class="btn btn-primary"
                                                                           type="submit">></button>
                                                                      <input type="hidden" name="page"
                                                                           value="${currentPage + 1}">
                                                                      <input type="hidden" name="size" value="${size}">
                                                                      <input type="hidden" name="sortBy"
                                                                           value="${sortBy}">
                                                                      <input type="hidden" name="sortType"
                                                                           value="${sortType}">
                                                                      <c:if test="${statusFilter != null}">
                                                                           <input type="hidden" name="statusFilter"
                                                                                value="${statusFilter}">
                                                                      </c:if>
                                                                 </form>

                                                            </c:if>
                                                       </div>
                                                  </main>
                                             </div>
                                        </div>
                                   </div>

                              </section>
                         </div>
                    </div>
               </body>
               <script>
                    var currentDetailsRow = null;



               </script>

               <%@include file="../spacing.jsp" %>
                    <%@include file="../footer.jsp" %>
                         <%@include file="../scriptTemplate.jsp" %>

          </html>