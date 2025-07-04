package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.CommentVO;
import com.team.backend.domain.vo.CommentWithUserVO;
import com.team.backend.domain.vo.CommentsVO;
import com.team.backend.domain.vo.StartVO;
import com.team.backend.mapper.CommentMapper;
import com.team.backend.mapper.UserMapper;
import com.team.backend.service.ICommentService;
import com.team.backend.service.IUserService;
import com.team.backend.service.MinioService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;
import com.team.backend.handler.ResponseResult;

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

    @Autowired
    private MinioService minioService;
    @Override
    public void saveComment(Comment comment) {
        baseMapper.insert(comment);
    }

//    @Override
//    public ResponseResult getArticleRatingStats(String articleId) {
//        List<Comment> comments = commentMapper.getCommentsByArticleId(articleId);
//
//        // 统计好评、一般、差评的数量
//        long goodCount = comments.stream()
//                .filter(c -> c.getGoodorbad() >= 4)
//                .count();
//
//        long averageCount = comments.stream()
//                .filter(c -> c.getGoodorbad() >= 2 && c.getGoodorbad() <= 3)
//                .count();
//
//        long badCount = comments.stream()
//                .filter(c -> c.getGoodorbad() <= 1)
//                .count();
//
//        long total = comments.size();
//
//        // 返回统计结果
//        Map<String, Object> result = new HashMap<>();
//        result.put("good", goodCount);
//        result.put("average", averageCount);
//        result.put("bad", badCount);
//        result.put("total", total);
//
//        return ResponseResult.success(result);
//    }

    @Override
    public boolean addComment(Comment comment) {
        return false;
    }


    @Override
    public List<Comment> getCommentsListByPostId(String postId) {

        // 按创建时间倒序排序，确保最新评论在前面
        return query()
                .eq("post_id", postId)
                .eq("deleted", 0)
                .orderByDesc("comment_id")  // 使用comment_id字段进行排序
                .list();
    }

//    @Override
//    public List<Comment> getNestedCommentsListByPostId(String postId) {
//        // 1. 获取指定帖子的所有未删除的评论，按ID倒序排序（较新的评论ID较大）
//        List<Comment> allComments = query()
//                .eq("post_id", postId)
//                .eq("deleted", 0)
//                .orderByDesc("comment_id")  // 使用comment_id字段进行排序
//                .list();
//
//        // 2. 构建评论树
//        // 2.1 找出所有顶级评论（没有回复目标的评论）
//        List<Comment> rootComments = allComments.stream()
//                .filter(comment -> comment.getReplyToCommentId() == null)
//                .collect(Collectors.toList());
//
//        // 2.2 创建一个Map，key是评论ID，value是评论对象，方便快速查找
//        Map<String, Comment> commentMap = new HashMap<>();
//        allComments.forEach(comment -> commentMap.put(comment.getId().toString(), comment));
//
//        // 2.3 将子评论添加到父评论的replies列表中
//        allComments.stream()
//                .filter(comment -> comment.getReplyToCommentId() != null)
//                .forEach(comment -> {
//                    Comment parentComment = commentMap.get(comment.getReplyToCommentId());
//                    if (parentComment != null) {
//                        if (parentComment.getReplies() == null) {
//                            parentComment.setReplies(new ArrayList<>());
//                        }
//                        parentComment.getReplies().add(comment);
//                    }
//                });
//
//        return rootComments;
//    }

//    @Override
//    public List<CommentWithUserVO> getNestedCommentsWithUserByPostId(String postId) {
//        // 1. 获取所有评论
//        List<Comment> allComments = query()
//                .eq("post_id", postId)
//                .eq("deleted", 0)
//                .orderByDesc("comment_id")  // 使用comment_id字段进行排序
//                .list();
//
//        // 2. 获取所有相关用户ID
//        List<String> userIds = allComments.stream()
//                .map(Comment::getUserId)
//                .distinct()
//                .collect(Collectors.toList());
//
//        // 3. 获取所有相关用户信息并创建用户Map
//        Map<String, User> userMap = new HashMap<>();
//        for (String userId : userIds) {
//            User user = userService.getById(userId);
//            if (user != null) {
//                userMap.put(userId, user);
//            }
//        }
//
//        // 4. 转换评论为带用户信息的VO对象
//        Map<String, CommentWithUserVO> commentVOMap = new HashMap<>();
//        List<CommentWithUserVO> rootComments = new ArrayList<>();
//
//        // 4.1 转换所有评论为VO对象
//        for (Comment comment : allComments) {
//            User user = userMap.get(comment.getUserId());
//            CommentWithUserVO commentVO = CommentWithUserVO.fromComment(comment, user);
//            commentVOMap.put(comment.getCommentId().toString(), commentVO);
//
//            // 如果是顶级评论，添加到根评论列表
//            if (comment.getReplyToCommentId() == null) {
//                rootComments.add(commentVO);
//            }
//        }
//
//        // 4.2 构建评论树
//        for (Comment comment : allComments) {
//            if (comment.getReplyToCommentId() != null) {
//                CommentWithUserVO parentVO = commentVOMap.get(comment.getReplyToCommentId());
//                CommentWithUserVO currentVO = commentVOMap.get(comment.getId().toString());
//                if (parentVO != null && currentVO != null) {
//                    if (parentVO.getReplies() == null) {
//                        parentVO.setReplies(new ArrayList<>());
//                    }
//                    parentVO.getReplies().add(currentVO);
//                }
//            }
//        }
//
//        return rootComments;
//    }

    @Override
    public List<Comment> getCommentsByArticleId(String postId) {
        List<Comment> comments = lambdaQuery()
                .eq(Comment::getPostId, postId)
                .list();

        comments.forEach(comment -> {
            User user = userService.getById(comment.getUserId());
            if (user != null) {
                String avatar = user.getAvatar();
                if (avatar != null && !avatar.isEmpty()) {
                    comment.setAvatar(minioService.getPresignedUrl(avatar));
                    comment.setUsername(user.getUsername());
                }
            } else {
                // 可选：设置默认头像或留空
                comment.setAvatar(null); // 或者使用默认图片 URL
            }
        });

        return comments;
    }



    @Override
    public Map<String, Integer> getCommentStatistics(String articleId) {
        List<Comment> comments = getCommentsListByPostId(articleId);
        Map<String, Integer> statistics = new HashMap<>();
        statistics.put("good", 0);
        statistics.put("average", 0);
        statistics.put("bad", 0);

        for (Comment comment : comments) {
            Integer score = comment.getGoodorbad();
            if (score >= 4) {
                statistics.put("good", statistics.get("good") + 1);
            } else if (score >= 2) {
                statistics.put("average", statistics.get("average") + 1);
            } else {
                statistics.put("bad", statistics.get("bad") + 1);
            }
        }
        return statistics;
    }

    //获取评论和星级
    @Override
    public void addCommentgood(CommentsVO params) {
        if (params == null){
            return;
        }
        Comment comment = new Comment();
        comment.setCommentId(UUID.randomUUID().toString());
        comment.setPostId(params.getPostId());
        comment.setUserId(params.getUserId());
        comment.setUsername(params.getUsername());
        comment.setGoodorbad(params.getGoodorbad());
        comment.setContent(params.getContent());
        super.save(comment);
    }

    @Override
    public StartVO getCommentsStarts(String postId) {
        if (postId == null){
            return null;
        }
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Comment::getPostId,postId);
        List<Comment> comments = super.list(wrapper);
        StartVO startVO = new StartVO();
        //遍历
        startVO.setGood(0);
        startVO.setOrdinary(0);
        startVO.setBad(0);
        for (Comment comment : comments) {
            if (comment.getGoodorbad() == 5|| comment.getGoodorbad() == 4){
                startVO.setGood(startVO.getGood() + 1);
            }else if (comment.getGoodorbad() == 3|| comment.getGoodorbad() == 2){
                startVO.setBad(startVO.getBad() + 1);
            }else if (comment.getGoodorbad() == 1|| comment.getGoodorbad() == 0){
                startVO.setOrdinary(startVO.getOrdinary() + 1);
            }
        }
        return startVO;
    }
}
