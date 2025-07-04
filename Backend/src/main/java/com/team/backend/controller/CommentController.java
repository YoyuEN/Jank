package com.team.backend.controller;

import com.team.backend.domain.Comment;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.CommentsVO;
import com.team.backend.domain.vo.StartVO;
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


    @PostMapping
    public Map<String, Object> saveComment(@RequestBody Comment comment) {
        Map<String, Object> result = new HashMap<>();
        try {
            commentService.saveComment(comment);
            result.put("success", true);
            result.put("message", "评论提交成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "评论提交失败");
            e.printStackTrace();
        }
        return result;
    }

    @GetMapping("/{articleId}")
    public List<Comment> getCommentsByArticleId(@PathVariable String articleId) {
        return commentService.getCommentsListByPostId(articleId);
    }

    @GetMapping("/statistics/{articleId}")
    public Map<String, Integer> getCommentStatistics(@PathVariable String articleId) {
        return commentService.getCommentStatistics(articleId);
    }
//    @GetMapping("/articles/{articleId}/rating-stats")
//    public ResponseResult getArticleRatingStats(@PathVariable String articleId) {
//        return commentService.getArticleRatingStats(articleId);
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

    @GetMapping("/listComment/{postId}")
    public Result<List<Comment>> getComments(@PathVariable String postId) {
        List<Comment> data = commentService.getCommentsByArticleId(postId);
        return Result.success(ResponseCode.SUCCESS,data);
    }

    @PostMapping("/comments")
    public Result<Void> addComment(@RequestBody CommentsVO params) {
        commentService.addCommentgood(params);
        return Result.success(ResponseCode.SUCCESS);
    }

    @GetMapping("/level/{postId}")
    public Result<StartVO> getStarts(@PathVariable String postId) {
        StartVO data = commentService.getCommentsStarts(postId);
        return Result.success(ResponseCode.SUCCESS,data);
    }
}
