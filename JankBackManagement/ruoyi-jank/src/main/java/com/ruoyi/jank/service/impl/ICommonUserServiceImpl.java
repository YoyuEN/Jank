package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.jank.domain.Comment;
import com.ruoyi.jank.domain.CommonUser;
import com.ruoyi.jank.domain.dto.CommentDto;
import com.ruoyi.jank.mapper.CommonUserMapper;
import com.ruoyi.jank.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class ICommonUserServiceImpl extends ServiceImpl<CommonUserMapper, CommonUser> implements ICommonUserService {
    @Autowired
    private CommonUserMapper commonUserMapper;

    @Autowired
    private ICommentService commentService;

    @Autowired
    private IMomentService momentService;

    @Autowired
    private IPostService postService;

    @Autowired
    private MinioService minioService;

    @Autowired
    private IMomentCommentService momentCommentService;

    @Override
    public boolean isUsernameExist(String username) {
        return commonUserMapper.countByUsername(username) > 0;
    }
    @Override
    public List<CommonUser> selectCommonUserList(CommonUser commonUser) {
        LambdaQueryWrapper<CommonUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotEmpty(commonUser.getUsername()), CommonUser::getUsername, commonUser.getUsername());
        List<CommonUser> commonUserList = super.list(wrapper);
        List<CommonUser> commonUserList1 = new ArrayList<>();
        commonUserList.forEach(item -> {
            CommonUser commonUser1 = new CommonUser();
            item.setAvatar(minioService.getPresignedUrl(item.getAvatar()));
            BeanUtils.copyBeanProp(commonUser1, item);
            commonUserList1.add(commonUser1);
        });
        return commonUserList1;

    }

    @Override
    public String getUsernameById(String userId) {
        return super.getBaseMapper().getUsernameById(userId);
    }

    @Override
    public boolean updateUserStatus(String userId, Integer freeze) {
        int affectedRows = commonUserMapper.updateFreezeStatus(userId, freeze);
        return affectedRows > 0;
    }

    @Override
    public int removeByUserIds(List<String> userIds) {
        for (String id : userIds) {
            CommonUser user = super.getById(id);
            // 根据用户ID查询评论列表，如果为空则可以删除，否则无法删除
            if (user == null || StringUtils.isNotEmpty(commentService.getCommentByUserId(id))) {
                throw new RuntimeException("用户下有评论，无法删除");
            } else if (StringUtils.isNotEmpty(postService.getPostByUserId(id))) {
                throw new RuntimeException("用户下有帖子，无法删除");
            } else if (StringUtils.isNotEmpty(momentService.getMomentByUserId(id))) {
                throw new RuntimeException("用户下有动态，无法删除");
            } else if (StringUtils.isNotEmpty(momentCommentService.getCommentsByUserId(id))) {
                throw new RuntimeException("用户下有动态评论，无法删除");
            } else {
                super.removeById(id);
            }
        }
        return 1;
    }

    @Override
    public String getAvatarUrlByUserId(String userId) {
        CommonUser user = commonUserMapper.selectById(userId);
        if(user != null){
            user.setAvatar(minioService.getPresignedUrl(user.getAvatar()));
            return user.getAvatar();
        } else {
            return null;
        }
    }
}
