<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Project</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
    <style>
        .form-label {
            font-weight: bold;
        }
        .form-container {
            margin: 50px auto;
            padding: 20px;
            max-width: 700px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<div style="height:6vh;"></div>
<body>

<div class="container-fluid">
    <div class="row">
        <%@include file="../navBar.jsp" %>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="form-container">
                <h2 class="text-center mb-4">Create New Project</h2>

                <!-- Form binding to the project model -->
                <form:form method="POST" modelAttribute="project" action="${pageContext.request.contextPath}/manager/project/create">

                    <form:hidden path="contract.contractId" value="${contract.contractId}"/>
                    <!-- Project Name -->
                    <div class="form-group">
                        <label for="projectName" class="form-label">Project Name</label>
                        <form:input path="projectName" id="projectName" class="form-control" placeholder="Enter project name"/>
                    </div>

                    <!-- Address -->
                    <div class="form-group">
                        <label for="address" class="form-label">Address</label>
                        <form:input path="address" id="address" class="form-control" placeholder="Enter address" />
                    </div>

                    <!-- Style -->
                    <div class="form-group">
                        <label for="style" class="form-label">Style</label>
                        <form:input path="style" id="style" class="form-control" placeholder="Enter project style" />
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label for="description" class="form-label">Description</label>
                        <form:textarea path="description" id="description" class="form-control" placeholder="Enter project description" />
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary btn-block" value="Save Project" />
                    </div>

                </form:form>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
