package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.exception.ServiceExceptionHandler;
import com.team.backend.mapper.UserMapper;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public void login(LoginUserVO userVO) {
        String username = userVO.getUsername();
        String password = userVO.getPassword();
        if(username == null){
            throw new ServiceExceptionHandler(ResponseCode.USER_NAME_NULL);
        }
        User user = userMapper.selectOne(new QueryWrapper<User>().eq("username", username));
        if (user == null) {
            throw new ServiceExceptionHandler(ResponseCode.USER_NOT_EXIST);
        }
        if (!user.getPassword().equals(password)) {
            throw new ServiceExceptionHandler(ResponseCode.USER_PASSWORD_ERROR);
        }
    }

    @Override
    public long register(RegisterUserVO userVO) {
        if(userVO.getUsername()== null&& userVO.getPassword()== null&& userVO.getCheckPassword()== null){
            throw new ServiceExceptionHandler(ResponseCode.USER_NAME_NULL);
        }
        if(!userVO.getPassword().equals(userVO.getCheckPassword())){
            throw new ServiceExceptionHandler(ResponseCode.USER_PASSWORD_ERROR);
        }
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", userVO.getUsername());
        long count = userMapper.selectCount(wrapper);
        if(count > 0){
            throw new ServiceExceptionHandler(ResponseCode.USER_HAVE_EXIST);
        }
        User user = new User();
        user.setUsername(userVO.getUsername());
        user.setPassword(userVO.getPassword());
        super.save(user);
        return 0;
    }
}
