package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.domain.Moment;
import com.team.backend.domain.MomentComment;
import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;
import com.team.backend.mapper.PostMapper;
import com.team.backend.service.ICategoryService;
import com.team.backend.service.ICommentService;
import com.team.backend.service.IPostService;
import com.team.backend.service.MinioService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    @Autowired
    private ICommentService commentService;
    private final MinioService minioService;
    private final ICategoryService categoryService;
    public PostServiceImpl(MinioService minioService, ICategoryService categoryService) {
        this.minioService = minioService;
        this.categoryService = categoryService;
    }
    //新增帖子
    @Override
    public void addPost(PostVO postVO) throws Exception {
        String imageUrl = null;
        if (postVO.getImage() != null && !postVO.getImage().isEmpty()) {
            imageUrl = minioService.uploadFile(postVO.getImage());
        }

        if (postVO.getTitle() == null && postVO.getContentHtml() == null && postVO.getCategoryNames() == null) {
            return;
        }

        Post post = new Post();
        post.setTitle(postVO.getTitle());
        post.setImage(imageUrl);
        post.setContentHtml(postVO.getContentHtml());
        post.setCategoryNames(postVO.getCategoryNames());
        post.setVisibility(true);
        post.setUserId(postVO.getUserId());

        super.save(post);
    }

    @Override
    public List<Post> getPostList() {
        // 查询所有动态
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Post::getDeleted, 0);
        List<Post> postList = this.list(wrapper);

        for (Post post : postList) {
            String postId = post.getPostId();

            List<String> categoryNames = categoryService.getCategoryNamesByPostId(postId);
            post.setCategoryNames(categoryNames);

            String image = post.getImage();
            post.setImage(minioService.getPresignedUrl(image));
//            BeanUtils.copyProperties(post, post);
        }
        return postList;
    }

    //删除帖子
    @Override
    public Boolean removeAllById(String postId) {
        LambdaQueryWrapper<Comment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Comment::getPostId, postId);
        for(Comment comment : commentService.list(wrapper)){
            comment.setDeleted(1);
            commentService.updateById(comment);
        }
        LambdaQueryWrapper<Post> wrapper1 = new LambdaQueryWrapper<>();
        wrapper1.eq(Post::getPostId, postId);
        Post post = super.getOne(wrapper1);
        post.setDeleted(1);
        super.updateById(post);
        return true;
    }

    //根据用户id查询帖子
    @Override
    public List<Post> getUserIdPost(String userId) {
        if(userId == null){
            return null;
        }
        LambdaQueryWrapper<Post> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Post::getUserId, userId).eq(Post::getDeleted, 0);

        return this.list(queryWrapper);
    }

}
