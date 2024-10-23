<div class="side-bar">
    <div class="user-info">
        <img class="img-profile img-circle img-responsive center-block"
             src="${user.imgURL != null ? user.getShowingImg(user.imgURL) : "/SWPKoiConstructor/assets/imgs/logo/final_resized_colored_logo_image.png"}" alt />
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
            <li class="${pageContext.request.requestURI.contains('/customer/profile') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/profile"><span class="fa fa-user"></span> Profile</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/consultant') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/consultant"><span class="bi bi-briefcase"></span> My Consultant</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/contract') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/contract"><span class="fas fa-file-contract"></span> My Contract</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/projects/') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/projects/"><span class="fas fa-project-diagram"></span> My Project</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/quote') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/quote"><i class="bi bi-file-earmark-text"></i> Quotes</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/serviceQuote') ? 'active' : ''}">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/customer/serviceQuote"><i class="fa fa-file-invoice"></i> Service Quotes</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/serviceDetails/') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/serviceDetails/"><span class="bi bi-bar-chart-line"></span> Service</a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/customer/payment') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/customer/payment"><i class="fa fa-money-bill-wave"></i> Payment History</a>
            </li>

        </ul>
    </nav>
</div>