package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.models.security.SecurityScheme;
import lombok.Data;

import java.time.LocalDateTime;

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
    @TableId
    private String commentId;

    // 评论所属用户ID
    private String userId;

    private String username;

    private String replyToCommentId;

    // 评论所属文章ID
    private String postId;

    private String rootParentId;

    private String avatar;

    // 评论内容
    private String content;

    // 父评论ID，如果是顶级评论则为null
    private String parentId;

    private Integer goodorbad;

    // 创建时间
    private String createTime;
    private String updateTime;

//    @TableLogic
    private Integer deleted;
}