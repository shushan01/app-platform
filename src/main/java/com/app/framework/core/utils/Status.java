package com.app.framework.core.utils;

public enum Status {

    SUCCESS(0, "success"),

    //shiro
    USER_NOT_EXISTS(10020, "用户不存在"),
    USER_NOT_LOGINED(10004, "用户未登录"),
    USER_ALREADY_EXISTS(10024, "用户已存在"),
    INVALID_PERMISSION(10021, "非法权限"),
    FAIL_TO_GRANT_GRAPH_SCHEMA(10022, "资源分配失败"),
    INVALID_TARGET_USER(10023, "非法目标用户"),
    TOO_MANY_LOGIN_ATTEMPT(10025, "超过最大登录失败次数"),
    NAME_PASSWD_MISMATCH(10001, "用户名或密码错误"),
    //mysql
    DUPLICATE_KEY(10080, "重复的名字或主键值");


    private int code;
    private String msg;

    Status(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int code() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String msg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static Status getByCode(int code) {
        for (Status s : Status.values()) {
            if (code == s.code()) {
                return s;
            }
        }
        return Status.SUCCESS;
    }
}
