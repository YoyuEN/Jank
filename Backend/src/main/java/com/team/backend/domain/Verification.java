package com.team.backend.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/23
 * @Time: 16:46
 * @Description: 图片验证码
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Verification {
    // 图片的base64编码
    private String ImgBase64;
}
