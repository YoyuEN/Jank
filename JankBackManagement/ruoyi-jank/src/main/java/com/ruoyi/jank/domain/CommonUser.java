package com.ruoyi.jank.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
/**
 * author: wuyinai
 * date: 2025/6/24
 */
/**
 -- auto-generated definition
 create table user
 (
 user_id       varchar(64)                        not null comment '主键ID'
 primary key,
 nickname      varchar(100)                       null comment '用户昵称',
 email         varchar(255)                       null comment '用户邮箱',
 username      varchar(50)                        null,
 password      varchar(50)                        null,
 phone         varchar(20)                        null comment '用户手机号',
 access_token  text                               null comment '访问令牌',
 refresh_token text                               null comment '刷新令牌',
 create_time   datetime default CURRENT_TIMESTAMP null comment '创建时间',
 update_time   datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
 deleted       int      default 0                 null comment '是否删除',
 constraint email
 unique (email),
 constraint phone
 unique (phone)
 )
 comment '账户表';
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
//用户管理
@TableName("user")
public class CommonUser implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private String userId;
    private String nickname;
    private String email;
    private String username;
    private String password;
    private String phone;
    private String accessToken;
    private String refreshToken;
    private String createTime;
    private String updateTime;
    @TableLogic
    private Integer deleted;

}
