package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.Category;
import com.ruoyi.jank.domain.CommonUser;
import com.ruoyi.jank.domain.dto.CategoryDto;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
public interface ICategoryService extends IService<Category> {
    List<CategoryDto> selectCategoryList(Category category);
    List<String> selectCategoryNamesByPostId(String postId);
    
    /**
     * 获取所有类目名称列表
     * @return 类目名称列表
     */
    List<String> listAllCategoryNames();

    /*
    *
    * */
    int removeByCategoryIds(List<String> categoryId);
}
