<link href="<c:url value='/css/bell.css'/>" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.0/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>

<div class="dropdown">
    <a class="icon-link dropdown-toggle" href="#" id="notificationDropdown" role="button" data-toggle="dropdown"
        aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-bell" style="font-size: 23px; margin: 6px 20px 0 4px"></i>
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

<script>
    console.log("Dropdown items after update:", $('#notificationItems').html());
    $('#notificationDropdown').on('click', function (e) {
        console.log("clicking")
        e.preventDefault();
        $('#notificationItems').toggleClass('show');  // Toggle dropdown open/close
    });
    var customerId = ${ user.id };
    console.log(customerId);
    var stompClient = null;
    $(document).ready(function () {
        function connectWebSocket() {
            var socket = new SockJS("${pageContext.request.contextPath}/ws-notifications");
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/customer/' + customerId, function (notification) {
                    console.log("Subscribed to topic:", '/topic/customer/' + customerId);
                    console.log("Received notification: ", notification.body);
                    showNotificationWebSocket(JSON.parse(notification.body));
                    updateNotificationCountDisplay();
                });
            }, function (error) {
                console.log('WebSocket connection error:', error);
                setTimeout(connectWebSocket, 5000); // Retry connection after 5 seconds
            });
        }





        function fetchNotifications() {
            console.log('Fetch data');
            $.ajax({
                url: '${pageContext.request.contextPath}/api/notifications/${user.id}',
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
            success: function (response) {
                console.log("Notification marked as read");

                window.location.href = href;

            },
            error: function (xhr, status, error) {
                console.log("Error marking notification as read:", error);

                window.location.href = href;
            }
        });
    }
    function markAllAsRead() {
        $.ajax({
            url: '${pageContext.request.contextPath}/api/notifications/markAllAsRead/' + customerId,
            method: 'PUT',
            success: function (response) {
                console.log("All notifications marked as read");
                $('#notificationItems .dropdown-item').remove();
                updateNotificationCount(0);
            },
            error: function (xhr, status, error) {
                console.log("Error marking all notifications as read:", error);
            }
        });
    } function updateNotificationDropdown(notifications) {
        const dropdown = $('#notificationItems');
        dropdown.empty();

        if (notifications.length > 0) {
            notifications.forEach(function (notification) {
                const message = notification.message || "No message";
                const timeAgo = notification.createdAt ? formatTime(notification.createdAt) : "Unknown Time";
                const viewDetailLink = "${pageContext.request.contextPath}/customer/" + notification.fromTable + "/detail/" + notification.relatedId;


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
    function showNotificationWebSocket(notification) {
        console.log("Processing notification:", notification);
        $(".no-notification").remove();  // Remove the "no notification" message
        const message = notification.message || "No message";
        const timeAgo = notification.createdAt ? formatTime(notification.createdAt) : "Unknown Time";
        const viewDetailLink = "${pageContext.request.contextPath}/customer/" + notification.fromTable + "/detail/" + notification.relatedId;
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

</script>