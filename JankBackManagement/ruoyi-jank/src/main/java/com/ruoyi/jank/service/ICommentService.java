package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.Category;
import com.ruoyi.jank.domain.Comment;
import com.ruoyi.jank.domain.dto.CommentDto;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */

public interface ICommentService extends IService<Comment> {
    List<CommentDto> selectCommentList(Comment comment);
    List<Comment> selectCommentWithUserAndPost(Comment comment);
    List<Comment> getCommentByPostId(String postId);
    List<Comment> getCommentByUserId(String userId);
}
