package com.team.backend.controller;

import com.team.backend.domain.Moment;
import com.team.backend.service.IMomentService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:07
 * @Description:
 */
@RestController
@RequestMapping("/moment")
public class MomentController {

    @Autowired
    private IMomentService momentService;

    /*
    * 获取朋友圈列表 getMomentList
    * */
    @GetMapping("/getMomentList")
    public Result<List<Moment>> getMomentList(){
        return Result.success(ResponseCode.SUCCESS, momentService.list());
    }

    /*
    * likeMoment 点赞朋友圈
    * */
    @GetMapping("/likeMoment")
    public Result<String> likeMoment(String momentId){
        momentService.likeMoment(momentId);
        return Result.success(ResponseCode.SUCCESS, "点赞成功");
    }

}
