package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Moment;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:02
 * @Description:
 */
public interface IMomentService extends IService<Moment> {
    void likeMoment(String momentId);
}
