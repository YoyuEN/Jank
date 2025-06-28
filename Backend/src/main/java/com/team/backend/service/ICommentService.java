package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Comment;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description: 评论服务接口
 */
public interface ICommentService extends IService<Comment> {
    /**
     * 添加评论
     * @param comment 评论信息
     * @return 是否添加成功
     */
    boolean addComment(Comment comment);

    /**
     * 根据帖子ID获取评论列表（平铺结构）
     * @param postId 帖子ID
     * @return 评论列表
     */
    List<Comment> getCommentsListByPostId(Long postId);

    /**
     * 根据帖子ID获取带有嵌套结构的评论列表
     * @param postId 帖子ID
     * @return 带有子评论的评论列表（树状结构）
     */
    List<Comment> getNestedCommentsListByPostId(Long postId);
}
