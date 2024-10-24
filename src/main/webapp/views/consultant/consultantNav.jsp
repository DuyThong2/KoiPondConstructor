<header class="navbar">
    <div class="d-flex align-items-center">

        <a href="${pageContext.request.contextPath}/consultant/viewConsultantList" class="nav-link">
            <i class="fas fa-user-tie"></i> Consultant
        </a>
        <a href="${pageContext.request.contextPath}/consultant/contract"
           class="nav-link ">
            <i class="fas fa-file-contract"></i> Contract
        </a>
        <a href="${pageContext.request.contextPath}/consultant/quote"
           class="nav-link ">
            <i class="fas fa-quote-left"></i> Quote
        </a>
        <a href="${pageContext.request.contextPath}/consultant/serviceQuote"
           class="nav-link">
            <i class="fas fa-tools"></i> Service Quote
        </a>
    </div>

    <div class="d-flex align-items-center position-relative">
        <!-- Notification Dropdown -->
        <div class="dropdown">
            <a class="nav-link dropdown-toggle icon-link" href="#" id="notificationDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell"></i>
                <span class="badge-note">3</span>
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

        <!-- User Profile Dropdown -->
        <div class="dropdown">
            <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" id="userDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiContructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt="User Avatar" class="rounded-circle" width="40">
                <span class="ml-2">${user.name}</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/consultant/profile"><i class="fas fa-user"></i> Profile</a></li>
                <li><a class="dropdown-item" href="#"><i class="fas fa-paint-brush"></i> Theme</a></li>
                <li><a class="dropdown-item" href="#"><i class="fas fa-question-circle"></i> Help</a></li>
                <li class="dropdown-divider"></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="dropdown-item btn-logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</header>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get the current URL path
        var currentPath = window.location.pathname;

        // Get all the nav links
        var navLinks = document.querySelectorAll('.nav-link');

        // Loop through each link and check if the href matches the current path
        navLinks.forEach(function(link) {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
        });
    });
</script>