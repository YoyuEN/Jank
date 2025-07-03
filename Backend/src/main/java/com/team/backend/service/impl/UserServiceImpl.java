package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Address;
import com.team.backend.domain.User;
import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.domain.vo.UpdateUserVO;
import com.team.backend.exception.ServiceExceptionHandler;
import com.team.backend.mapper.AddressMapper;
import com.team.backend.mapper.UserMapper;
import com.team.backend.service.IAddressService;
import com.team.backend.service.IUserService;
import com.team.backend.service.MinioService;
import com.team.backend.utils.ResponseCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
    @Autowired
    private MinioService minioService;
    private final UserMapper userMapper;
    @Autowired
    private AddressMapper addressMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    @Override
    @Transactional
    public User login(LoginUserVO userVO) {
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
        if(user.getFreeze() == 0){
            throw new ServiceExceptionHandler(ResponseCode.USER_HAVE_EXIST);
        }
        user.setAvatar(minioService.getPresignedUrl(user.getAvatar()));
        return user;
    }

    @Override
    public long register(RegisterUserVO userVO) {
        if(userVO.getUsername()== null&& userVO.getPassword()== null&& userVO.getCheckPassword()== null){
            throw new ServiceExceptionHandler(ResponseCode.USER_NAME_NULL);
        }
        assert userVO.getPassword() != null;
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
        user.setUserId(UUID.randomUUID().toString());
        super.save(user);
        return 0;
    }

    @Override
    public String getAvatarUrlByUserId(String userId) {
        User user = userMapper.selectById(userId);
        if(user != null){
            user.setAvatar(minioService.getPresignedUrl(user.getAvatar()));
            return user.getAvatar();
        } else {
            return null;
        }
    }

    @Override
    public User login(String username, String password) {
        return null;
    }

    @Override
    public User updateUser(UpdateUserVO user) {
        if(user == null){
            throw new ServiceExceptionHandler(ResponseCode.USER_NOT_EXIST);
        }
        if (user.getEmail().length()<8){
            return null;
        }
        if (user.getNickname().length()<2||user.getNickname().length()>20){
            return null;
        }
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, user.getUsername());
        Long count = userMapper.selectCount(wrapper);
        if (count > 1){
            return null;
        }
        StringBuilder addresscomment = new StringBuilder();
        //地址数据结构为[1,2,3,4],遍历查询给的id在表中对应的内容
        for (int i = 0; i < user.getAddress().length; i++) {
            Address address = new Address();
            address.setAddressId(user.getAddress()[i]);
            Address address1 = addressMapper.selectOne(new QueryWrapper<Address>().eq("address_id", user.getAddress()[i]));
            addresscomment.append(address1.getAddress());
            if(i != user.getAddress().length-1){
                addresscomment.append("/");
            }
        }
        wrapper.eq(User::getUserId, user.getUserId());
        User user1 = userMapper.selectOne(wrapper);
        user1.setUsername(user.getUsername());
        user1.setEmail(user.getEmail());
        user1.setNickname(user.getNickname());
        user1.setAddress(addresscomment.toString());
        //更新用户信息
        super.updateById(user1);
        return user1;
    }
}
