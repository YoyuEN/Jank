package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.jank.domain.Post;
import com.ruoyi.jank.mapper.PostMapper;
import com.ruoyi.jank.service.IPostService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class IPostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    @Override
    public List<Post> selectPostList(Post post) {
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotEmpty(post.getTitle()), Post::getTitle, post.getTitle());
        return super.list(wrapper);
    }
}
