package com.ruoyi.jank.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * author: wuyinai
 * date: 2025/6/24
 */

/**
 * -- auto-generated definition
 * create table post
 * (
 *     post_id      varchar(64)                          not null comment '帖子唯一标识'
 *         primary key,
 *     title        varchar(255)                         not null comment '帖子标题',
 *     image        varchar(500)                         null comment '帖子封面图片URL',
 *     visibility   tinyint(1) default 1                 null comment '帖子可见性状态',
 *     content_html mediumtext                           null comment '帖子HTML格式内容',
 *     category_id  varchar(64)                          null comment '帖子所属分类ID',
 *     created_at   datetime   default CURRENT_TIMESTAMP null comment '创建时间',
 *     updated_at   datetime   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
 *     deleted      int        default 0                 null comment '是否删除'
 * )
 *     comment '帖子表' row_format = DYNAMIC;
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
//帖子
public class Post implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private String postId;
    private String title;
    private String image;
    private Integer visibility;
    private String contentHtml;
    private String categoryId;
    private String createdAt;
    private String updatedAt;
    @TableLogic
    private Integer deleted;
}
