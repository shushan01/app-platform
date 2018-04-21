package com.app.framework.core.utils;

/**
 * Created by yangyijun on 2018/4/13.
 */
public class Response {
    public int code;
    public String msg;

    public Response(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Response() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
