<%-- 
    Document   : consultantManage
    Created on : Sep 20, 2024, 10:06:00 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contract Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Contract Details</h2>
    <c:forEach items = "${consultants}" var="item" >
        <h1> ${item.consultantDateTime}</h1>
    
    </c:forEach>
</div>
    
</body>
</html>