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
    <!-- FontAwesome CDN -->
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
        .header {
            background-color: #343a40;
            color: white;
            padding: 10px 30px;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-bottom: 2px solid #007bff;
        }

        .header-icons {
            display: flex;
            margin-right: 17px;
        }

        .icon-link {
            color: white;
            margin-left: 20px;
            font-size: 22px;
            text-decoration: none;
            transition: color 0.3s, transform 0.3s;
        }

        .icon-link:hover {
            color: #007bff;
            transform: scale(1.1);
        }
        .dropdown-menu {
            min-width: 200px; /* Chiều rộng tối thiểu của dropdown */
        }

        .dropdown-header {
            font-weight: bold; /* Đậm chữ cho tiêu đề dropdown */
        }
        .badge-note {
            position: absolute;
            top: -5px; /* Đặt vị trí theo chiều dọc */
            right: -10px; /* Đặt vị trí theo chiều ngang */
            font-size: 0.75rem; /* Kích thước chữ nhỏ hơn */
            padding: 0.25em 0.4em; /* Khoảng cách bên trong */
            border-radius: 10px; /* Bo tròn */
        }
        .dropdown-toggle::after {
            display: none; /* Ẩn mũi tên */
        }

    </style>
</head>
<body>
<header class="header">
    <div class="header-icons">
        <a href="#" class="icon-link" title="Messages" style="margin-right: 10px">
            <i class="fas fa-envelope"></i>
        </a>

        <!-- Dropdown for Notifications -->
        <div class="dropdown">
            <a class="icon-link dropdown-toggle" href="#" id="notificationDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell"></i>
                <!-- Badge for unread notifications -->
                <span class="badge-note badge-danger" id="notificationCount">3</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="notificationDropdown">
                <h6 class="dropdown-header">Notifications</h6>
                <a class="dropdown-item" href="#">Notification 1</a>
                <a class="dropdown-item" href="#">Notification 2</a>
                <a class="dropdown-item" href="#">Notification 3</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">See All Notifications</a>
            </div>
        </div>
    </div>
</header>


<!-- Sidebar -->
<aside class="sidebar" style="z-index: 200">
    <div class="admin-info">
        <i class="fas fa-user" style="font-size: 3rem; color: white;"></i>
        <p>Welcome, <strong>Manager</strong></p>
    </div>

    <nav class="menu">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/preDesign"><i class="bi bi-pencil-square"></i> Pre-design</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/consultant"><i class="bi bi-person-badge"></i> Consultant</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/quote"><i class="bi bi-file-earmark-text"></i> Quote</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/contract"><i class="bi bi-file-earmark"></i> Contracts</a>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#projectSubmenu" aria-expanded="false" aria-controls="projectSubmenu">
                    <i class="bi bi-diagram-3"></i> Projects
                </a>
                <ul class="collapse" id="projectSubmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/projects"><i class="bi bi-diagram-3"></i> Projects List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/design"><i class="bi bi-pencil-square"></i> Design</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/construction"><i class="bi bi-tools"></i> Construction</a>
                    </li>
                </ul>
            </li>

            <!-- Manage User section with submenu -->
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#manageUserSubmenu" aria-expanded="false" aria-controls="manageUserSubmenu">
                    <i class="bi bi-people"></i> Manage User
                </a>
                <ul class="collapse" id="manageUserSubmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/manageCustomer"><i class="bi bi-person-circle"></i> Manage Customer</a>
                    </li>
                    <li class="nav-item">

                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/manageStaff"><i class="bi bi-person-badge"></i> Manage Staff</a>
                    </li>

                </ul>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/terms"><i class="bi bi-file-earmark-text"></i> Terms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/services"><i class="bi bi-tools"></i> Services</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/serviceDetails"><i class="bi bi-file-earmark-text"></i> Services Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/parcel"><i class="bi bi-box"></i> Package</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/staff/blogs"><i class="bi bi-newspaper"></i> Blog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="bi bi-bar-chart-line"></i> Reports</a>
            </li>
        </ul>
    </nav>

    <div class="logout-section">
        <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</aside>


</body>
</html>
