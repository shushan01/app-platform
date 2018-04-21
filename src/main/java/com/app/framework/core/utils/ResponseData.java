package com.app.framework.core.utils;

/**
 * Created by yangyijun on 2018/4/13.
 */
public final class ResponseData<T> extends Response {
    private T data;

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
