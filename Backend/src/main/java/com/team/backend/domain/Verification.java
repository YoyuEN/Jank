package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
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
    @TableId
    private String verificationId;
    // 图片的base64编码
    private String ImgBase64;
    // 创建时间
    private String createTime;
    //修改时间
    private String updateTime;
    // 删除状态
//    @TableLogic
    private int deleted;
}
