package com.team.backend.controller;

import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.CommentVO;
import com.team.backend.service.ICommentService;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private IUserService userService;

    /**
     * 添加评论
     * @param comment 评论信息
     * @return 添加结果
     */
//    @PostMapping("/add")
//    public Result<CommentWithUserVO> addComment(@RequestBody Comment comment, HttpServletRequest request) {
//        // 从请求属性中获取当前登录用户
//        User currentUser = (User) request.getAttribute("currentUser");
//        if (currentUser == null) {
//            return Result.fail(ResponseCode.ERROR, "用户未登录");
//        }
//
//        // 设置用户ID
//        comment.setUserId(currentUser.getUserId());
//        // 设置删除标记为0（未删除）
//        comment.setDeleted(0);
//
//        boolean success = commentService.addComment(comment);
//        if (!success) {
//            return Result.fail(ResponseCode.ERROR, "添加评论失败");
//        }
//
//        // 将Comment对象转换为CommentWithUserVO对象
//        CommentWithUserVO commentWithUser = CommentWithUserVO.fromComment(comment, currentUser);
//        return Result.success(ResponseCode.SUCCESS, commentWithUser);
//    }

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

//    @Deprecated
//    @GetMapping("/nested-list/{postId}")
//    public Result<List<Comment>> getNestedCommentsList(@PathVariable String postId) {
//        List<Comment> commentsList = commentService.getNestedCommentsListByPostId(postId);
//        return Result.success(ResponseCode.SUCCESS, commentsList);
//    }

//    @GetMapping("/nested-list-with-user/{postId}")
//    public Result<List<CommentWithUserVO>> getNestedCommentsWithUser(@PathVariable String postId) {
//        List<CommentWithUserVO> commentsList = commentService.getNestedCommentsWithUserByPostId(postId);
//        return Result.success(ResponseCode.SUCCESS, commentsList);
//    }

    //    @PostMapping("/reply")
//    public Result<CommentWithUserVO> replyComment(@RequestBody Comment comment, HttpServletRequest request) {
//        // 从请求属性中获取当前登录用户
//        User currentUser = (User) request.getAttribute("currentUser");
//        if (currentUser == null) {
//            return Result.fail(ResponseCode.ERROR, "用户未登录");
//        }
//
//        // 验证回复目标评论是否存在
//        if (comment.getReplyToCommentId() == null || comment.getReplyToCommentId().isEmpty()) {
//            return Result.fail(ResponseCode.ERROR, "回复目标评论不能为空");
//        }
//
//        // 设置用户ID
//        comment.setUserId(currentUser.getUserId());
//        // 设置删除标记为0（未删除）
//        comment.setDeleted(0);
//
//        boolean success = commentService.addComment(comment);
//        if (!success) {
//            return Result.fail(ResponseCode.ERROR, "回复评论失败");
//        }
//
//        // 将Comment对象转换为CommentWithUserVO对象
//        CommentWithUserVO commentWithUser = CommentWithUserVO.fromComment(comment, currentUser);
//        return Result.success(ResponseCode.SUCCESS, commentWithUser);
//    }
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String, String> params) {
        Map<String, Object> result = new HashMap<>();
        String username = params.get("username");
        String password = params.get("password");

        User user = userService.login(username, password);
        if (user != null) {
            result.put("success", true);
            result.put("message", "登录成功");
            result.put("user", user);
        } else {
            result.put("success", false);
            result.put("message", "用户名或密码错误");
        }

        return result;
    }

    @GetMapping("/comments/{postId}")
    public List<CommentVO> getComments(@PathVariable String postId) {
        return commentService.getCommentsByArticleId(postId);
    }

    @PostMapping("/comments")
    public CommentVO addComment(@RequestBody Map<String, Object> params) {
        String userId = params.get("userId").toString();
        String postId = params.get("postId").toString();
        String content = params.get("content").toString();
        String parentId = params.get("parentId") != null ? params.get("parentId").toString() : null;

        return commentService.addComment(userId, postId, content, parentId);
    }
}
