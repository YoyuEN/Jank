package com.team.backend.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.team.backend.domain.Post;
import com.team.backend.domain.dto.PostPageResult;
import com.team.backend.service.IPostService;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 16:36
 * @Description:
 */
@RestController
@RequestMapping("/post")
public class PostController {

    private final IPostService postService;;
    public PostController(IPostService postService) {
        this.postService = postService;
    }

    @GetMapping("/getPostList")
    public Result<List<Post>> getPostList() {
        List<Post> posts = postService.list();
        return Result.success(ResponseCode.SUCCESS, posts);
    }

    @GetMapping("/getPostDetail")
    public Result<Post> getPostDetail(@RequestParam("postId") String postId) {
        Post post = postService.getById(postId);
        return Result.success(ResponseCode.SUCCESS, post);
    }

}
