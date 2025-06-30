package com.team.backend.domain.vo;

import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 包含用户信息的评论VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentWithUserVO {
    /**
     * 评论ID（对应数据库的comment_id字段）
     */
    private String id;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 帖子ID
     */
    private String postId;

    /**
     * 回复的目标评论ID
     */
    private String replyToCommentId;

    /**
     * 用户信息
     */
    private UserInfoVO userInfo;

    /**
     * 子评论列表
     */
    private List<CommentWithUserVO> replies;

    /**
     * 从Comment对象转换为CommentWithUserVO对象
     * @param comment 评论对象
     * @param user 用户对象
     * @return CommentWithUserVO对象
     */
    public static CommentWithUserVO fromComment(Comment comment, User user) {
        if (comment == null) {
            throw new IllegalArgumentException("Comment cannot be null");
        }
        
        CommentWithUserVO vo = new CommentWithUserVO();
        vo.setId(comment.getId() != null ? comment.getId().toString() : null);
        vo.setContent(comment.getContent());
        vo.setUserId(comment.getUserId());
        vo.setPostId(comment.getPostId());
        vo.setReplyToCommentId(comment.getReplyToCommentId());
        
        // 确保用户信息不为null
        if (user != null) {
            vo.setUserInfo(UserInfoVO.fromUser(user));
        } else {
            // 创建一个空的用户信息对象
            vo.setUserInfo(new UserInfoVO());
        }
        
        // 初始化replies列表
        vo.setReplies(new ArrayList<>());
        return vo;
    }
}
