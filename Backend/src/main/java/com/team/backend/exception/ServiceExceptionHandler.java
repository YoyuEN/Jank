package com.team.backend.exception;

import com.team.backend.utils.ResponseCode;
import lombok.Getter;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 14:53
 * @Description: 自定义异常处理
 */
@Getter
public class ServiceExceptionHandler extends RuntimeException{
    private final ResponseCode responseCode;

    public ServiceExceptionHandler(ResponseCode responseCode) {
        super(responseCode.getMessage());
        this.responseCode = responseCode;
    }
}
