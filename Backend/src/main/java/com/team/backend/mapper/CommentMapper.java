package com.team.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.team.backend.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:30
 * @Description:
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {
}