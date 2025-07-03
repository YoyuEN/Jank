package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.jank.domain.Category;
import com.ruoyi.jank.domain.Comment;
import com.ruoyi.jank.domain.dto.CategoryDto;
import com.ruoyi.jank.domain.dto.CommentDto;
import com.ruoyi.jank.mapper.CategoryMapper;
import com.ruoyi.jank.service.ICategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class ICategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {
    @Override
    //查询类目列表
    public List<CategoryDto> selectCategoryList(Category category) {
        List<CategoryDto> CategoryDtoList=new ArrayList<>();
        LambdaQueryWrapper<Category> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(StringUtils.isNotEmpty(category.getName()),Category::getName,category.getName());
        List<Category> CategoryList=list(lambdaQueryWrapper);
        CategoryList.forEach(c->{
            CategoryDto CategoryDto=new CategoryDto();
            BeanUtils.copyProperties(c,CategoryDto);
            CategoryDtoList.add(CategoryDto);
        });
        return CategoryDtoList;
    }

    @Override
    public List<String> selectCategoryNamesByPostId(String postId) {
        return baseMapper.selectCategoryNamesByPostId(postId);
    }
}