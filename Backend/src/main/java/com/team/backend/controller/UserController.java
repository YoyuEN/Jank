package com.team.backend.controller;

import com.team.backend.domain.User;
import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:42
 * @Description:
 */
@RestController
@RequestMapping("/user")
public class UserController {
    private final IUserService userService;

    @Autowired
    public UserController(IUserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public Result<Void> login(@RequestBody LoginUserVO userVO){
        userService.login(userVO);
        return Result.success(ResponseCode.SUCCESS);
    }

    @PostMapping("/register")
    public Result<Void> Register(@RequestBody RegisterUserVO userVO){
        long id =userService.register(userVO);
        return Result.success(ResponseCode.SUCCESS);
    }


    // 根据用户ID获取用户信息
    @GetMapping("/getUserByUserId")
    public Result<User> getUserByUserId(@RequestParam("userId") Long userId){
        User user = userService.getById(userId);
        return user != null ? Result.success(ResponseCode.SUCCESS, user) : Result.fail(ResponseCode.USER_NOT_FOUND);
    }





}

