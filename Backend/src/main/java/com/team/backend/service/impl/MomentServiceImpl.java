package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Moment;
import com.team.backend.mapper.MomentMapper;
import com.team.backend.service.IMomentService;
import org.springframework.stereotype.Service;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:03
 * @Description:
 */
@Service
public class MomentServiceImpl extends ServiceImpl<MomentMapper, Moment> implements IMomentService{

    @Override
    public void likeMoment(String momentId) {
        this.baseMapper.increaseLikeCount(momentId);
    }
}
