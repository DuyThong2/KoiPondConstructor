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
          <%@include file="navbarConsultruction.jsp" %>



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