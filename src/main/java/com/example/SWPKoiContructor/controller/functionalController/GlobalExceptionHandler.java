package com.example.SWPKoiContructor.controller.functionalController;

import com.example.SWPKoiContructor.exception.AccountIsExistException;
import com.example.SWPKoiContructor.exception.ResourceNotExistException;
import com.example.SWPKoiContructor.exception.UserErrorSyntaxException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

    // Handle 404 Not Found
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handleNotFound(NoHandlerFoundException ex, Model model) {
        System.out.println("match");
        model.addAttribute("errorMessage", "Page not found");
        return "error/error-404"; // Error page for 404
    }

    // Handle 403 Forbidden (Access Denied)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ExceptionHandler(AccessDeniedException.class)
    public String handleForbidden(AccessDeniedException ex, Model model) {
        model.addAttribute("errorMessage", "Access denied");
        return "error/error-403"; // Error page for 403
    }



    // Handle 500 Internal Server Error
//    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//    @ExceptionHandler(Exception.class)
//    public String handleInternalError(Exception ex, Model model) {
//        model.addAttribute("errorMessage", "Internal server error");
//        return "error/error-500"; // Error page for 500
//    }


//    // Handle 400 Bad Request
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
//    @ExceptionHandler(IllegalArgumentException.class)
//    public String handleBadRequest(IllegalArgumentException ex, Model model) {
//        model.addAttribute("errorMessage", "Bad request");
//        return "error/error-400"; // Error page for 400
//    }

    @ExceptionHandler(AccountIsExistException.class)
    public String handleDuplicateEmail(AccountIsExistException ex, Model model) {
        model.addAttribute("message", ex.getMessage());
        return "login"; // Error page for 400
    }
    
    @ExceptionHandler(ResourceNotExistException.class)
    public String handleResourceNotFound(ResourceNotExistException ex, Model model){
        model.addAttribute("errorMessage", ex.getMessage());
        return "error/error-404";
    }
    
//    @ExceptionHandler(UserErrorSyntaxException.class)
//    public String handleBadRequest(UserErrorSyntaxException ex, Model model) {
//        model.addAttribute("errorMessage", "Bad request");
//        return "error/error-400"; // Error page for 400
//    }

    @ExceptionHandler(MultipartException.class)
    public String handleMultipartException(MultipartException ex, Model model) {
        model.addAttribute("errorMessage", "The uploaded file or form data exceeded the allowed limit.");
        return "error/error-400"; // Customize this page as needed
    }
}
