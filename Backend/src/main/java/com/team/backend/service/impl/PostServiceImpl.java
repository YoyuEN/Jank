package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Moment;
import com.team.backend.domain.MomentComment;
import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;
import com.team.backend.mapper.PostMapper;
import com.team.backend.service.ICategoryService;
import com.team.backend.service.IPostService;
import com.team.backend.service.MinioService;
import org.springframework.stereotype.Service;

import java.util.List;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    private final MinioService minioService;
    private final ICategoryService categoryService;
    public PostServiceImpl(MinioService minioService, ICategoryService categoryService) {
        this.minioService = minioService;
        this.categoryService = categoryService;
    }
    //新增帖子
    @Override
    public void addPost(PostVO postVO) throws Exception {
        String imageUrl = "https://pic.imgdb.cn/item/64cf07a61ddac507cc7501cc.jpg"; // 默认图

        if (postVO.getImage() != null && !postVO.getImage().isEmpty()) {
            imageUrl = minioService.uploadFile(postVO.getImage(), "");
        }

        if (postVO.getTitle() == null && postVO.getContentHtml() == null && postVO.getCategoryNames() == null) {
            return;
        }

        Post post = new Post();
        post.setTitle(postVO.getTitle());
        post.setImage(imageUrl); // ✅ 正确：Post.setImage(String)
        post.setContentHtml(postVO.getContentHtml());
        post.setCategoryNames(postVO.getCategoryNames());
        post.setVisibility(true);

        super.save(post);
    }

    @Override
    public List<Post> getPostList() {
        // 查询所有动态
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        List<Post> postList = this.list(wrapper);

        // 遍历每个 Moment，为其设置对应的图片 URL 列表
        for (Post post : postList) {
            String postId = post.getPostId();

            List<String> categoryNames = categoryService.getCategoryNamesByPostId(postId);
            post.setCategoryNames(categoryNames);
        }
        return postList;
    }

    //根据用户id查询帖子
    @Override
    public List<Post> getUserIdPost(String userId) {
        if(userId == null){
            return null;
        }
        LambdaQueryWrapper<Post> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Post::getUserId, userId);
        return super.list(queryWrapper);
    }

}
