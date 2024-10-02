<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contract Details</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <style>
            .main-content h2 {
                font-weight: bold;
                color: #212529;
                border-bottom: 2px solid #212529;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            .main-content .card {
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
            }

            .main-content .card:hover {
                transform: scale(1.05);
            }

            .main-content .card-title {
                font-size: 1.2rem;
                font-weight: 500;
                margin-bottom: 10px;
            }

            .main-content .card-text {
                font-size: 1.8rem;
                font-weight: bold;
            }

            @media (max-width: 768px) {
                .main-content {
                    padding: 15px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="navBar.jsp" %>

                <!-- Main content -->
                <main role="main" class="main-content col-md-10 ml-sm-auto col-lg-10 px-4 mt-5">
                    <div class="row text-center">
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-info">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-file-earmark-text"></i> Pending Quotation</div>
                                    <h2 class="card-text">${quotesPeding}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-success">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-diagram-3"></i> Project in Processing</div>
                                    <h2 class="card-text">${projectProcessing}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-secondary">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-diagram-3"></i> Project Complete</div>
                                    <h2 class="card-text">${projectComplete}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-primary">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-people"></i>Total Employees</div>
                                    <h2 class="card-text">${staffInWork}</h2>
                                </div>
                            </div>
                        </div>   
                    </div>
                    <div class="row">

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
