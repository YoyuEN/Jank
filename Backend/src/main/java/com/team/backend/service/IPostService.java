package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:34
 * @Description:
 */
public interface IPostService extends IService<Post> {
    //新增帖子
    void addPost(PostVO postVO) throws Exception;

    List<Post> getUserIdPost(String userId);
    //获取帖子列表
    List<Post> getPostList();

    Boolean removeAllById(String postId);
}
