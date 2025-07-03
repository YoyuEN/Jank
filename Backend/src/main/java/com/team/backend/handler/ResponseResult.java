package com.team.backend.handler;


import java.io.Serializable;

/**
 * 通用API响应结果类
 * @param <T> 数据类型
 */
public class ResponseResult<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    private boolean success;
    private String message;
    private T data;

    public ResponseResult(boolean success, String message, T data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    // Getters and setters
    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    // 静态工厂方法
    public static <T> ResponseResult<T> success() {
        return new ResponseResult<>(true, "操作成功", null);
    }

    public static <T> ResponseResult<T> success(T data) {
        return new ResponseResult<>(true, "操作成功", data);
    }

    public static <T> ResponseResult<T> success(String message, T data) {
        return new ResponseResult<>(true, message, data);
    }
}