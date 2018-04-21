package com.app.framework.auth.controller;

import com.app.framework.auth.service.UserService;
import com.app.framework.core.utils.Md5SaltUtil;
import com.app.framework.core.utils.Status;
import com.app.framework.auth.model.EditPasswordParam;
import com.app.framework.auth.model.LoginUser;
import com.app.framework.core.utils.PageResult;
import com.app.framework.core.utils.Response;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;


@RestController
public class AccountController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    @SuppressWarnings("unchecked")
    public Response login(@RequestParam(name = "name") String name, @RequestParam(name = "password") String password) {
        SecurityUtils.getSubject().login(new UsernamePasswordToken(name, password));
//        LoginUser user = SecurityUtils.getSubject().getPrincipals().oneByType(LoginUser.class);
        return new Response(Status.SUCCESS.code(), Status.SUCCESS.msg());
    }

    @RequestMapping("/findAll")
    @SuppressWarnings("unchecked")
    public PageResult<LoginUser> findAll(int pageNo, int pageSize) {
        return userService.findAll(pageNo, pageSize);
    }

    @PostMapping("/logout")
    public Response logout() {
        Subject subject = SecurityUtils.getSubject();
        PrincipalCollection principals = subject.getPrincipals();
        if (principals != null) {
            subject.logout();
        }
        return new Response(Status.SUCCESS.code(), Status.SUCCESS.msg());
    }

    @PostMapping("/editpwd")
    @RequiresAuthentication
    public Response editPassword(@RequestBody @Valid EditPasswordParam editPasswordParam) throws NoSuchAlgorithmException, InvalidKeySpecException {
        Subject subject = SecurityUtils.getSubject();
        editPassword(subject, editPasswordParam);
        return new Response(Status.SUCCESS.code(), Status.SUCCESS.msg());
    }

    private void editPassword(Subject subject, EditPasswordParam editPasswordParam) {
        LoginUser authUser = subject.getPrincipals().oneByType(LoginUser.class);
        String oldPasswd = authUser.getPassword();
        if (!Md5SaltUtil.validPassword(editPasswordParam.getOldPassword(), oldPasswd)) {
            throw new IncorrectCredentialsException(Status.NAME_PASSWD_MISMATCH.msg() +
                    "(" + authUser.getUserName() + ", " + editPasswordParam.getOldPassword() + ")");
        }
        String newPassword = Md5SaltUtil.getEncryptedPwd(editPasswordParam.getNewPassword());
        userService.updatePassword(authUser.getUserName(), newPassword);
    }

}
