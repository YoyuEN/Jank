package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.domain.Moment;
import com.team.backend.domain.MomentComment;
import com.team.backend.mapper.MomentMapper;
import com.team.backend.service.IMomentCommentService;
import com.team.backend.service.IMomentImageService;
import com.team.backend.service.IMomentService;
import com.team.backend.service.IUserService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:03
 * @Description:
 */
@Service
public class MomentServiceImpl extends ServiceImpl<MomentMapper, Moment> implements IMomentService{
    @Autowired
    private final IMomentImageService momentImageService;

    @Autowired
    private final IMomentCommentService momentCommentService;

    @Autowired
    private final IUserService userService;



    public MomentServiceImpl(MomentImageServiceImpl momentImageService, MomentCommentServiceImpl momentCommentService, UserServiceImpl userService) {
        this.momentImageService = momentImageService;
        this.momentCommentService = momentCommentService;
        this.userService = userService;
    }

    @Override
    public List<Moment> getMomentList() {
        // 查询所有动态
        LambdaQueryWrapper<Moment> wrapper = new LambdaQueryWrapper<>();
        List<Moment> momentList = this.list(wrapper);

        // 遍历每个 Moment，为其设置对应的图片 URL 列表
        for (Moment moment : momentList) {
            String momentId = moment.getMomentId();

            // 假设你有一个 momentImageService 来查询 MomentImage 表
            List<String> imageUrls = momentImageService.getImageUrlsByMomentId(momentId);
            moment.setImageUrls(imageUrls);

            // 获取评论列表
            List<MomentComment> comments = momentCommentService.getCommentsByMomentId(momentId);
            moment.setComments(comments);

            // 根据用户ID查询头像URL
            String avatarUrl = userService.getAvatarUrlByUserId(moment.getUserId());
            moment.setAvatarUrl(avatarUrl);
        }
        return momentList;
    }

    @Override
    public void cancelLike(String momentId) {
        this.baseMapper.decreaseLikeCount(momentId);
    }


    @Override
    public void likeMoment(String momentId) {
        this.baseMapper.increaseLikeCount(momentId);
    }
}
