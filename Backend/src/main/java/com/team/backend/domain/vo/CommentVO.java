package com.team.backend.domain.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:40
 * @Description: 评论展示对象
 */
@Data
public class CommentVO {
    // 评论ID
    private Long commentId;

    // 评论用户ID
    private String userId;

    // 评论用户名称
    private String username;

    // 评论用户头像
    private String avatar;

    // 评论内容
    private String content;

    // 父评论ID
    private String parentId;

    // 回复的评论ID
    private String replyToCommentId;

    // 回复的用户名称
    private String replyToUsername;

    // 创建时间
    private LocalDateTime createAt;

    // 子评论列表
    private List<CommentVO> replies;
}