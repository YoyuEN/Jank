package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.domain.MomentComment;
import com.team.backend.domain.MomentImage;
import com.team.backend.mapper.MomentCommentMapper;
import com.team.backend.service.IMomentCommentService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:52
 * @Description:
 */
@Service
public class MomentCommentServiceImpl extends ServiceImpl<MomentCommentMapper, MomentComment> implements IMomentCommentService {
    public List<MomentComment> getCommentsByMomentId(String momentId) {
        return this.list(new QueryWrapper<MomentComment>().eq("moment_id", momentId));
    }
}
