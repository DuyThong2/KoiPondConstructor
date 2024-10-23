
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
                    style="width: 500px;overflow-y: auto; ">
                    <div class="d-flex justify-content-between align-items-center px-3 py-2">
                        <h3 class="dropdown-header h3 text-danger custom-notification-header mb-0">Notifications</h3>
                        <button class="btn btn-sm btn-outline-primary" onclick="markAllAsRead()">Mark All as Read</button>
                    </div>
                    <!-- New notifications will be dynamically inserted here -->
                    <div id="notificationItems">
                        <a class="dropdown-item no-notification" href="#">No new notifications</a>
                    </div>
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/staff/blogs"><i
                            class="bi bi-newspaper"></i> Blog</a>
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
            url: '${pageContext.request.contextPath}/api/notifications/new/manage',
            method: 'POST',
            success: function (data) {
                console.log(data);
                if (data && data.length > 0) {
                    updateNotificationDropdown(data);
                    updateNotificationCount(data.length);
                } else {
                    updateNotificationDropdown([]);
                    updateNotificationCount(0);
                }
            },
            error: function (err) {
                console.error("Failed to fetch notifications:", err);
            }
        });
    }

    function updateNotificationDropdown(notifications) {
        const dropdown = $('#notificationItems');
        dropdown.empty();

        if (notifications.length > 0) {
            notifications.forEach(function (notification) {
                const message = notification.message || "No message";
                const timeAgo = notification.createdAt ? formatTime(notification.createdAt) : "Unknown Time";
                const viewDetailLink = "${pageContext.request.contextPath}/manager/" + notification.fromTable + "/detail/" + notification.relatedId;
                const notificationHtml =
                    '<a class="dropdown-item current-notification" href="' + viewDetailLink + '" ' +
                'data-notification-id="' + notification.id + '" ' +
                'onclick="markAsReadAndNavigate(event, this)">' +
                '<strong>' + message + '</strong><br>' +
                '<small>' + timeAgo + '</small>' +
                '</a>';
                dropdown.append(notificationHtml);
            });
        } else {
            dropdown.append('<a class="dropdown-item no-notification" href="#">No new notifications</a>');
        }
    }

    function updateNotificationCount(count) {
        const notificationCount = $('#notificationCount');
        notificationCount.text(count);
        notificationCount.toggle(count > 0);
    }

    var stompClient = null;
    function connectWebSocket() {
        var socket = new SockJS("${pageContext.request.contextPath}/ws-notifications");
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe('/topic/notifications', function (notification) {
                console.log("Received notification: ", notification.body);
                showNotificationWebSocket(JSON.parse(notification.body));
                updateNotificationCountDisplay();
            });
        }, function (error) {
            console.log('WebSocket connection error:', error);
            setTimeout(connectWebSocket, 5000); // Retry connection after 5 seconds
        });

        socket.onclose = function (event) {
            console.log('WebSocket closed unexpectedly:', event);
            setTimeout(connectWebSocket, 5000); // Retry connection after 5 seconds
        };
    }

    function showNotificationWebSocket(notification) {
        $(".no-notification").remove();  // Remove the "no notification" message
        const message = notification.message || "No message";
        const timeAgo = notification.createdAt ? formatTime(notification.createdAt) : "Unknown Time";
        const viewDetailLink = "${pageContext.request.contextPath}/manager/" + notification.fromTable + "/detail/" + notification.relatedId;
        const notificationHtml =
            '<a class="dropdown-item new-notification" href="' + viewDetailLink + '" ' +
            'data-notification-id="' + notification.id + '" ' +
            'onclick="markAsReadAndNavigate(event, this)">' +
            '<strong>' + message + '</strong><br>' +
            '<small>' + timeAgo + '</small>' +
            '</a>';
        $('#notificationItems').prepend(notificationHtml);

        setTimeout(function () {
            $('#notificationItems .new-notification').first().removeClass('new-notification').addClass('current-notification');
        }, 10000);
    }

    function updateNotificationCountDisplay() {
        var existingNotificationCount = $('#notificationItems .dropdown-item').length;
        var totalNotificationCount = existingNotificationCount;

        console.log(totalNotificationCount);
        $('#notificationCount').text(totalNotificationCount).toggle(totalNotificationCount > 0);
    }

    function formatTime(dateTime) {
        const date = new Date(dateTime);
        const now = new Date();
        const diffTime = Math.abs(now - date);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        if (diffDays < 1) {
            return date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        }
        return date.toLocaleDateString();
    }

    $(document).ready(function () {
        connectWebSocket();
        fetchNotifications();
    });
    function markAsReadAndNavigate(event, element) {
        event.preventDefault();
        const notificationId = element.getAttribute("data-notification-id");
        const href = $(element).attr('href');
        $.ajax({
            url: '${pageContext.request.contextPath}/api/notifications/update/' + notificationId,
            method: 'PUT',
            success: function(response) {
                console.log("Notification marked as read");
                window.location.href = href;
            },
            error: function(xhr, status, error) {
                console.log("Error marking notification as read:", error);
                window.location.href = href;
            }
        });
    }
    function markAllAsRead() {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/notifications/markAllAsRead',
            method: 'PUT',
            success: function(response) {
                console.log("All notifications marked as read");
                $('#notificationItems .current-notification .new-notification').remove();
                updateNotificationCount(0);
            },
            error: function(xhr, status, error) {
                console.log("Error marking all notifications as read:", error);
            }
        });
    }
</script>

