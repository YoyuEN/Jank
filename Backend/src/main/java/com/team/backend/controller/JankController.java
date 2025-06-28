package com.team.backend.controller;

import com.team.backend.assistant.Assistant;
import com.team.backend.domain.ChatForm;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;

@Tag(name = "博客小助手")
@RestController
@RequestMapping("/agent")
public class JankController {
    @Autowired
    private Assistant assistant;

    @Operation(summary = "博客聊天")
    //输出是设置@PostMapping的输出类型
    @PostMapping(value = "/chat",produces = "text/stream;charset=UTF-8")
    public Flux<String> chat(@RequestBody ChatForm chatForm){
        return assistant.chat(chatForm.getMemoryId(),chatForm.getMessage());
    }

//    @Operation(summary = "ai摘要聊天")
//    //输出是设置@PostMapping的输出类型
//    @PostMapping(value = "/chat",produces = "text/stream;charset=UTF-8")
//    public Flux<String> chatSimple(@RequestBody ChatForm chatForm){
//        return assistant.chat(chatForm.getMemoryId(),chatForm.getMessage());
//    }
}

