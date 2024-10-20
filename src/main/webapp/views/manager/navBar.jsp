
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
