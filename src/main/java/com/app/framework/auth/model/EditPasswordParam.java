package com.app.framework.auth.model;

import org.hibernate.validator.constraints.NotBlank;

public class EditPasswordParam {
    @NotBlank
//    @ApiModelProperty(value = "旧密码", required = true)
    private String oldPassword;

    @NotBlank
//    @ApiModelProperty(value = "新密码", required = true)
    private String newPassword;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}
