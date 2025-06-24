package com.team.backend.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 14:33
 * @Description:
 */
@Getter
@AllArgsConstructor
public enum ResponseCode {
    SUCCESS(200, "成功"),
    ERROR(300, "失败"),
    USER_NAME_NULL(400, "用户名是空的"),
    USER_NOT_EXIST(500, "用户是空的"),
    USER_PASSWORD_ERROR(600, "密码错误");

    private final Integer code;
    private final String message;
}
