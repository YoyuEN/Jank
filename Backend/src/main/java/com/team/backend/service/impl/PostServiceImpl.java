package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Post;
import com.team.backend.domain.dto.PostPageResult;
import com.team.backend.domain.vo.PostVO;
import com.team.backend.mapper.PostMapper;
import com.team.backend.service.IPostService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
    private final PostMapper postMapper;
    
    
    public PostServiceImpl(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Post> getPosts(int pageSize, int page) {
        // 确保 page 从 1 开始，MyBatis-Plus 默认 page 从 1 开始
        int validPage = Math.max(1, page);
        int validPageSize = Math.max(1, pageSize);

        // 创建分页对象
        Page<Post> pageData = new Page<>(validPage, validPageSize);

        // 添加查询条件，过滤已删除记录
        QueryWrapper<Post> wrapper = new QueryWrapper<>();
        wrapper.eq("deleted", 0);

        // 执行分页查询
        pageData = postMapper.selectPage(pageData, wrapper);

        // 打印调试信息
        System.out.println("总记录数: " + pageData.getTotal());
        System.out.println("计算的总页数: " + pageData.getPages());
        System.out.println("当前页记录: " + pageData.getRecords().size());

        return pageData;
    }
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
