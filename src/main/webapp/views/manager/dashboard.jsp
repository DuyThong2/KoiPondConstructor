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
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script> <!-- Plugin to show labels on the pie chart -->
        <style>
            .main-content h2 {
                font-weight: bold;
                color: #212529;
                border-bottom: 2px solid #212529;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .card {
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .card-header {
                font-size: 1.5rem;
                font-weight: bold;
                background-color: #f8f9fa;
                border-bottom: none;
            }

            .card-body {
                padding: 20px;
            }

            /* Resize the pie chart to be 2/3 of the bar chart */
            #serviceBookingChart {
                width: 67% !important;  /* Set width to 2/3 of the original size */
                height: auto !important;
            }

            @media (max-width: 768px) {
                .main-content {
                    padding: 15px;
                }
            }

            #serviceBookingChart {
                width: 100% !important;  /* Ensure it takes up full container width */
                max-width: 400px;  /* Set a maximum width to avoid resizing issues */
                height: 300px !important;  /* Set a fixed height to prevent resizing */
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
                    <!-- Charts Row -->
                    <div class="row">
                        <!-- Monthly Earnings Chart -->
                        <div class="col-md-7">
                            <div class="card">
                                <div class="card-header">Monthly Earnings</div>
                                <div class="card-body">
                                    <canvas id="earningsChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <!-- Service Booking Percentages Chart -->
                        <div class="col-md-5">
                            <div class="card">
                                <div class="card-header">Service Booking Percentages</div>
                                <div class="card-body">
                                    <canvas id="serviceBookingChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <!-- Service Stats Card -->
                            <div class="card text-white bg-info mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Service Stats</h5>
                                    <h6>Total Services Booked: <span data-name="totalServicesBooked">Loading...</span></h6>
                                    <h6>Total Services Completed: <span data-name="totalServicesCompleted">Loading...</span></h6>
                                </div>
                            </div>

                            <!-- Project and Contract Stats Card -->
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Project and Contract Stats</h5>
                                    <h6>Total Contracts Signed: <span data-name="totalContractsSigned">Loading...</span></h6>
                                    <p>Projects in Planning: <span data-name="totalProjectsInPlanning">Loading...</span></p>
                                    <p>Projects in Design: <span data-name="totalProjectsInDesign">Loading...</span></p>
                                    <p>Projects in Construction: <span data-name="totalProjectsInConstruction">Loading...</span></p>
                                    <p>Projects in Maintenance: <span data-name="totalProjectsInMaintenance">Loading...</span></p>
                                    <p>Projects Completed: <span data-name="totalProjectsCompleted">Loading...</span></p>
                                </div>
                            </div>

                            <!-- Consultant, Quote, and Contract Stats Card -->
                            <div class="card text-white bg-primary mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Consultant, Quote, and Contract Stats</h5>
                                    <h6>Total Consultants Received: <span data-name="totalConsultantsReceived">Loading...</span></h6>
                                    <h6>Total Quotes Created: <span data-name="totalQuotesCreated">Loading...</span></h6>
                                    <h6>Total Contracts Created: <span data-name="totalContractsCreated">Loading...</span></h6>
                                </div>
                            </div>
                        </div>


                        <!-- Right column for the Monthly Service Revenue Chart -->
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-header">Monthly Service Revenue (Last 12 Months)</div>
                                <div class="card-body">
                                    <canvas id="serviceRevenueChart"></canvas>
                                </div>
                            </div>
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
                fetch(`/api/dashboard/monthly-earnings?year=` + year)
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
                                    labels: months.map(month => `Month ` + month), // Label each month
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

                // Fetch service booking percentages and render a pie chart
                fetch('/api/dashboard/service-booking-percentages')
                        .then(response => response.json())
                        .then(data => {
                            const serviceNames = Object.keys(data);  // Get the service names
                            const servicePercentages = Object.values(data);  // Get the percentages

                            // A broader color palette for more variety
                            const backgroundColors = [
                                'rgba(75, 192, 192, 0.2)', // teal
                                'rgba(255, 159, 64, 0.2)', // orange
                                'rgba(255, 205, 86, 0.2)', // yellow
                                'rgba(54, 162, 235, 0.2)', // blue
                                'rgba(153, 102, 255, 0.2)', // purple
                                'rgba(255, 99, 132, 0.2)', // red
                                'rgba(0, 206, 201, 0.2)', // turquoise
                                'rgba(251, 233, 231, 0.2)', // pale pink
                                'rgba(102, 51, 153, 0.2)', // violet
                                'rgba(255, 235, 59, 0.2)', // light yellow
                                'rgba(233, 30, 99, 0.2)', // pink
                                'rgba(0, 123, 255, 0.2)', // vibrant blue
                                'rgba(76, 175, 80, 0.2)', // green
                                'rgba(255, 87, 34, 0.2)', // deep orange
                                'rgba(103, 58, 183, 0.2)', // deep purple
                                'rgba(139, 195, 74, 0.2)', // light green
                                'rgba(33, 150, 243, 0.2)', // sky blue
                                'rgba(121, 85, 72, 0.2)', // brown
                                'rgba(255, 215, 0, 0.2)', // gold
                                'rgba(72, 61, 139, 0.2)', // dark slate blue
                                'rgba(85, 239, 196, 0.2)', // mint green
                                'rgba(0, 250, 154, 0.2)'        // medium spring green
                            ];

                            const borderColors = backgroundColors.map(color => color.replace('0.2', '1')); // Darken the borders

                            // Render pie chart using Chart.js
                            const ctxService = document.getElementById('serviceBookingChart').getContext('2d');
                            new Chart(ctxService, {
                                type: 'pie',
                                data: {
                                    labels: serviceNames,
                                    datasets: [{
                                            data: servicePercentages,
                                            backgroundColor: backgroundColors,
                                            borderColor: borderColors,
                                            borderWidth: 1
                                        }]
                                },
                                options: {
                                    responsive: false, // Disable responsive resizing
                                    maintainAspectRatio: false, // Allow custom sizing
                                    plugins: {
                                        legend: {
                                            position: 'right', // Move legend to the right
                                            labels: {
                                                boxWidth: 10, // Smaller legend box size
                                                font: {
                                                    size: 12
                                                }
                                            }
                                        }
                                    },
                                    layout: {
                                        padding: {
                                            top: 0,
                                            bottom: 0,
                                            left: 0,
                                            right: 0  // Add padding on the right to ensure the legend is fully visible
                                        }
                                    }
                                }
                            });
                        })
                        .catch(error => console.error('Error fetching service booking percentages:', error));




                fetch('/api/dashboard/monthly-service-revenue')
                        .then(response => response.json())
                        .then(data => {
                            // Extract labels (months) and datasets (revenue per service)
                            const months = Array.from({length: 12}, (_, i) => i + 1);
                            const services = Object.keys(data);  // Get the service names
                            const datasets = services.map(service => {
                                return {
                                    label: service,
                                    data: months.map(month => data[service][month] || 0), // Fill missing months with 0
                                    fill: false,
                                    borderColor: getRandomColor(),
                                    tension: 0.1  // Smooth the lines
                                };
                            });

                            // Render line chart using Chart.js
                            const ctx = document.getElementById('serviceRevenueChart').getContext('2d');
                            new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: months.map(month => 'Month ' + month),
                                    datasets: datasets
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
                        .catch(error => console.error('Error fetching service revenue data:', error));

                // Function to generate random color for each service
                function getRandomColor() {
                    const letters = '0123456789ABCDEF';
                    let color = '#';
                    for (let i = 0; i < 6; i++) {
                        color += letters[Math.floor(Math.random() * 16)];
                    }
                    return color;
                }


                fetch('/api/dashboard/service-stats')
                        .then(response => response.json())
                        .then(data => {
                            document.querySelector('span[data-name="totalServicesBooked"]').textContent = data.totalServicesBooked;
                            document.querySelector('span[data-name="totalServicesCompleted"]').textContent = data.totalServicesCompleted;
                        })
                        .catch(error => console.error('Error fetching service stats:', error));

                // Fetch Project and Contract Stats
                fetch('/api/dashboard/project-contract-stats')
                        .then(response => response.json())
                        .then(data => {
                            document.querySelector('span[data-name="totalContractsSigned"]').textContent = data.totalContractsSigned;
                            document.querySelector('span[data-name="totalProjectsInPlanning"]').textContent = data.totalProjectsInPlanning;
                            document.querySelector('span[data-name="totalProjectsInDesign"]').textContent = data.totalProjectsInDesign;
                            document.querySelector('span[data-name="totalProjectsInConstruction"]').textContent = data.totalProjectsInConstruction;
                            document.querySelector('span[data-name="totalProjectsInMaintenance"]').textContent = data.totalProjectsInMaintenance;
                            document.querySelector('span[data-name="totalProjectsCompleted"]').textContent = data.totalProjectsCompleted;
                        })
                        .catch(error => console.error('Error fetching project and contract stats:', error));

                // Fetch Consultant, Quote, and Contract Stats
                fetch('/api/dashboard/consultant-quote-contract-stats')
                        .then(response => response.json())
                        .then(data => {
                            document.querySelector('span[data-name="totalConsultantsReceived"]').textContent = data.totalConsultantsReceived;
                            document.querySelector('span[data-name="totalQuotesCreated"]').textContent = data.totalQuotesCreated;
                            document.querySelector('span[data-name="totalContractsCreated"]').textContent = data.totalContractsCreated;
                        })
                        .catch(error => console.error('Error fetching consultant, quote, and contract stats:', error));







            });
        </script>
    </body>
</html>
