<!DOCTYPE html>
<html>
<head>
    <title>Create Project</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
<body>

<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">Create New Project</h2>
        
        <!-- Form binding to the project model -->
        <form:form method="POST" modelAttribute="project" action="/manager/project/create">
        
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
</div>

<!-- Bootstrap JS (Optional) -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
