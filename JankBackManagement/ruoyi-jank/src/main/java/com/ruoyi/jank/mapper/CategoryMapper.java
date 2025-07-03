package com.ruoyi.jank.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.jank.domain.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Repository
public interface CategoryMapper extends BaseMapper<Category> {
    List<String> selectCategoryNamesByPostId(String postId);
}
