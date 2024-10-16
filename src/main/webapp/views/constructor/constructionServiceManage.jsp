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
                    <a href="${pageContext.request.contextPath}/constructor/manage" class="nav-link">
                         <i class="fas fa-project-diagram"></i> My Projects
                    </a>
                    <a href="${pageContext.request.contextPath}/constructor/serviceDetailManage" class="nav-link">
                         <i class="fas fa-project-diagram"></i> My Service Details
                    </a>

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