<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 240px;
                background-color: #343a40;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                padding: 20px;
                color: white;
                overflow-y: auto;
                scrollbar-width: none;
            }
            .sidebar::-webkit-scrollbar {
                display: none;
            }
            .admin-info {
                text-align: center;
                margin-bottom: 20px;
            }
            .admin-avatar {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                margin-bottom: 10px;
                border: 2px solid white;
            }
            .menu .nav-item {
                margin-bottom: 15px;
            }
            .menu .nav-link {
                color: white;
                font-size: 15px;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }
            .menu .nav-link:hover {
                background-color: #495057;
                transform: translateX(5px);
            }
            .logout-section .btn {
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #dc3545;
                border: none;
                width: 100%;
                padding: 12px;
                font-size: 16px;
                border-radius: 4px;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
            }
            .logout-section .btn:hover {
                background-color: #c82333;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }

            /* Notification bell at the top right with adjusted color */
            .notification-bell {
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #6c757d; /* Change to a more neutral gray */
                color: white;
                font-size: 18px;
                padding: 6px;
                border-radius: 50%;
                width: 36px;
                height: 36px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                z-index: 1000;
            }
            .notification-bell i {
                font-size: 16px;
            }
            .notification-bell:hover {
                background-color: #5a6268; /* Darker gray on hover */
            }
            .content {
                margin-left: 260px;
                padding: 40px;
                background-color: #f8f9fa;
                min-height: 100vh;
            }
            .content h1 {
                margin-bottom: 20px;
                font-weight: 700;
                font-size: 28px;
            }
            ::-webkit-scrollbar {
                width: 8px;
            }
            ::-webkit-scrollbar-thumb {
                background-color: #adb5bd;
                border-radius: 10px;
            }
            ::-webkit-scrollbar-thumb:hover {
                background-color: #6c757d;
            }
        </style>
    </head>
    <body>
        <!-- Notification Bell -->
        <button class="notification-bell">
            <i class="bi bi-bell"></i>
        </button>

        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="admin-info">
                <img src="images/admin.jpg" alt="Admin Avatar" class="admin-avatar">
                <p>Welcome, <strong>Manager</strong></p>
            </div>

            <nav class="menu">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/consultant"><i class="bi bi-person-badge"></i> Consultant</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/quote"><i class="bi bi-file-earmark-text"></i> Quote</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/contract"><i class="bi bi-file-earmark"></i> Contracts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/projects"><i class="bi bi-diagram-3"></i> Projects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/design"><i class="bi bi-pencil-square"></i> Design</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/construction"><i class="bi bi-tools"></i> Construction</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-file-earmark-text"></i> Terms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/services"><i class="bi bi-bar-chart-line"></i> Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/manager/serviceDetails"><i class="bi bi-bar-chart-line"></i> Services Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-gear"></i> Settings</a>
                    </li>
                </ul>
            </nav>
            <div class="logout-section">
                <a class="btn btn-danger" href="/logout">Logout</a>
            </div>
        </aside>
    </body>
</html>
