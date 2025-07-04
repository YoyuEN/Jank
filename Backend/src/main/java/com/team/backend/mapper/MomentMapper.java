package com.team.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.team.backend.domain.Moment;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:02
 * @Description:
 */
@Mapper
public interface MomentMapper extends BaseMapper<Moment> {
    void increaseLikeCount(@Param("momentId") String momentId);
    void decreaseLikeCount(@Param("momentId") String momentId);
}
