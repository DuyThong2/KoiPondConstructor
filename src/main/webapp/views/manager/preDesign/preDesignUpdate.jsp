<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Update Pre Design</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="<c:url value='/css/manager/navbar.css'/>" rel="stylesheet">
        <style>
            body {
                background-color: #f3f4f6;
                font-family: 'Poppins', sans-serif;
                color: #333;
            }

            .container {
                margin-top: 50px;
                width: 80%; /* Adjust width to occupy 80% of the screen */
                max-width: 600px; /* Set the maximum width for larger screens */
                background-color: #ffffff;
                padding: 40px 60px; /* Increased padding on the left and right */
                border-radius: 8px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                margin-left: auto; /* Center the container */
                margin-right: auto; /* Center the container */
            }

            h1 {
                text-align: center;
                color: #1e90ff;
                margin-bottom: 30px;
                font-weight: bold;
            }

            label {
                font-weight: 600;
                color: #555;
            }

            .form-control,
            .form-control-file {
                padding: 10px;
                border-radius: 8px;
                border: 1px solid #ddd;
                transition: all 0.3s ease;
            }

            .form-control:focus,
            .form-control-file:focus {
                border-color: #1e90ff;
                box-shadow: 0 0 10px rgba(30, 144, 255, 0.1);
            }

            .btn-primary {
                background-color: #1e90ff;
                border: none;
                padding: 12px 20px;
                font-size: 16px;
                border-radius: 8px;
                font-weight: bold;
                transition: all 0.3s ease;
                width: 100%;
            }

            .btn-primary:hover {
                background-color: #4682b4;
            }

            .btn-submit {
                text-align: center;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group textarea.form-control {
                resize: none;
            }

            .form-error {
                font-size: 0.9em;
                color: #ff5a5a;
            }

            /* Spacing for File Upload */
            .form-control-file {
                margin-top: 10px;
            }
        </style>
    </head>
    <div style="height:6vh;"></div>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Including the Navbar -->
                <%@ include file="../navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-4">
                    <!-- Page Heading -->
                    <h1>Update Pre Design</h1>

                    <!-- Form for Creating a New Pre Design -->
                    <form:form method="post" enctype="multipart/form-data" modelAttribute="preDesign" action="${pageContext.request.contextPath}/manager/preDesign/saveUpdate" onsubmit="return validateForm()">
                        <form:hidden path="preDesignId" value="${preDesign.preDesignId}"/>
                        <form:hidden path="preDesignImgUrl" value="${preDesign.preDesignImgUrl}"/>
                        <form:hidden path="content.id" value="${preDesign.content.id}"/>

                        <!-- Pre Design Name -->
                        <div class="form-group">
                            <label for="preDesignName">Pre Design Name</label>
                            <form:input path="preDesignName" class="form-control" placeholder="Enter Pre Design Name" required="true"/>
                            <form:errors path="preDesignName" cssClass="form-error"/>
                        </div>

                        <!-- Pre Design Description -->
                        <div class="form-group">
                            <label for="preDesignDescription">Pre Design Description</label>
                            <form:textarea path="preDesignDescription" class="form-control" placeholder="Enter Pre Design Description" rows="4" required="true"/>
                            <form:errors path="preDesignDescription" cssClass="form-error"/>
                        </div>

                        <div class="form-group">
                            <label for="preDesignTime">Estimate Time</label>
                            <form:textarea path="preDesignTime" class="form-control" placeholder="Enter Time" rows="4" required="true"/>
                            <form:errors path="preDesignTime" cssClass="form-error"/>
                        </div>

                        <div class="form-group">
                            <label for="parcel">Select Parcel:</label>
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#parcelModal">
                                Choose Parcel
                            </button>
                            <input type="hidden" id="selectedParcelId" name="parcel.packageId" value="${preDesign.parcel.packageId}" required />
                            <input type="text" id="selectedParcelName" name="parcelName" value="${preDesign.parcel.packageName}" readonly class="form-control" />
                        </div>

                        <!-- Blog Content -->
                        <div class="form-group">
                            <label for="content">Content</label>
                            <textarea id="content" name="content" class="form-control" rows="6" required>
                                ${preDesign.content.content}
                            </textarea>
                        </div>

                        <!-- Image Upload -->
                        <div class="form-group">
                            <label for="file">Upload Image</label>
                            <input type="file" accept="image/*" id="file" name="file" class="form-control-file">
                        </div>

                        <!-- Submit Button -->
                        <div class="form-group btn-submit">
                            <button type="submit" class="btn btn-primary">Update Pre Design</button>
                        </div>
                    </form:form>
                    <div style="height:6vh;"></div>
                </main>
            </div>
        </div>

        <div class="modal fade" id="parcelModal" tabindex="-1" role="dialog" aria-labelledby="parcelModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="parcelModalLabel">Select Parcel</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Table to display all parcels -->
                        <table class="table table-bordered table-striped">
                            <thead class="thead-light">
                                <tr>
                                    <th style="width: 20%;">Package Name</th>
                                    <th style="width: 20%;">Description</th>
                                    <th style="width: 15%;">Design Price per m2</th>
                                    <th style="width: 15%;">Construction Price per m2</th>
                                    <th style="width: 10%;">Status</th>
                                    <th style="width: 10%;">Select</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="parcel" items="${parcelList}">
                                    <tr>
                                        <td>${parcel.packageName}</td>
                                        <td>${parcel.packageDescription}</td>
                                        <td class="text-center">${parcel.designOnSquareRoot}</td>
                                        <td class="text-center">${parcel.constructionPriceOnSquareRoot}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${parcel.package_status}">
                                                    Active
                                                </c:when>
                                                <c:otherwise>
                                                    Inactive
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-sm btn-primary" onclick="selectParcel(${parcel.packageId}, '${parcel.packageName}', ${parcel.designOnSquareRoot}, ${parcel.constructionPriceOnSquareRoot})">
                                                Select
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- CKEditor Integration -->
        <script src="https://cdn.ckeditor.com/4.16.2/standard-all/ckeditor.js"></script> <!-- Ensure image2 plugin is enabled -->
        <script>
                                                CKEDITOR.replace('content', {
                                                    extraPlugins: 'uploadimage,image2', // Enable image2 plugin for resizing
                                                    filebrowserImageUploadUrl: '${pageContext.request.contextPath}/base64/uploadImage', // Your image upload URL
                                                    uploadUrl: '${pageContext.request.contextPath}/base64/uploadImage', // Server-side image upload handler URL
                                                    height: 500,

                                                    // Enable image resizing features
                                                    image2_disableResizer: false, // Allows manual resizing in the editor

                                                    on: {
                                                        paste: function (evt) {
                                                            var editor = evt.editor;
                                                            var data = evt.data;

                                                            // Check if the pasted data contains an image
                                                            if (data && data.dataTransfer && data.dataTransfer.getFilesCount()) {
                                                                var file = data.dataTransfer.getFile(0);

                                                                if (file && file.type.indexOf('image') !== -1) {
                                                                    var reader = new FileReader();

                                                                    // Read the image as data URL
                                                                    reader.onload = function (e) {
                                                                        var img = new Image();
                                                                        img.src = e.target.result;

                                                                        img.onload = function () {
                                                                            // Check if the image is larger than 800px in width
                                                                            var canvas = document.createElement('canvas');
                                                                            var maxWidth = 800;

                                                                            if (img.width > maxWidth) {
                                                                                var scaleFactor = maxWidth / img.width;
                                                                                canvas.width = maxWidth;
                                                                                canvas.height = img.height * scaleFactor;

                                                                                var ctx = canvas.getContext('2d');
                                                                                ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

                                                                                // Convert the resized image to Base64
                                                                                var resizedDataUrl = canvas.toDataURL(file.type);

                                                                                // Insert the resized image into the editor
                                                                                editor.insertHtml('<img src="' + resizedDataUrl + '" width="' + maxWidth + '" />');
                                                                            } else {
                                                                                // If the image is smaller than 800px, insert it as-is
                                                                                editor.insertHtml('<img src="' + img.src + '" />');
                                                                            }
                                                                        };
                                                                    };

                                                                    reader.readAsDataURL(file);

                                                                    // Prevent default paste behavior for images to avoid duplicating content
                                                                    evt.cancel();
                                                                }
                                                            }
                                                        }
                                                    }
                                                });

                                                let selectedParcelDetails = {
                                                    designCostPerSquareMeter: 0,
                                                    constructionCostPerSquareMeter: 0
                                                };

                                                function selectParcel(packageId, packageName, designCostPerSquareMeter, constructionCostPerSquareMeter) {
                                                    document.getElementById('selectedParcelId').value = packageId;
                                                    document.getElementById('selectedParcelName').value = packageName;
                                                    selectedParcelDetails = {
                                                        designCostPerSquareMeter: designCostPerSquareMeter,
                                                        constructionCostPerSquareMeter: constructionCostPerSquareMeter
                                                    };
                                                    $('#parcelModal').modal('hide');
                                                }

                                                let isConfirmed = false;

                                                function validateForm() {
                                                    if (!isConfirmed) {
                                                        const preDesignName = document.getElementById('preDesignName').value.trim();
                                                        const preDesignDescription = document.getElementById('preDesignDescription').value.trim();
                                                        const preDesignTime = document.getElementById('preDesignTime').value.trim();
                                                        const parcelId = document.getElementById('selectedParcelId').value.trim();
                                                        const content = document.getElementById('content').value.trim();

                                                        // Validate that all required text fields are not empty
                                                        if (preDesignName === "" || preDesignDescription === "" || preDesignTime === "" || content === "") {
                                                            alert('Please fill in all required fields: Pre Design Name, Description, Estimate Time, and Blog Content.');
                                                            return false;
                                                        }

                                                        // Validate that a parcel is selected
                                                        if (parcelId === "") {
                                                            alert('Please select a Parcel.');
                                                            return false;
                                                        }

                                                        // Show confirmation message only the first time
                                                        if (!confirm('Are you sure you want to create this Pre Design?')) {
                                                            return false;
                                                        }

                                                        isConfirmed = true; // Mark as confirmed if the user clicks "Yes"
                                                    }

                                                    return true; // Proceed with form submission
                                                }
        </script>


        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
