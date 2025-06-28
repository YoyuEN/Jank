package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Moment;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:02
 * @Description:
 */
public interface IMomentService extends IService<Moment> {
    List<Moment> getMomentList();
    void cancelLike(String momentId);
    void likeMoment(String momentId);
}
