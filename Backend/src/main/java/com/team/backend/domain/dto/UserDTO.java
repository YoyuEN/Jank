package com.team.backend.domain.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/23
 * @Time: 16:39
 * @Description: 账户信息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("user")
public class UserDTO {
    @TableId
    private String userId;
    // 用户昵称
    private String nickname;
    // 用户名称
    private String username;
    // 用户头像
    private String avatar;
    // 用户邮箱
    private String email;
    // 用户密码
    private String password;
    // 用户手机号
    private String phone;
    // 冻结状态
    private Integer freeze;
    //地址
    private List<Integer> address;
    // 访问令牌
    private String accessToken;
    // 刷新令牌
    private String refreshToken;
    // 创建时间
    private LocalDateTime createTime;
    //修改时间
    private LocalDateTime updateTime;
    // 删除状态
    private int deleted;

}
