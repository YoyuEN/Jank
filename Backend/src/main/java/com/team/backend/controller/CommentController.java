package com.team.backend.controller;

import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.CommentWithUserVO;
import com.team.backend.service.ICommentService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description: 评论控制器
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private ICommentService commentService;

    /**
     * 添加评论
     * @param comment 评论信息
     * @return 添加结果
     */
    @PostMapping("/add")
    public Result<Comment> addComment(@RequestBody Comment comment, HttpServletRequest request) {
        // 从请求属性中获取当前登录用户
        User currentUser = (User) request.getAttribute("currentUser");
        if (currentUser == null) {
            return Result.fail(ResponseCode.ERROR, "用户未登录");
        }

        // 设置用户ID
        comment.setUserId(currentUser.getUserId());
        // 设置删除标记为0（未删除）
        comment.setDeleted(0);
        
        boolean success = commentService.addComment(comment);
        return success ? Result.success(ResponseCode.SUCCESS, comment) : Result.fail(ResponseCode.ERROR, "添加评论失败");
    }

    /**
     * 获取评论列表（平铺结构）
     * @param postId 帖子ID
     * @return 评论列表
     */
    @GetMapping("/list/{postId}")
    public Result<List<Comment>> getCommentsList(@PathVariable String postId) {
        List<Comment> commentsList = commentService.getCommentsListByPostId(postId);
        return Result.success(ResponseCode.SUCCESS, commentsList);
    }

    /**
     * 获取评论列表（嵌套结构）
     * @param postId 帖子ID
     * @return 评论列表
     * @deprecated 请使用 {@link #getNestedCommentsWithUser(String)} 替代，新接口包含用户信息
     */
    @Deprecated
    @GetMapping("/nested-list/{postId}")
    public Result<List<Comment>> getNestedCommentsList(@PathVariable String postId) {
        List<Comment> commentsList = commentService.getNestedCommentsListByPostId(postId);
        return Result.success(ResponseCode.SUCCESS, commentsList);
    }

    /**
     * 获取带用户信息的评论列表（嵌套结构）
     * @param postId 帖子ID
     * @return 带用户信息的评论列表
     */
    @GetMapping("/nested-list-with-user/{postId}")
    public Result<List<CommentWithUserVO>> getNestedCommentsWithUser(@PathVariable String postId) {
        List<CommentWithUserVO> commentsList = commentService.getNestedCommentsWithUserByPostId(postId);
        return Result.success(ResponseCode.SUCCESS, commentsList);
    }

    /**
     * 回复评论
     * @param comment 评论信息
     * @return 回复结果
     */
    @PostMapping("/reply")
    public Result<Comment> replyComment(@RequestBody Comment comment, HttpServletRequest request) {
        // 从请求属性中获取当前登录用户
        User currentUser = (User) request.getAttribute("currentUser");
        if (currentUser == null) {
            return Result.fail(ResponseCode.ERROR, "用户未登录");
        }

        // 验证回复目标评论是否存在
        if (comment.getReplyToCommentId() == null || comment.getReplyToCommentId().isEmpty()) {
            return Result.fail(ResponseCode.ERROR, "回复目标评论不能为空");
        }

        // 设置用户ID
        comment.setUserId(currentUser.getUserId());
        // 设置删除标记为0（未删除）
        comment.setDeleted(0);

        boolean success = commentService.addComment(comment);
        return success ? Result.success(ResponseCode.SUCCESS, comment) : Result.fail(ResponseCode.ERROR, "回复评论失败");
    }
}
