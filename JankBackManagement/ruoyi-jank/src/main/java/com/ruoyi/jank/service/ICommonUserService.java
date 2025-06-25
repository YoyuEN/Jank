package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.CommonUser;

import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
public interface ICommonUserService extends IService<CommonUser> {
    List<CommonUser> selectCommonUserList(CommonUser commonUser);
}
