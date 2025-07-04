package com.ruoyi.jank.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.jank.domain.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Repository
public interface CommentMapper extends BaseMapper<Comment> {
        List<Comment> selectCommentWithUserAndPost(Comment comment);
}
