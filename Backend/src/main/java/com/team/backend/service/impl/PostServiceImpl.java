package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Post;
import com.team.backend.domain.vo.PostVO;
import com.team.backend.mapper.PostMapper;
import com.team.backend.service.IPostService;
import com.team.backend.service.MinioService;
import org.springframework.stereotype.Service;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    private final MinioService minioService;
    public PostServiceImpl(MinioService minioService) {
        this.minioService = minioService;
    }
    //新增帖子
    @Override
    public void addPost(PostVO postVO) throws Exception {
        String imageUrl = "https://pic.imgdb.cn/item/64cf07a61ddac507cc7501cc.jpg"; // 默认图

        if (postVO.getImage() != null && !postVO.getImage().isEmpty()) {
            imageUrl = minioService.uploadFile(postVO.getImage(), "");
        }

        if (postVO.getTitle() == null && postVO.getContentHtml() == null && postVO.getCategoryIds() == null) {
            return;
        }

        Post post = new Post();
        post.setTitle(postVO.getTitle());
        post.setImage(imageUrl); // ✅ 正确：Post.setImage(String)
        post.setContentHtml(postVO.getContentHtml());
        post.setCategoryIds(postVO.getCategoryIds());
        post.setVisibility(true);

        super.save(post);
    }

}
