package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.User;
import com.team.backend.domain.dto.UserDTO;
import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.domain.vo.UpdateUserVO;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:33
 * @Description:
 */
public interface IUserService extends IService<User> {
    UserDTO login(LoginUserVO userVO);

    long register(RegisterUserVO userVO);

    String getAvatarUrlByUserId(String userId);

    User login(String username, String password);

    User updateUser(UpdateUserVO user) throws Exception;
}
