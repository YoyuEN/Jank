package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;
import com.team.backend.mapper.PostMapper;
import com.team.backend.service.IPostService;
import org.springframework.stereotype.Service;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    //新增帖子
    @Override
    public int addPost(PostVO postVO) {
        if(postVO.getImage() == null){
            postVO.setImage("https://pic.imgdb.cn/item/64cf07a61ddac507cc7501cc.jpg");
        }
        if(postVO.getTitle() == null&&postVO.getContentHtml() == null&&postVO.getCategoryIds() == null){
            return 0;
        }
        Post post = new Post();
        post.setTitle(postVO.getTitle());
        post.setImage(postVO.getImage());
        post.setContentHtml(postVO.getContentHtml());
        post.setCategoryIds(postVO.getCategoryIds());
        super.save(post);
        return 1;
    }
}
