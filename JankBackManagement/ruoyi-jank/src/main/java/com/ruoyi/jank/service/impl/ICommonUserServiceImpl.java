package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.jank.domain.Comment;
import com.ruoyi.jank.domain.CommonUser;
import com.ruoyi.jank.domain.dto.CommentDto;
import com.ruoyi.jank.mapper.CommonUserMapper;
import com.ruoyi.jank.service.ICommonUserService;
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
    @Override
    public boolean isUsernameExist(String username) {
        return commonUserMapper.countByUsername(username) > 0;
    }
    @Override
    public List<CommonUser> selectCommonUserList(CommonUser commonUser) {
//        LambdaQueryWrapper<CommonUser> wrapper = new LambdaQueryWrapper<>();
//        wrapper.like(StringUtils.isNotEmpty(commonUser.getUsername()), CommonUser::getUsername, commonUser.getUsername());
//        return super.list(wrapper);
        return commonUserMapper.selectCommentUserList(commonUser);
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
}
