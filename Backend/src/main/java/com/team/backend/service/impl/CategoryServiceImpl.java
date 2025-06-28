package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Category;
import com.team.backend.mapper.CategoryMapper;
import com.team.backend.service.ICategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description:
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {
    @Override
    public List<String> getCategoryNamesByPostId(String postId) {
        return this.list(new QueryWrapper<Category>().eq("post_id", postId)).stream().map(Category::getName).toList();
    }
}
