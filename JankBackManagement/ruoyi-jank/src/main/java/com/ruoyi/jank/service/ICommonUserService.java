package com.ruoyi.jank.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.jank.domain.CommonUser;
import com.ruoyi.jank.mapper.CommonUserMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.PrivateKey;
import java.util.List;
import java.util.PrimitiveIterator;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
public interface ICommonUserService extends IService<CommonUser> {
    boolean isUsernameExist(String username);
    List<CommonUser> selectCommonUserList(CommonUser commonUser);
    String getUsernameById(String userId);
    // 更新用户状态
    boolean updateUserStatus(String userId, Integer freeze);
    int removeByUserIds(List<String> userIds);

    String getAvatarUrlByUserId(String userId);
}
