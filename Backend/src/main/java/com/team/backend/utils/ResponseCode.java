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
    USER_PASSWORD_ERROR(600, "密码错误"),
    USER_HAVE_EXIST(700, "用户已存在"),
    USER_NOT_FOUND(800, "用户不存在"),
    UPLOAD_FILE_FAIL(900, "上传文件失败"),
    ADDRESS_NOT_EXIST(1000, "地址不存在"),
    USER_FREEZE(1100, "用户被冻结");

    private final Integer code;
    private final String message;
}
