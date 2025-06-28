package com.team.backend.controller;

import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;
import com.team.backend.service.IPostService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
        List<Post> posts = postService.getPostList();
        return Result.success(ResponseCode.SUCCESS, posts);
    }

    @GetMapping("/getPostDetail")
    public Result<Post> getPostDetail(@RequestParam("postId") String postId) {
        Post post = postService.getById(postId);
        return Result.success(ResponseCode.SUCCESS, post);
    }

    @PostMapping("/addPostDetail")
    public Result<?> addPost(
            @RequestParam("title") String title,
            @RequestParam("contentHtml") String contentHtml,
            @RequestParam("categoryNames") List<String> categoryNames,
            @RequestParam("image") MultipartFile image) throws Exception {

        // 构造 PostVO 或直接调用 service
        PostVO postVO = new PostVO();
        postVO.setTitle(title);
        postVO.setContentHtml(contentHtml);
        postVO.setCategoryNames(categoryNames);
        postVO.setImage(image);

        postService.addPost(postVO);
        return Result.success(ResponseCode.SUCCESS);
    }

    //根据用户id查询帖子
    @GetMapping("/getUserIdPost")
    public Result<List<Post>> getUserIdPost(@RequestParam("userId") String userId) {
        List<Post> post = postService.getUserIdPost(userId);
        return Result.success(ResponseCode.SUCCESS, post);
    }
}
