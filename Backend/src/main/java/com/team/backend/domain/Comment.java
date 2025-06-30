package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description: 评论实体类
 */
@Data
@TableName("comment")
public class Comment {
    /**
     * 评论ID
     * 使用AUTO策略，依赖数据库的自增功能
     */
    @TableId(value = "comment_id", type = IdType.AUTO)
    private Long id;  // 保留Long类型，因为数据库使用自增ID

    /**
     * 评论内容
     */
    private String content;

    /**
     * 用户ID
     */
    @TableField("user_id")
    private String userId;

    /**
     * 帖子ID
     */
    @TableField("post_id")
    private String postId;

    /**
     * 回复的目标评论ID
     */
    @TableField("reply_to_comment_id")
    private String replyToCommentId;

    /**
     * 创建时间
     * 数据库中可能没有此字段
     */
    @TableField(exist = false)
    private LocalDateTime createTime;

    /**
     * 更新时间
     * 数据库中可能没有此字段
     */
    @TableField(exist = false)
    private LocalDateTime updateTime;

    /**
     * 是否删除
     */
    private Integer deleted;

    /**
     * 子评论列表
     * 数据库中不存在此字段，用于构建评论树
     */
    @TableField(exist = false)
    private List<Comment> replies;
}
