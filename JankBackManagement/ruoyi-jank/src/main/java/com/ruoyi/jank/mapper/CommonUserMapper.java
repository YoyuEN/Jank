package com.ruoyi.jank.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.jank.domain.CommonUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Mapper
public interface CommonUserMapper extends BaseMapper<CommonUser> {

    String getUsernameById(String userId);
}
