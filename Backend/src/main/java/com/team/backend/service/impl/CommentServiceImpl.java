package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.CommentWithUserVO;
import com.team.backend.mapper.CommentMapper;
import com.team.backend.service.ICommentService;
import com.team.backend.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private IUserService userService;
    @Override
    public boolean addComment(Comment comment) {
        return save(comment);
    }

    @Override
    public List<Comment> getCommentsListByPostId(String postId) {
        // 按创建时间倒序排序，确保最新评论在前面
        return query()
                .eq("post_id", postId)
                .eq("deleted", 0)
                .orderByDesc("comment_id")  // 使用comment_id替代create_time进行排序
                .list();
    }

    @Override
    public List<Comment> getNestedCommentsListByPostId(String postId) {
        // 1. 获取指定帖子的所有未删除的评论，按ID倒序排序（较新的评论ID较大）
        List<Comment> allComments = query()
                .eq("post_id", postId)
                .eq("deleted", 0)
                .orderByDesc("comment_id")  // 使用comment_id替代create_time进行排序
                .list();

        // 2. 构建评论树
        // 2.1 找出所有顶级评论（没有回复目标的评论）
        List<Comment> rootComments = allComments.stream()
                .filter(comment -> comment.getReplyToCommentId() == null)
                .collect(Collectors.toList());

        // 2.2 创建一个Map，key是评论ID，value是评论对象，方便快速查找
        Map<String, Comment> commentMap = new HashMap<>();
        allComments.forEach(comment -> commentMap.put(comment.getId().toString(), comment));

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

    @Override
    public List<CommentWithUserVO> getNestedCommentsWithUserByPostId(String postId) {
        // 1. 获取所有评论
        List<Comment> allComments = query()
                .eq("post_id", postId)
                .eq("deleted", 0)
                .orderByDesc("comment_id")  // 使用comment_id替代create_time进行排序
                .list();

        // 2. 获取所有相关用户ID
        List<String> userIds = allComments.stream()
                .map(Comment::getUserId)
                .distinct()
                .collect(Collectors.toList());

        // 3. 获取所有相关用户信息并创建用户Map
        Map<String, User> userMap = new HashMap<>();
        for (String userId : userIds) {
            User user = userService.getById(userId);
            if (user != null) {
                userMap.put(userId, user);
            }
        }

        // 4. 转换评论为带用户信息的VO对象
        Map<String, CommentWithUserVO> commentVOMap = new HashMap<>();
        List<CommentWithUserVO> rootComments = new ArrayList<>();

        // 4.1 转换所有评论为VO对象
        for (Comment comment : allComments) {
            User user = userMap.get(comment.getUserId());
            CommentWithUserVO commentVO = CommentWithUserVO.fromComment(comment, user);
            commentVOMap.put(comment.getId().toString(), commentVO);

            // 如果是顶级评论，添加到根评论列表
            if (comment.getReplyToCommentId() == null) {
                rootComments.add(commentVO);
            }
        }

        // 4.2 构建评论树
        for (Comment comment : allComments) {
            if (comment.getReplyToCommentId() != null) {
                CommentWithUserVO parentVO = commentVOMap.get(comment.getReplyToCommentId());
                CommentWithUserVO currentVO = commentVOMap.get(comment.getId().toString());
                if (parentVO != null && currentVO != null) {
                    if (parentVO.getReplies() == null) {
                        parentVO.setReplies(new ArrayList<>());
                    }
                    parentVO.getReplies().add(currentVO);
                }
            }
        }

        return rootComments;
    }
}
