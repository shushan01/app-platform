package com.app.framework.auth.filter;

import com.app.framework.core.utils.Log;
import com.app.framework.core.utils.LoggerFactory;
import com.app.framework.core.utils.Response;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Log logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);


    //shiro异常处理
    @ExceptionHandler({AuthenticationException.class, AuthorizationException.class})
    public Response handleException(HttpServletRequest request, HttpServletResponse response, ShiroException exception) throws Exception {
        Integer responseCode = HttpStatus.UNAUTHORIZED.value();
        if (exception instanceof UnknownAccountException) {

        } else if (exception instanceof IncorrectCredentialsException) {

        } else if (exception instanceof UnauthenticatedException) {

        } else if (exception instanceof UnauthorizedException) {

        } else if (exception instanceof ExcessiveAttemptsException) {

        } else {

        }
        return null;
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Response handleException(HttpServletRequest request, IllegalArgumentException exception) throws Exception {
        return null;
    }

    //参数绑定异常处理
    @ExceptionHandler(BindException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Response handleException(HttpServletRequest request, BindException exception) throws Exception {
        List<FieldError> fieldErrors = exception.getFieldErrors();
        logException(request, exception, HttpStatus.BAD_REQUEST.value());
        return null;
    }

    //@Valid异常处理
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Response handleException(HttpServletRequest request, MethodArgumentNotValidException exception) throws Exception {
        List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
        logException(request, exception, HttpStatus.BAD_REQUEST.value());
        return null;
    }

    //@RequestParam异常处理
    @ExceptionHandler(MissingServletRequestParameterException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Response handleException(HttpServletRequest request, MissingServletRequestParameterException exception) throws Exception {
        logException(request, exception, HttpStatus.BAD_REQUEST.value());
        return null;
    }


    private void logException(HttpServletRequest request, Throwable throwable, int errorCode) throws IOException {
    }

}
