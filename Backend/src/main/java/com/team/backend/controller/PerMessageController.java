package com.team.backend.controller;

import com.team.backend.domain.PerMessage;
import com.team.backend.domain.vo.PerMessageVO;
import com.team.backend.service.IPerMessageService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/permessage")
public class PerMessageController {

    @Autowired
    private IPerMessageService perMessageService;
    //留言获取
    @GetMapping("/getmessagelist")
    public Result<List<PerMessage>> getMessageList(){
        return Result.success(ResponseCode.SUCCESS,perMessageService.getMessageList());
    }
    @PostMapping("/addmessage")
    public Result<PerMessage> addMessageList(@RequestBody PerMessageVO perMessageVO){
        return Result.success(ResponseCode.SUCCESS,perMessageService.addMessageList(perMessageVO));
    }
}
