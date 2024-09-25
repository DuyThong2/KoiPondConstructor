<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            /* Sidebar Styling */
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 220px; /* Gi?m chi?u r?ng c?a sidebar */
                background-color: #343a40;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                padding: 20px;
                color: white;
            }

            .admin-info {
                text-align: center;
                margin-bottom: 30px;
            }

            .admin-avatar {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                margin-bottom: 15px;
            }

            .menu .nav-item {
                margin-bottom: 20px; /* T?ng kho?ng cách gi?a các m?c */
            }

            .menu .nav-link {
                color: white;
                font-size: 16px;
                padding: 10px 15px;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            .menu .nav-link:hover {
                background-color: #495057;
            }

            /* Logout button always at the bottom */
            .logout-section {
                margin-top: auto;
            }

            .logout-section .btn {
                background-color: #dc3545;
                border: none;
                width: 100%;
                padding: 10px;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .logout-section .btn:hover {
                background-color: #c82333;
            }

            /* Main content styling */
            .content {
                margin-left: 240px; /* ?i?u ch?nh ?? phù h?p v?i sidebar ?ã thu nh? */
                padding: 20px;
            }

            .content h1 {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="admin-info">
                <img src="images/admin.jpg" alt="Admin Avatar" class="admin-avatar">
                <p>Welcome, <strong>Manager</strong></p>
            </div>
            <nav class="menu">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/contract"><i class="fas fa-file-contract"></i> Contracts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/design"><i class="fas fa-pencil-ruler"></i> Design</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/projects"><i class="fas fa-project-diagram"></i> Projects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-file-alt"></i> Terms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-chart-bar"></i> Reports</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-cog"></i> Settings</a>
                    </li>
                </ul>
            </nav>
            <div class="logout-section">
                <a class="btn btn-danger" href="#">Logout</a>
            </div>
        </aside>
    </body>
</html>
