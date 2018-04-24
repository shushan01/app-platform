package com.app.framework.auth.controller;

import com.app.framework.auth.model.EditPasswordParam;
import com.app.framework.auth.model.LoginPara;
import com.app.framework.auth.model.LoginUser;
import com.app.framework.auth.service.UserService;
import com.app.framework.base.BaseController;
import com.app.framework.core.utils.Md5SaltUtil;
import com.app.framework.core.utils.Response;
import com.app.framework.core.utils.Status;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;


@RestController
public class AccountController extends BaseController {

    @Autowired
    private UserService userService;

    @ApiOperation(value = "用户登录接口", notes = "用户登录接口")
    @PostMapping("/login")
    @SuppressWarnings("unchecked")
    public Response login(@RequestBody @Valid LoginPara loginPara) {
        SecurityUtils.getSubject().login(new UsernamePasswordToken(loginPara.getUserName(), loginPara.getPassword()));
        return new Response(Status.SUCCESS.code(), Status.SUCCESS.msg());
    }

    @ApiOperation(value = "退出登录", notes = "退出登录")
    @PostMapping("/logout")
    public Response logout() {
        Subject subject = SecurityUtils.getSubject();
        PrincipalCollection principals = subject.getPrincipals();
        if (principals != null) {
            subject.logout();
        }
        return new Response(Status.SUCCESS.code(), Status.SUCCESS.msg());
    }

    @ApiOperation(value = "修改密碼", notes = "修改密碼")
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
            throw new IncorrectCredentialsException(Status.ACCOUNT_PASSWORD_ERROR.msg() +
                    "(" + authUser.getUserName() + ", " + editPasswordParam.getOldPassword() + ")");
        }
        String newPassword = Md5SaltUtil.getEncryptedPwd(editPasswordParam.getNewPassword());
        userService.updatePassword(authUser.getUserName(), newPassword);
    }

}
