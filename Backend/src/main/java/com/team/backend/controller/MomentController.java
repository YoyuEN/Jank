package com.team.backend.controller;

import com.team.backend.domain.Moment;
import com.team.backend.domain.MomentComment;
import com.team.backend.domain.vo.MomentVO;
import com.team.backend.service.IMomentCommentService;
import com.team.backend.service.IMomentService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @Autowired
    private IMomentCommentService momentCommentService;

    /*
    * 获取朋友圈列表 getMomentList
    * */
    @GetMapping("/getMomentList")
    public Result<List<Moment>> getMomentList(){
        return Result.success(ResponseCode.SUCCESS, momentService.getMomentList());
    }

    /*
    * 新增朋友圈 addMoment
    * */
    @PostMapping("/addMoment")
    public Result<String> addMoment(
            @RequestParam("content") String content,
            @RequestParam("imageUrls") List<MultipartFile> imageUrls,
            @RequestParam("userId") String userId,
            @RequestParam("category") String category){
        MomentVO momentVO = new MomentVO(content, imageUrls, userId, category);
        if (momentVO.getContent() == null || momentVO.getContent().isEmpty()) {
            return Result.fail(ResponseCode.ERROR, "内容不能为空");
        }
        momentService.addMoment(momentVO);
        return Result.success(ResponseCode.SUCCESS, "发布成功");
    }

    /*
    * likeMoment 点赞朋友圈
    * */
    @GetMapping("/likeMoment")
    public Result<String> likeMoment(String momentId){
        momentService.likeMoment(momentId);
        return Result.success(ResponseCode.SUCCESS, "点赞成功");
    }

    /*
    * cancelLike 取消点赞
    * */
    @GetMapping("/cancelLike")
    public Result<String> cancelLike(String momentId){
        momentService.cancelLike(momentId);
        return Result.success(ResponseCode.SUCCESS, "取消点赞成功");
    }

    /*
    * 新增评论 addMomentComment
    * */
    @PostMapping("/addMomentComment")
    public Result<String> addMomentComment(
            @RequestParam("momentId") String momentId,
            @RequestParam("content") String content,
            @RequestParam("userId") String userId){
        if (content == null || content.isEmpty()) {
            return Result.fail(ResponseCode.ERROR, "内容不能为空");
        }
        momentCommentService.addMomentComment(momentId, content, userId);
        return Result.success(ResponseCode.SUCCESS, "评论成功");
    }
    /*
    根据用户id获取朋友圈
     */
    @GetMapping("/getUserIdMoment")
    public Result<List<Moment>> getMomentByUserId(@RequestParam("userId") String userId){
        return Result.success(ResponseCode.SUCCESS, momentService.getUserIdMoment(userId));
    }
    //删除朋友圈
    @DeleteMapping("/deleteMoment")
    public Result<Boolean> removeMoment(@RequestParam("momentId") String momentId){
        boolean flag = momentService.removeMomentById(momentId);
        return Result.success(ResponseCode.SUCCESS, flag);
    }
}
