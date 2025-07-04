package com.team.backend.controller;

import com.team.backend.domain.Address;
import com.team.backend.domain.User;
import com.team.backend.domain.dto.UserDTO;
import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.domain.vo.UpdateUserVO;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    public Result<UserDTO> login(@RequestBody LoginUserVO userVO){
        UserDTO userDTO = userService.login(userVO);
        return Result.success(ResponseCode.SUCCESS, userDTO);
    }

    @PostMapping("/register")
    public Result<Void> Register(@RequestBody RegisterUserVO userVO){
        long id =userService.register(userVO);
        return Result.success(ResponseCode.SUCCESS);
    }


    // 根据用户ID获取用户信息
    @GetMapping("/getUserByUserId")
    public Result<User> getUserByUserId(@RequestParam("userId") String userId){
        User user = userService.getById(userId);
        return user != null ? Result.success(ResponseCode.SUCCESS, user) : Result.fail(ResponseCode.USER_NOT_FOUND);
    }

    //修改用户信息
    @PostMapping("/updateUser")
    public Result<User> updateUser(
            @RequestParam("userId") String userId,
            @RequestParam("username") String username,
            @RequestParam("nickname") String nickname,
            @RequestParam("avatar") MultipartFile avatar,
            @RequestParam("email") String email,
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            @RequestParam("address") String[] address
    ) throws Exception {
        UpdateUserVO user = new UpdateUserVO(userId, username, nickname, avatar, email, oldPassword, newPassword, confirmPassword, address);
        User user1 = userService.updateUser(user);
        return Result.success(ResponseCode.SUCCESS,user1);
    }
}

