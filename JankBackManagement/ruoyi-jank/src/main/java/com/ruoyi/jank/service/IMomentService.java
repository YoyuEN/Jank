package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.Moment;
import com.ruoyi.jank.domain.vo.MomentVO;

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
//    void cancelLike(String momentId);
//    void likeMoment(String momentId);


    List<Moment> getMomentByUserId(String id);
}
