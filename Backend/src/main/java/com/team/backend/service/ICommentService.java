package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Comment;
import com.team.backend.domain.vo.CommentVO;
import com.team.backend.domain.vo.CommentWithUserVO;
import com.team.backend.handler.ResponseResult;

import java.util.List;
import java.util.Map;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description: 评论服务接口
 */
public interface ICommentService extends IService<Comment> {
    ResponseResult getArticleRatingStats(String articleId);

    /**
     * 添加评论
     * @param comment 评论信息
     * @return 是否添加成功
     */
    boolean addComment(Comment comment);
    CommentVO addComment(String userId, String postId, String content, String parentId);

    /**
     * 根据帖子ID获取评论列表（平铺结构）
     * @param postId 帖子ID
     * @return 评论列表
     */
    List<Comment> getCommentsListByPostId(String postId);
    //保存评论
    void saveComment(Comment comment);

    List<CommentVO> getCommentsByArticleId(String postId);

    Map<String, Integer> getCommentStatistics(String articleId);
}
