package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.jank.domain.Moment;
import com.ruoyi.jank.domain.MomentComment;
import com.ruoyi.jank.domain.vo.MomentVO;
import com.ruoyi.jank.mapper.MomentMapper;
import com.ruoyi.jank.service.*;
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
public class MomentServiceImpl extends ServiceImpl<MomentMapper, Moment> implements IMomentService {
    @Autowired
    private IMomentImageService momentImageService;

    @Autowired
    private IMomentCommentService momentCommentService;

    @Autowired
    private ICommonUserService userService;

    @Autowired
    private MinioService minioService;



    @Override
    public List<Moment> getMomentList() {
        // 查询所有动态
        LambdaQueryWrapper<Moment> wrapper = new LambdaQueryWrapper<>();
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

//    @Override
//    public void cancelLike(String momentId) {
//        this.baseMapper.decreaseLikeCount(momentId);
//    }
//
//
//    @Override
//    public void likeMoment(String momentId) {
//        this.baseMapper.increaseLikeCount(momentId);
//    }

    @Override
    public List<Moment> getMomentByUserId(String id) {
        LambdaQueryWrapper<Moment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Moment::getUserId, id);
        return list(wrapper);
    }
}
