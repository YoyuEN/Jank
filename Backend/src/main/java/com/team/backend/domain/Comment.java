package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/23
 * @Time: 16:30
 * @Description: 评论
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    // 评论唯一标识
    private Integer ID;
    // 评论内容
    private String content;
    // 评论所属用户ID
    private Integer userID;
    // 评论所属文章ID
    private Integer postID;
    // 回复的目标评论ID
    private Integer replyToCommentId;
    // 子评论列表
    @TableField(exist = false)
    private List<Comment> replies;
}
