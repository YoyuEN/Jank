package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.MomentComment;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:51
 * @Description:
 */
public interface IMomentCommentService extends IService<MomentComment> {
    List<MomentComment> getCommentsByMomentId(String momentId);
    void addMomentComment(String momentId, String content, String userId);
}
