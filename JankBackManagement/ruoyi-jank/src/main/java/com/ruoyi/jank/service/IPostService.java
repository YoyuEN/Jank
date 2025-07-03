package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.Post;
import com.ruoyi.jank.domain.vo.PostVO;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
public interface IPostService extends IService<Post> {
    List<PostVO> selectPostList(Post post);
}
