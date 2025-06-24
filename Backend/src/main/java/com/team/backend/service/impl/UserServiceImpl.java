package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.User;
import com.team.backend.mapper.UserMapper;
import com.team.backend.service.IUserService;
import org.springframework.stereotype.Service;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
}
