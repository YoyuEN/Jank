package com.team.backend.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.team.backend.domain.Comment;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentVO implements Serializable {
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

}
