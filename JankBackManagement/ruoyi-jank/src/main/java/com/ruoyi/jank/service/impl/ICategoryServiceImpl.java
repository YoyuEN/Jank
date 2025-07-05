package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.jank.domain.Category;
import com.ruoyi.jank.domain.dto.CategoryDto;
import com.ruoyi.jank.mapper.CategoryMapper;
import com.ruoyi.jank.service.ICategoryService;
import org.springframework.beans.BeanUtils;
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
    
    @Override
    public List<String> listAllCategoryNames() {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.select(Category::getName);
        List<Category> categories = this.list(queryWrapper);
        List<String> categoryNames = new ArrayList<>();
        categories.forEach(category -> {
            if (!categoryNames.contains(category.getName())) {
                categoryNames.add(category.getName());
            }
        });
        return categoryNames;
    }

    /*
    * 根据categoryId逐个删除类目
    * */
    @Override
    public int removeByCategoryIds(List<String> categoryIds) {
        for (String categoryId : categoryIds) {
            Category category = new Category();
            category.setCategoryId(Integer.valueOf(categoryId));
            // 根据categoryId查询获取到类目，判断postId是否为空，如果为空则可以删除类目，否则不能删除
            Category category1 = this.getById(category);
            if (category1 != null && StringUtils.isNotEmpty(category1.getPostId())) {
                removeById(category);
            } else {
                // 进行异常处理
                throw new RuntimeException("类目正在被使用，请勿删除");
            }
        }
        return 1;
    }
}