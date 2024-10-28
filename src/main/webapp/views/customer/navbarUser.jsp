<div class="side-bar">
    <div class="user-info">
        <c:choose>
            <c:when test="${user.imgURL != null}">
                <img class="img-profile img-circle img-responsive center-block"
                     src="${user.getShowingImg(user.imgURL)}" alt />
            </c:when>
            <c:otherwise>
                <img class="img-profile img-circle img-responsive center-block"
                     src="${pageContext.request.contextPath}/assets/imgs/logo/final_resized_colored_logo_image.png" alt />
            </c:otherwise>
        </c:choose>

        <ul class="meta list list-unstyled">
            <li class="name">
                ${user.name}
                <br>
                <label class="label label-info">Customer</label>
            </li>
            <li class="email">
                <a href="#"><span>${user.email}</span></a>
            </li>
        </ul>
    </div>
    <nav class="side-menu">
        <ul class="nav">
            <li>
                <a href="${pageContext.request.contextPath}/customer/profile"><span class="fa fa-user"></span> Profile</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/customer/consultant"><span class="bi bi-briefcase"></span> My Consultant</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/customer/contract"><span class="fas fa-file-contract"></span> My Contract</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/customer/projects/"><span class="fas fa-project-diagram"></span> My Project</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/customer/quote"><i class="bi bi-file-earmark-text"></i> Quotes</a>
            </li>
            <li>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/customer/serviceQuote"><i class="fa fa-file-invoice"></i> Service Quotes</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/customer/serviceDetails/"><span class="bi bi-bar-chart-line"></span> Service</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/customer/payment"><i class="fa fa-money-bill-wave"></i> Payment History</a>
            </li>

        </ul>
    </nav>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Get the current URL path
        var currentPath = window.location.pathname;

        // Get all the <a> elements inside the sidebar's navigation
        var navLinks = document.querySelectorAll('.side-menu a');

        // Loop through each link and check if the href matches the current path
        navLinks.forEach(function(link) {
            if (link.getAttribute('href') === currentPath) {
                link.parentElement.classList.add('active'); // Add 'active' to the <li> element
            }
        });
    });
</script>

