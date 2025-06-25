package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.Category;
import com.ruoyi.jank.domain.Post;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
public interface IPostService extends IService<Post> {
    List<Post> selectPostList(Post post);
}
