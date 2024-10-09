<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                        <!-- Dashboard Cards -->
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-info">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-file-earmark-text"></i> Pending Quotation</div>
                                    <h2 class="card-text" data-name="quotesPending">Loading...</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-success">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-diagram-3"></i> Project in Processing</div>
                                    <h2 class="card-text" data-name="projectProcessing">Loading...</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-secondary">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-diagram-3"></i> Project Complete</div>
                                    <h2 class="card-text" data-name="projectComplete">Loading...</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mb-3">
                            <div class="card text-white bg-primary">
                                <div class="card-body">
                                    <div class="card-title"><i class="bi bi-people"></i>Total Employees</div>
                                    <h2 class="card-text" data-name="staffInWork">Loading...</h2>
                                </div>
                            </div>
                        </div>   
                    </div>
                    <!-- Chart Container -->
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Monthly Earnings</h2>
                            <canvas id="earningsChart"></canvas>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- jQuery, Bootstrap JS, and Chart.js -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
            // Fetch dashboard statistics like quotes, projects, and staff
            $(document).ready(function () {
                fetch('/api/dashboard/upper-stats')
                        .then(response => response.json())
                        .then(data => {
                            document.querySelector('.card-text[data-name="quotesPending"]').textContent = data.quotesPending;
                            document.querySelector('.card-text[data-name="projectProcessing"]').textContent = data.projectProcessing;
                            document.querySelector('.card-text[data-name="projectComplete"]').textContent = data.projectComplete;
                            document.querySelector('.card-text[data-name="staffInWork"]').textContent = data.staffInWork;
                        })
                        .catch(error => console.error('Error fetching dashboard data:', error));

                // Fetch monthly earnings and render a chart
                const year = new Date().getFullYear(); // Current year
                fetch(`/api/dashboard/monthly-earnings?year=`+year)
                        .then(response => response.json())
                        .then(data => {
                            // Generate month labels from 1 to 12
                            const months = Array.from({length: 12}, (_, i) => i + 1);

                            // Map data to earnings, fill in 0 for missing months
                            const earnings = months.map(month => data[month] || 0);

                            // Render chart using Chart.js
                            const ctx = document.getElementById('earningsChart').getContext('2d');
                            new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: months.map(month => `Month` + month), // Label each month
                                    datasets: [{
                                            label: 'Total Earnings',
                                            data: earnings,
                                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                            borderColor: 'rgba(54, 162, 235, 1)',
                                            borderWidth: 1
                                        }]
                                },
                                options: {
                                    scales: {
                                        y: {
                                            beginAtZero: true
                                        }
                                    }
                                }
                            });
                        })
                        .catch(error => console.error('Error fetching monthly earnings:', error));
            });
        </script>
    </body>
</html>
