package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.Moment;
import com.team.backend.domain.vo.MomentVO;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:02
 * @Description:
 */
public interface IMomentService extends IService<Moment> {
    List<Moment> getMomentList();
    // 新增朋友圈
    void addMoment(MomentVO momentVO);
    void cancelLike(String momentId);
    void likeMoment(String momentId);


    // 根据用户id查询朋友圈
    List<Moment> getUserIdMoment(String userId);

    Boolean removeMomentById(String momentId);
}
