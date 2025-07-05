package com.team.backend.controller;

import com.team.backend.domain.Category;
import com.team.backend.service.ICategoryService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/7/4
 * @Time: 15:47
 * @Description:
 */
@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private ICategoryService categoryService;

    //获取所有分类
    @RequestMapping("/getCategoryList")
    public Result<List<Category>> getCategoryList() {
        return Result.success(ResponseCode.SUCCESS, categoryService.list());
    }
}
