package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.jank.domain.Post;
import com.ruoyi.jank.domain.vo.PostVO;
import com.ruoyi.jank.mapper.PostMapper;
import com.ruoyi.jank.service.*;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class IPostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IPostService postService;

    @Autowired
    private MinioService minioService;

    @Autowired
    private ICommonUserService commonUserService;

    @Autowired
    private ICommentService commentService;

    @Override
    public List<PostVO> selectPostList(Post post) {
        List<PostVO> postVOList = new ArrayList<>();
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotEmpty(post.getTitle()), Post::getTitle, post.getTitle());
        List<Post> postList = list(wrapper);
        postList.forEach(item -> {
            PostVO postVO = new PostVO();
            BeanUtils.copyProperties(item, postVO);
            // 获取分类名称
            List<String> categoryNames = categoryService.selectCategoryNamesByPostId(item.getPostId());
            postVO.setCategoryNames(categoryNames);

            String image = postService.getById(item.getPostId()).getImage();
            postVO.setImage(minioService.getPresignedUrl(image));

            postVO.setUsername(commonUserService.getUsernameById(item.getUserId()));
            postVOList.add(postVO);
        });
        return postVOList;
    }

    @Override
    public int removeByPostId(List<String> postIds) {
        for (String id : postIds) {
            Post post = postService.getById(id);
            // 根据帖子ID查询评论列表，如果为空则可以删除，否则无法删除
            if (post == null || StringUtils.isNotEmpty(commentService.getCommentByPostId(id))) {
                // 进行异常处理
                throw new RuntimeException("帖子正在被使用，请勿删除");
            } else {
                removeById(id);
            }
        }
        return 1;
    }

    @Override
    public List<Post> getPostByUserId(String userId) {
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Post::getUserId,userId);
        return list(wrapper);
    }
}
