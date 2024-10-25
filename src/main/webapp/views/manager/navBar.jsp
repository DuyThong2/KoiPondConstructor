
    <header class="header">
        <div class="header-icons">
            <a href="#" class="icon-link" title="Messages" style="margin-right: 10px">
                <i class="fas fa-envelope"></i>
            </a>

            <!-- Dropdown for Notifications -->
            <div class="dropdown">
                <a class="icon-link dropdown-toggle" href="#" id="notificationDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell"></i>
                    <!-- Badge for unread notifications -->
                    <span class="badge-note badge-danger" id="notificationCount">0</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="notificationDropdown"
                    style="width: 700px;overflow-y: auto; ">
                    <h6 class="dropdown-header">Notifications</h6>
                    <!-- New notifications will be dynamically inserted here -->
                    <div id="notificationItems">
                        <a class="dropdown-item" href="#">No new notifications</a>
                    </div>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/dashboard"><i
                            class="bi bi-speedometer2"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/preDesign"><i
                            class="bi bi-pencil-square"></i> Pre-design</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/consultant"><i
                            class="bi bi-person-badge"></i> Consultant</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/quote"><i
                            class="bi bi-file-earmark-text"></i> Quote</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/contract"><i
                            class="bi bi-file-earmark"></i> Contracts</a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#projectSubmenu"
                        aria-expanded="false" aria-controls="projectSubmenu">
                        <i class="bi bi-diagram-3"></i> Projects
                    </a>
                    <ul class="collapse" id="projectSubmenu">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/manager/projects"><i
                                    class="bi bi-diagram-3"></i> Projects List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/manager/design"><i
                                    class="bi bi-pencil-square"></i> Design</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/manager/construction"><i
                                    class="bi bi-tools"></i> Construction</a>
                        </li>
                    </ul>
                </li>

                <!-- Manage User section with submenu -->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#manageUserSubmenu"
                        aria-expanded="false" aria-controls="manageUserSubmenu">
                        <i class="bi bi-people"></i> Manage User
                    </a>
                    <ul class="collapse" id="manageUserSubmenu">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/manager/manageCustomer"><i
                                    class="bi bi-person-circle"></i> Manage Customer</a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link" href="${pageContext.request.contextPath}/manager/manageStaff"><i
                                    class="bi bi-person-badge"></i> Manage Staff</a>
                        </li>

                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/terms"><i
                            class="bi bi-file-earmark-text"></i> Terms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/services"><i
                            class="bi bi-tools"></i> Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/serviceDetails"><i
                            class="bi bi-file-earmark-text"></i> Services Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/parcel"><i
                            class="bi bi-box"></i> Package</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/staff/blogs">
                        <i class="bi bi-newspaper"></i> Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/manager/payment">
                        <i class="fa fa-money-bill-wave"></i> Payment History</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-bar-chart-line"></i> Reports</a>
                </li>

            </ul>
        </nav>

        <div class="logout-section">
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout"><i
                    class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </aside>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.0/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
<script>

    // Function to fetch new notifications for manager
    function fetchNotifications() {
        $.ajax({
            url: '/api/notifications/new/manage', // Assuming the URL is correct
            method: 'POST',
            success: function (data) {
                console.log(data);
                if (data && data.length > 0) {
                    updateNotificationDropdown(data);
                    updateNotificationCount(data.length);
                } else {
                    updateNotificationDropdown([]); // No new notifications
                    updateNotificationCount(0);
                }
            },
            error: function (err) {
                console.error("Failed to fetch notifications:", err);
            }
        });
    }

    // Update the notification dropdown with new notifications
    function updateNotificationDropdown(notifications) {
        const dropdown = $('#notificationItems');
        dropdown.empty(); // Clear the dropdown content

        if (notifications.length > 0) {
            notifications.forEach(function (notification) {
                console.log(notification.message, notification.createdAt); // Ensure these values are valid

                // Use default values if data is empty or missing
                const message = notification.message || "No message";
                const timeAgo = notification.createdAt ? formatTime(notification.createdAt) : "Unknown time";

                const notificationHtml =
                    '<p class="dropdown-item" >' +
                    '<strong>' + message + '</strong><br>' +
                    '<small>' + timeAgo + '</small>' +
                    '</p>';

                dropdown.append(notificationHtml);
            });
        } else {
            dropdown.append('<a class="dropdown-item" href="#">No new notifications</a>');
        }
    }

    // Update the notification count in the badge
    function updateNotificationCount(count) {
        const notificationCount = $('#notificationCount');
        notificationCount.text(count);

        // Hide the badge if no notifications
        if (count === 0) {
            notificationCount.hide();
        } else {
            notificationCount.show();
        }
    }

    // Helper function to format the time into a human-readable format

    // Poll for new notifications every 10 seconds


    var stompClient = null;

    function connectWebSocket() {
        var socket = new SockJS("/ws-notifications");
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/topic/notifications', function (notification) {
                console.log("Received notification: ", notification.body);

                showNotification(JSON.parse(notification.body));
                updateNotificationCountDisplay();
            }, function (error) {
                console.log('WebSocket connection error:', error);
            });

            socket.onclose = function (event) {
                console.log('WebSocket closed unexpectedly:', event);
            };
        });

  
    }
    function showNotification(notification) {
        const message = notification.message || "No message"; //default value 
        const timeAgo = notification.createdAt ? formatTime(notification.createdAt) : "Unknown Time";
        const notificationHtml =
            '<a class="dropdown-item" href="/details/' + notification.relatedId + '?type=' + notification.fromTable + '">' +
            '<strong>' + message + '</strong><br>' +
            '<small>' + timeAgo + '</small>' +
            '</a>';
        $('#notificationItems').prepend(notificationHtml);
    }
    function updateNotificationCountDisplay() {
        var existingNotificationCount = $('#notificationItems .dropdown-item').length - 1;

        // Calculate the total notification count
        var totalNotificationCount = existingNotificationCount;
        $('#notificationCount').text(totalNotificationCount);
        $('#notificationCount').show();
        // Show or hide the badge based on the count

    }


    function formatTime(dateTime) {
        const date = new Date(dateTime);
        const now = new Date();
        const diffTime = Math.abs(now - date);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        // If less than a day ago, show hours and minutes
        if (diffDays < 1) {
            return date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        }
        // If more than a day ago, show the date
        return date.toLocaleDateString();
    }
    $(document).ready(function () {
        connectWebSocket();
        fetchNotifications();
    });

</script>


