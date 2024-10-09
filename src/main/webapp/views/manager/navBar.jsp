<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            /* Sidebar styling */
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 240px;
                background-color: #343a40;
                padding: 20px;
                color: white;
                overflow-y: auto;
            }

            .sidebar::-webkit-scrollbar {
                display: none;
            }

            .admin-info {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Tăng cỡ chữ cho các phần tử trong menu */
            .menu .nav-item {
                margin-bottom: 15px;
            }

            .menu .nav-link {
                color: white;
                font-size: 17px;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .menu .nav-link:hover {
                background-color: #495057;
                transform: translateX(5px);
            }

            /* Mở/đóng submenu với hiệu ứng mượt */
            .collapse {
                transition: height 0.5s ease-in-out; /* Tăng thời gian và sử dụng ease-in-out để mượt hơn */
            }

            /* Luôn hiển thị mũi tên sang phải */
            .menu .nav-link[data-toggle="collapse"]::after {
                content: '\25B7'; /* Mũi tên sang phải */
                float: right;
                transition: transform 0.3s ease;
                font-size: 0.9rem;
            }

            .menu .nav-link[aria-expanded="true"]::after {
                transform: rotate(90deg);
            }

            /* Submenu styling */
            .sidebar ul.collapse {
                list-style-type: none;
                padding-left: 0;
            }

            .sidebar ul.collapse .nav-item {
                margin-left: 15px;
            }

            .sidebar ul.collapse .nav-link {
                padding-left: 20px;
                font-size: 15px;
            }

            /* Logout button styling */
            .logout-section .btn {
                width: 100%;
                background-color: #dc3545;
                font-size: 16px;
                padding: 12px;
                border-radius: 4px;
            }

            .logout-section .btn:hover {
                background-color: #c82333;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }
            .sidebar ul {
                list-style: none; /* Remove bullets from all unordered lists */
                padding-left: 0;
            }

        </style>
    </head>
    <body>
       
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="admin-info">
                <i class="fas fa-user" style="font-size: 3rem; color: white;"></i>
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
                        <a class="nav-link" href="/staff/blogs"><i class="bi bi-newspaper"></i> Blog</a>
                    </li>

                    <!-- Manage User section with submenu -->
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#manageUserSubmenu" aria-expanded="false" aria-controls="manageUserSubmenu">
                            <i class="bi bi-people"></i> Manage User
                        </a>
                        <ul class="collapse" id="manageUserSubmenu">
                            <li class="nav-item">
                                <a class="nav-link" href="/manager/manageCustomer"><i class="bi bi-person-circle"></i> Manage Customer</a>
                            </li>
                            <li class="nav-item">

                                <a class="nav-link" href="/manager/manageStaff"><i class="bi bi-person-badge"></i> Manage Staff</a>
                            </li>

                        </ul>
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
                        <a class="nav-link" href="#"><i class="bi bi-bar-chart-line"></i> Reports</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="bi bi-gear"></i> Settings</a>
                    </li>
                </ul>
            </nav>

            <div class="logout-section">
                <a class="btn btn-danger" href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </aside>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
