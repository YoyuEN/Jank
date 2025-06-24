package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.UserVO;
import com.team.backend.exception.ServiceExceptionHandler;
import com.team.backend.mapper.UserMapper;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    private final UserMapper userMapper;
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    @Override
    @Transactional
    public void login(UserVO userVO) {
        String email = userVO.getEmail();
        String password = userVO.getPassword();
        if(email == null){
            throw new ServiceExceptionHandler(ResponseCode.USER_NAME_NULL);
        }
        User user = userMapper.selectOne(new QueryWrapper<User>().eq("email", email));
        if (user == null) {
            throw new ServiceExceptionHandler(ResponseCode.USER_NOT_EXIST);
        }
        if (!user.getPassword().equals(password)) {
            throw new ServiceExceptionHandler(ResponseCode.USER_PASSWORD_ERROR);
        }
    }
}
