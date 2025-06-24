package com.team.backend.exception;

import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 14:55
 * @Description: 全局异常配置
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 运行时异常处理
     *
     * @param e
     * @return
     */
    @ExceptionHandler
    public Result<String> runtimeException(RuntimeException e) {
        return Result.fail(ResponseCode.ERROR, e.getMessage());
    }

    /**
     * 兜底异常处理
     *
     * @param e
     * @return
     */
    @ExceptionHandler
    public Result<String> exception(Throwable e) {
        return Result.fail(ResponseCode.ERROR, e.getMessage());
    }

    /**
     * 自定义异常处理
     *
     * @param e
     * @return
     */
    @ExceptionHandler
    public Result<String> serviceExceptionHandler(ServiceExceptionHandler e) {
        return Result.fail(e.getResponseCode());
    }
}

