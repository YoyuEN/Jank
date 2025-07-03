package com.ruoyi.jank.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.jank.domain.CommonUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Mapper
public interface CommonUserMapper extends BaseMapper<CommonUser> {

    String getUsernameById(String userId);
    /**
     * 根据用户名判断是否存在
     */
    int countByUsername(@Param("username") String username);
}
