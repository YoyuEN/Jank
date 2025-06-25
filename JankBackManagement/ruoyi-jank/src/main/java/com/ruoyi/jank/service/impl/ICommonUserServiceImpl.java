package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.jank.domain.CommonUser;
import com.ruoyi.jank.mapper.CommonUserMapper;
import com.ruoyi.jank.service.ICommonUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class ICommonUserServiceImpl extends ServiceImpl<CommonUserMapper, CommonUser> implements ICommonUserService {
    @Override
    public List<CommonUser> selectCommonUserList(CommonUser commonUser) {
        LambdaQueryWrapper<CommonUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotEmpty(commonUser.getNickname()), CommonUser::getNickname, commonUser.getNickname());
        return super.list(wrapper);
    }
}
