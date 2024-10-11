package com.example.SWPKoiContructor.configs.filter;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
@WebFilter("/*") // Intercepts all incoming requests
public class SessionTimeoutFilter implements javax.servlet.Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);  // Get the session but don't create a new one
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String requestURI = httpRequest.getRequestURI();
        // Check if the session is invalid or if the user is not authenticated
        if (requestURI.startsWith("/customer/") || requestURI.startsWith("/manager/") || 
            requestURI.startsWith("/consultant/") || requestURI.startsWith("/designer/") ||
            requestURI.startsWith("/constructor/") || requestURI.startsWith("/staff/")) {

            // Check if the session is invalid or if the user is not authenticated
            if (session == null || session.getAttribute("user")==null|| auth == null || !auth.isAuthenticated() || auth.getPrincipal().equals("anonymousUser")) {
                // Clear the security context (remove authentication and authorization)
                SecurityContextHolder.clearContext();
               

                // Redirect to the login page if the session has expired or the user is not authenticated
                httpResponse.sendRedirect("/login?expired=true");
                return;
            }
        }

        // If session and security context are valid, continue with the request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Clean up logic if needed
    }
}
