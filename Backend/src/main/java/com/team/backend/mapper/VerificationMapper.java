package com.team.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.team.backend.domain.Verification;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:32
 * @Description:
 */
@Mapper
public interface VerificationMapper extends BaseMapper<Verification> {
}
