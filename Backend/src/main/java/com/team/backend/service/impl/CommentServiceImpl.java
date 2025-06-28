package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.mapper.CommentMapper;
import com.team.backend.service.ICommentService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description: 评论服务实现类
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
    @Override
    public boolean addComment(Comment comment) {
        return save(comment);
    }

    @Override
    public List<Comment> getCommentsListByPostId(Long postId) {
        return query().eq("post_id", postId).list();
    }

    @Override
    public List<Comment> getNestedCommentsListByPostId(Long postId) {
        // 1. 获取指定帖子的所有评论
        List<Comment> allComments = query().eq("post_id", postId).list();

        // 2. 构建评论树
        // 2.1 找出所有顶级评论（没有回复目标的评论）
        List<Comment> rootComments = allComments.stream()
                .filter(comment -> comment.getReplyToCommentId() == null)
                .collect(Collectors.toList());

        // 2.2 创建一个Map，key是评论ID，value是评论对象，方便快速查找
        Map<Long, Comment> commentMap = new HashMap<>();
        allComments.forEach(comment -> commentMap.put(comment.getId(), comment));

        // 2.3 将子评论添加到父评论的replies列表中
        allComments.stream()
                .filter(comment -> comment.getReplyToCommentId() != null)
                .forEach(comment -> {
                    Comment parentComment = commentMap.get(comment.getReplyToCommentId());
                    if (parentComment != null) {
                        if (parentComment.getReplies() == null) {
                            parentComment.setReplies(new ArrayList<>());
                        }
                        parentComment.getReplies().add(comment);
                    }
                });

        return rootComments;
    }

    //根据用户id查询评论
    @Override
    public List<Comment> getCommentsListByUserId(String userId) {
        if(userId == null) {
            return null;
        }
        return super.list(new LambdaQueryWrapper<Comment>().eq(Comment::getUserId, userId));
    }
}
