<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Blueprints</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="<c:url value='/css/designer/designerStyle.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/consultant/consultantNav.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Arial', sans-serif;
        }

        .page-header {
            padding: 20px;
            margin-bottom: 30px;
            background-color: #fff;
            color: white;
            text-align: center;
            border-radius: 8px;
        }

        .page-header h2 {
            font-size: 2.2rem;
            font-weight: bold;
            margin: 0;
        }

        .upload-section, .blueprint-gallery {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h3 {
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #007bff;
        }

        .drop-zone {
            border: 2px dashed #007bff;
            padding: 50px;
            text-align: center;
            font-size: 1.2rem;
            color: #6c757d;
            border-radius: 10px;
            transition: border-color 0.3s ease;
        }

        .drop-zone:hover {
            border-color: #0056b3;
        }

        .drop-zone input {
            display: none;
        }

        .drop-zone.dragover {
            border-color: #0056b3;
            background-color: #e9ecef;
        }

        .preview-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
            align-items: center;
        }

        .preview {
            border: 1px solid #dee2e6;
            padding: 10px;
            border-radius: 5px;
            width: 30%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .preview img {
            max-width: 100%;
            border-radius: 5px;
        }

        .btn {
            font-size: 1rem;
            padding: 12px;
            width: 100%;
            max-width: 250px;
            margin: 20px 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            width: 130px;
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }
        .blueprint-gallery .col-md-4 {
            margin-bottom: 30px;
        }

        .blueprint-gallery .card {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-radius: 10px;
            overflow: hidden;
        }

        .blueprint-gallery .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .blueprint-gallery .card-img-top {
            height: 220px;
            object-fit: cover;
        }

        .progress-bar {
            width: 0;
            height: 5px;
            background-color: #007bff;
            transition: width 0.3s;
        }

        /* Avatar and notification styles for header */
        .nav-link .user-name {
            margin-left: 10px;
            color: #fff;
        }

        .badge {
            background-color: #dc3545;
        }
        .blueprint-gallery .blueprint-card {
            transition: all 0.3s ease-in-out;
            border-radius: 10px;
        }

        .blueprint-gallery .blueprint-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .feedback-section {
            margin-top: 20px;
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .feedback-item {
            margin-bottom: 15px;
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 10px;
        }

        .feedback-item:last-child {
            border-bottom: none;
        }
    </style>
</head>

<body>
<div class="container">
    <%@include file="navbarDesign.jsp" %>

    <div class="container-fluid mt-3">
        <!-- Page Header with Back Button -->
        <div class="page-header text-center text-muted ">
            <h2>Manage Blueprints for: ${designStage.designStageName}</h2>
        </div>

        <!-- Existing Blueprints Section -->
        <div class="blueprint-gallery">
            <h3>Existing Blueprints</h3>
            <div class="row">
                <c:forEach var="blueprint" items="${allBlueprints}">
                    <div class="col-md-4">
                        <div class="card">
                            <img class="card-img-top" src="${blueprint.getShowingImg(blueprint.imgUrl)}" alt="Blueprint Image">
                            <div class="card-body">
                                <p><strong>Date Uploaded:</strong> <fmt:formatDate value="${blueprint.dateCreate}" pattern="dd-MM-yyyy"/></p>
                                <div class="d-flex justify-content-between">
                                    <a href="${blueprint.getShowingImg(blueprint.imgUrl)}" class="btn btn-primary" target="_blank">View Full Image</a>
                                    <form action="${pageContext.request.contextPath}/delete/blueprint" method="post" onsubmit="return confirmDelete();">
                                        <input type="hidden" name="bluePrintId" value="${blueprint.bluePrintId}">
                                        <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                                        <button type="submit" class="btn btn-danger" >Delete</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="blueprint-gallery">
            <h3>Blueprints with Customer Feedback</h3>
            <div class="row">
                <c:forEach var="blueprint" items="${feedbackBlueprints}">
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm blueprint-card">
                            <img class="card-img-top rounded" src="${blueprint.getShowingImg(blueprint.imgUrl)}" alt="Blueprint Image" style="height: 250px; object-fit: cover;">
                            <div class="card-body">
                                <p class="font-weight-bold text-primary">
                                    Date Uploaded: <fmt:formatDate value="${blueprint.dateCreate}" pattern="dd-MM-yyyy"/>
                                </p>
                                <div class="feedback-section">
                                    <h5 class="text-success">Customer Feedback:</h5>
                                    <div class="feedback-content">
                                        <c:forEach var="comment" items="${blueprint.comments}">
                                            <div class="feedback-item">
                                                <p class="text-muted small mb-0"><fmt:formatDate value="${comment.datePost.time}" pattern="dd-MM-yyyy HH:mm"/></p>
                                                <p class="mb-2"> ${comment.commentContent}</p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Upload New Blueprint Section -->
        <div class="upload-section">
            <h3>Upload New Blueprint</h3>
            <form action="${pageContext.request.contextPath}/designer/blueprint/upload/" method="post" enctype="multipart/form-data">
                <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                <div class="drop-zone" id="drop-zone">
                    Drag and drop an image file here or click to upload
                    <input type="file" id="blueprintFile" name="file" accept="image/*">
                </div>
                <div class="preview-container" id="preview-container">
                    <!-- Image previews will be displayed here -->
                </div>
                <button type="submit" class="btn btn-primary" id="upload-btn">Upload Blueprint</button>
                <div class="progress-bar" id="progress-bar"></div>
            </form>
        </div>

        <!-- Update Summary File Section -->
        <div class="upload-section">
            <h3>Update Summary File</h3>
            <form action="${pageContext.request.contextPath}/updateSummary/" method="post" enctype="multipart/form-data">
                <input type="hidden" name="designStageId" value="${designStage.designStageId}">
                <div class="form-group">
                    <label for="summaryFile">Choose Summary File</label>
                    <input type="file" class="form-control-file" id="summaryFile" name="file" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Summary File</button>
            </form>
        </div>

        <!-- Popup -->
        <%@include file="../popup.jsp"%>

    </div>
</div>
<c:if test="${not empty message}">
    <script>
        alert("${message}");
    </script>
</c:if>
<!-- JS for upload image -->
<script>
    // Drag and drop functionality
    const dropZone = document.getElementById('drop-zone');
    const fileInput = document.getElementById('blueprintFile');
    const previewContainer = document.getElementById('preview-container');
    const progressBar = document.getElementById('progress-bar');
    const uploadBtn = document.getElementById('upload-btn');

    dropZone.addEventListener('click', () => fileInput.click());

    fileInput.addEventListener('change', updatePreview);

    dropZone.addEventListener('dragover', (e) => {
        e.preventDefault();
        dropZone.classList.add('dragover');
    });

    dropZone.addEventListener('dragleave', () => dropZone.classList.remove('dragover'));

    dropZone.addEventListener('drop', (e) => {
        e.preventDefault();
        dropZone.classList.remove('dragover');
        fileInput.files = e.dataTransfer.files;
        updatePreview();
    });

    function updatePreview() {
        previewContainer.innerHTML = '';
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                previewContainer.innerHTML = '<div class="preview"><img src="' + e.target.result + '" /></div>';
            };
            reader.readAsDataURL(file);
        }
    }

    uploadBtn.addEventListener('click', () => {
        progressBar.style.width = '50%';
        setTimeout(() => {
            progressBar.style.width = '100%';
        }, 1500);
    });

    function confirmDelete() {
        return confirm("Are you sure you want to delete this blueprint?");
    }
</script>
<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>
