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
    private String commentId;
    // 评论内容
    private String content;
    // 评论所属用户ID
    private String userId;
    // 评论所属文章ID
    private String postId;
    // 回复的目标评论ID
    private String replyToCommentId;
    // 子评论列表
    @TableField(exist = false)
    private List<Comment> replies;
    // 创建时间
    private String createTime;
    //修改时间
    private String updateTime;
    // 删除状态
    private int deleted;
}
