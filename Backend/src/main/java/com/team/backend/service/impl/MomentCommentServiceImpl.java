package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.domain.MomentComment;
import com.team.backend.domain.MomentImage;
import com.team.backend.mapper.MomentCommentMapper;
import com.team.backend.service.IMomentCommentService;
import com.team.backend.service.IUserService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:52
 * @Description:
 */
@Service
public class MomentCommentServiceImpl extends ServiceImpl<MomentCommentMapper, MomentComment> implements IMomentCommentService {
    @Autowired
    private IUserService userService;
    @Override
    public List<MomentComment> getCommentsByMomentId(String momentId) {
        return this.list(new QueryWrapper<MomentComment>().eq("moment_id", momentId));
    }

    @Override
    public void addMomentComment(String momentId, String content, String userId) {
        MomentComment momentComment = new MomentComment();
        momentComment.setCommentId(UUID.randomUUID().toString());
        momentComment.setMomentId(momentId);
        momentComment.setUserId(userId);
        momentComment.setContent(content);
        momentComment.setNickname(userService.getById(userId).getUsername());
        super.save(momentComment);
    }


}
