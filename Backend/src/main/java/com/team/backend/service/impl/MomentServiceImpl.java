package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Moment;
import com.team.backend.domain.MomentComment;
import com.team.backend.domain.vo.MomentVO;
import com.team.backend.mapper.MomentMapper;
import com.team.backend.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

    @Autowired
    private MinioService minioService;



    public MomentServiceImpl(MomentImageServiceImpl momentImageService, MomentCommentServiceImpl momentCommentService, UserServiceImpl userService) {
        this.momentImageService = momentImageService;
        this.momentCommentService = momentCommentService;
        this.userService = userService;
    }

    @Override
    public List<Moment> getMomentList() {
        // 查询所有动态
        LambdaQueryWrapper<Moment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Moment::getDeleted,0);
        List<Moment> momentList = this.list(wrapper);

        // 遍历每个 Moment，为其设置对应的图片 URL 列表
        for (Moment moment : momentList) {
            String momentId = moment.getMomentId();

            List<String> imageUrls = momentImageService.getImageUrlsByMomentId(momentId);
            List<String> signedUrls = new ArrayList<>();
            for (String url : imageUrls) {
                signedUrls.add(minioService.getPresignedUrl(url));
            }
            moment.setImageUrls(signedUrls);

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
    public void addMoment(MomentVO momentVO) {
        List<String> imageUrls = null;
        if (!momentVO.getImageUrls().isEmpty()) {
            imageUrls = minioService.uploadFile(momentVO.getImageUrls(), "moment");
        }
        if (momentVO.getContent() == null && momentVO.getUserId() == null && momentVO.getCategory() == null) {
            return;
        }
        Moment moment = new Moment();
        moment.setMomentId(UUID.randomUUID().toString());
        moment.setContent(momentVO.getContent());
        moment.setUserId(momentVO.getUserId());

        moment.setImageUrls(imageUrls);
        int number = 0;
        for (String imageUrl : imageUrls) {
            momentImageService.addMomentImage(moment.getMomentId(), imageUrl, number);
            number++;
        }
        moment.setUsername(userService.getById(momentVO.getUserId()).getUsername());
        moment.setCategory(momentVO.getCategory());

        moment.setAvatarUrl(userService.getAvatarUrlByUserId(momentVO.getUserId()));
        this.save(moment);
    }

    @Override
    public void cancelLike(String momentId) {
        this.baseMapper.decreaseLikeCount(momentId);
    }


    @Override
    public void likeMoment(String momentId) {
        this.baseMapper.increaseLikeCount(momentId);
    }

    // 获取用户所有动态
    @Override
    public List<Moment> getUserIdMoment(String userId) {
        if (userId == null){
            return null;
        }
        LambdaQueryWrapper<Moment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Moment::getUserId,userId).eq(Moment::getDeleted,0);
        return this.list(wrapper);
    }

    //删除朋友圈
    @Override
    public Boolean removeMomentById(String momentId) {
        //先删除朋友圈下的评论，再删朋友圈
        LambdaQueryWrapper<MomentComment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(MomentComment::getMomentId,momentId);
        for(MomentComment comment : momentCommentService.list(wrapper)){
            comment.setDeleted(1);
            momentCommentService.updateById(comment);
        }
        LambdaQueryWrapper<Moment> wrapper1 = new LambdaQueryWrapper<>();
        wrapper1.eq(Moment::getMomentId, momentId);
        Moment moment = super.getOne(wrapper1);
        moment.setDeleted(1);
        this.updateById(moment);
        return true;
    }
}
