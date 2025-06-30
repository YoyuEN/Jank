package com.team.backend.domain.vo;

import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 包含用户信息的评论VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentWithUserVO {
    /**
     * 评论ID
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
     * 创建时间
     */
    private LocalDateTime createTime;

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
        CommentWithUserVO vo = new CommentWithUserVO();
        vo.setId(comment.getId().toString());
        vo.setContent(comment.getContent());
        vo.setUserId(comment.getUserId());
        vo.setPostId(comment.getPostId());
        vo.setReplyToCommentId(comment.getReplyToCommentId());
        vo.setCreateTime(comment.getCreateTime());
        vo.setUserInfo(UserInfoVO.fromUser(user));
        return vo;
    }
}
