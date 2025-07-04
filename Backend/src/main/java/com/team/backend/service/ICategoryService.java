package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Category;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:35
 * @Description:
 */
public interface ICategoryService extends IService<Category> {
    List<String> getCategoryNamesByPostId(String postId);
}
