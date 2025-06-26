package com.team.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.team.backend.domain.Category;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:25
 * @Description:
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {
}
