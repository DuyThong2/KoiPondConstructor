<%--
    Document   : projectManage
    Created on : Sep 21, 2024, 2:33:13 PM
    Author     : ASUS
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <title>Admin Dashboard - Projects</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
           .sidebar {
               height: 100vh;
               background-color: #343a40;
               color: white;
               position: fixed; /* Makes the sidebar fixed */
               top: 0;
               left: 0;
               width: 200px; /* Fixed width for the sidebar */
               z-index: 1000; /* Ensure it's above other elements */
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

           /* Ensure the main content doesn't overlap the sidebar */
           .main-content {
               margin-left: 200px; /* Matches the sidebar width */
           }

           /* Other styles */
           body {
               background-color: #f7f7f7;
           }

           #main-content {
               background-color: #ffffff;
           }

           .user-info h5 {
               font-size: 14px;
               font-weight: bold;
               margin-bottom: 5px;
           }

           .user-info p {
               font-size: 12px;
               margin-bottom: 15px;
           }

           .btn-danger {
               background-color: #f44336;
               border-color: #f44336;
           }

           .btn-primary {
               background-color: #6c63ff;
               border-color: #6c63ff;
           }

           .project-info {
               background-color: #e0d7ff;
               border-radius: 10px;
           }

           .project-info .info-item p {
               background-color: #e6c6f9;
               padding: 10px;
               border-radius: 10px;
           }

           .project-info textarea {
               background-color: #e6c6f9;
               border-radius: 10px;
           }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav class="col-md-2 d-none d-md-block sidebar">
                    <div class="sidebar-sticky">
                        <h4 class="text-center py-3">Admin Dashboard</h4>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/contracts">Contracts</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/design">Design</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/projects">Projects</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/terms">Terms</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/reports">Reports</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/settings">Settings</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div id="top-bar" class="d-flex justify-content-between align-items-center p-3 bg-light">
                           <h3 class="ms-3">My Projects</h3>
                           <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger me-3">Logout</a>
                       </div>

                       <div class="container-fluid">
                           <div class="row mt-4">
                               <!-- Sidebar -->
                               <div class="col-md-3 p-4" id="sidebar">
                                   <div class="text-center">
                                       <img src="${pageContext.request.contextPath}/images/avatar.png" alt="Avatar" class="img-fluid rounded-circle mb-3" style="width: 150px;">
                                       <div class="user-info mb-4">
                                           <h5>Name</h5>
                                           <p>${customer.username}</p>
                                           <h5>Phone Number</h5>
                                           <p>${customer.customerPhone}</p>
                                           <h5>Email</h5>
                                           <p>${customer.customerEmail}</p>
                                       </div>
                                       <a href="#" class="btn btn-danger w-100 mb-3">Design Status</a>
                                       <a href="#" class="btn btn-primary w-100">To Design</a>
                                   </div>
                               </div>

                               <!-- Main Content -->
                               <div class="col-md-9 p-4" id="main-content">
                                   <div class="project-info p-4 bg-light rounded">
                                       <h4>Project Information</h4>

                                       <!-- Start Form -->
                                       <form:form method="post" modelAttribute="project" enctype="multipart/form-data">
                                           <div class="info-item">
                                               <p><strong>Project Name:</strong> ${project.projectName}</p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Address:</strong> ${project.address}</p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Design Aesthetic:</strong> ${project.style}</p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Description:</strong> ${project.description}</p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Start Date:</strong> ${project.dateStart}</p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>End Date:</strong>
                                                  <c:choose>
                                                     <c:when test="${empty project.dateEnd}">
                                                        Not yet
                                                     </c:when>
                                                     <c:otherwise>
                                                        ${project.dateEnd}
                                                     </c:otherwise>
                                                  </c:choose>
                                               </p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Project Status:</strong>
                                                  <c:choose>
                                                     <c:when test="${project.status == 1}">Pending</c:when>
                                                     <c:when test="${project.status == 2}">Processing</c:when>
                                                     <c:when test="${project.status == 3}">Completed</c:when>
                                                     <c:when test="${project.status == 4}">Canceled</c:when>
                                                  </c:choose>
                                               </p>
                                           </div>
                                           <div class="info-item">
                                              <p><strong>Stage:</strong>
                                                 <c:choose>
                                                    <c:when test="${project.stage == 1}">Planning</c:when>
                                                    <c:when test="${project.stage == 2}">Design</c:when>
                                                    <c:when test="${project.stage == 3}">Construction</c:when>
                                                    <c:when test="${project.stage == 4}">Maintenance</c:when>
                                                    <c:when test="${project.stage == 5}">Finish</c:when>
                                                 </c:choose>
                                              </p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Is Shareable:</strong> ${project.isSharedAble}</p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Location:</strong> <a href="${project.imgURL}">Link to Picture</a></p>
                                           </div>
                                           <div class="info-item">
                                               <p><strong>Note:</strong></p>
                                               <textarea class="form-control" name="description" rows="3">${project.description}</textarea>
                                           </div>
                                           <div class="info-item mt-3">
                                               <label for="sketch-upload" class="form-label"><strong>Concept Sketch Upload:</strong></label>
                                               <input type="file" class="form-control" id="sketch-upload" name="sketchUpload">
                                           </div>
                                           <div class="mt-3">
                                               <button type="submit" class="btn btn-danger">Update</button>
                                           </div>
                                       </form:form>
                                       <!-- End Form -->
                                   </div>
                               </div>
                           </div>
                       </div>
                </main>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
