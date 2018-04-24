package com.app.framework.auth.model;

import io.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public class LoginPara {
    @NotBlank(message = "用户名不能为空")
    @ApiModelProperty(value = "用户名", required = true)
    private String userName;
    @NotBlank(message = "密码不能为空")
    @ApiModelProperty(value = "密码", required = true)
    private String password;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
