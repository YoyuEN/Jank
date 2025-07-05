package com.team.backend.controller;

import com.team.backend.domain.Address;
import com.team.backend.domain.User;
import com.team.backend.domain.dto.UserDTO;
import com.team.backend.domain.dto.UserInfoDTO;
import com.team.backend.domain.vo.LoginUserVO;
import com.team.backend.domain.vo.RegisterUserVO;
import com.team.backend.domain.vo.UpdateStackUserVO;
import com.team.backend.domain.vo.UpdateUserVO;
import com.team.backend.mapper.TechStackMapper;
import com.team.backend.service.ITechStackService;
import com.team.backend.service.IUserService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

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
    private final ITechStackService techStackService;

    @Autowired
    public UserController(IUserService userService, ITechStackService techStackService) {
        this.userService = userService;
        this.techStackService = techStackService;
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
    public Result<UserInfoDTO> getUserByUserId(@RequestParam("userId") String userId){
        User user = userService.getById(userId);
        // 将用户技术栈字符串通过","进行分割，并转化为List<Integer>
        List<String> techStacks = List.of(user.getTechStacks().split(","));
        List<Integer> techStack = new ArrayList<>();
        for (String s : techStacks) {
            techStack.add(Integer.parseInt(s));
        }
        // 通过techStack数组Id遍历查询对应的技术栈
        List<String> techStackName = new ArrayList<>();
        for (Integer techStackId : techStack) {
            techStackName.add(techStackService.getById(techStackId).getName());
        }
        UserInfoDTO userInfoDTO = new UserInfoDTO(
                user.getUserId(),
                user.getNickname(),
                user.getUsername(),
                user.getAvatar(),
                user.getEmail(),
                user.getPassword(),
                user.getPhone(),
                user.getFreeze(),
                user.getAddress(),
                techStackName,
                user.getAccessToken(),
                user.getRefreshToken(),
                user.getCreateTime(),
                user.getUpdateTime(),
                user.getDeleted()
        );
        return Result.success(ResponseCode.SUCCESS, userInfoDTO);
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

    // 修改用户技术栈
    @PostMapping("/updateUserStack")
    public Result<User> updateUserStack(
            @RequestParam("userId") String userId,
            @RequestParam("techStackIds") List<String> techStackIds
    ) {
        UpdateStackUserVO user = new UpdateStackUserVO(techStackIds);
        // 通过用户Id来查找用户
        User user1 = userService.getById(userId);
        // 设置用户的地址将技术栈数组拼接成字符串，赋值给用户的techStacks
        user1.setTechStacks(String.join(",", techStackIds));
        userService.updateById(user1);
        return Result.success(ResponseCode.SUCCESS, user1);
    }
}

