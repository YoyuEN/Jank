package com.team.backend.controller;

import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:42
 * @Description:
 */
@RestController
@RequestMapping("/account")
//@CrossOrigin(origins = "http://localhost:3000") // 允许特定源
public class LoginController {
    private final IUserService userService;

    @Autowired
    public LoginController(IUserService userService) {
        this.userService = userService;
    }

    @PostMapping("/loginAccount")
    public Result<Void> login(@RequestBody LoginUserVO userVO){
        userService.login(userVO);
        return Result.success(ResponseCode.SUCCESS);
    }

    @PostMapping("/register")
    public Result<Void> Register(@RequestBody RegisterUserVO userVO){
        long id =userService.register(userVO);
        return Result.success(ResponseCode.SUCCESS);
    }



}

