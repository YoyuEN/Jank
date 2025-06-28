package com.team.backend.controller;

import com.team.backend.domain.Comment;
import com.team.backend.service.ICommentService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
     * @param userId 用户ID
     * @return 添加结果
     */
    @PostMapping("/add")
    public Result<Comment> addComment(@RequestBody Comment comment, @RequestParam Long userId) {
        // 设置用户ID
        comment.setUserId(userId);
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
    public Result<List<Comment>> getCommentsList(@PathVariable Long postId) {
        List<Comment> commentsList = commentService.getCommentsListByPostId(postId);
        return Result.success(ResponseCode.SUCCESS, commentsList);
    }

    /**
     * 获取评论列表（嵌套结构）
     * @param postId 帖子ID
     * @return 评论列表
     */
    @GetMapping("/nested-list/{postId}")
    public Result<List<Comment>> getNestedCommentsList(@PathVariable Long postId) {
        List<Comment> commentsList = commentService.getNestedCommentsListByPostId(postId);
        return Result.success(ResponseCode.SUCCESS, commentsList);
    }

    /**
     * 根据用户id查询评论
     * @param userId 用户ID
     * @return 删除结果
     */
    @GetMapping("/userIdComment/{userId}")
    public Result<List<Comment>> getCommentsListByUserId(@PathVariable String userId) {
        List<Comment> commentsList = commentService.getCommentsListByUserId(userId);
        return Result.success(ResponseCode.SUCCESS, commentsList);
    }
}
