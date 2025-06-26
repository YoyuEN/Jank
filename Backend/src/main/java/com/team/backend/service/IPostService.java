package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:34
 * @Description:
 */
public interface IPostService extends IService<Post> {
    //新增帖子
    int addPost(PostVO postVO);
}
