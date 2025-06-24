package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.UserVO;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:33
 * @Description:
 */
public interface IUserService extends IService<User> {
    void login(UserVO userVO);
}
