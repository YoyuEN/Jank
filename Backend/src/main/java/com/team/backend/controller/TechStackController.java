package com.team.backend.controller;

import com.team.backend.domain.TechStack;
import com.team.backend.service.ITechStackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tech-stack")
public class TechStackController {

    @Autowired
    private ITechStackService techStackService;

    // 获取所有技术栈
    @GetMapping("/getAllTechStack")
    public List<TechStack> getAllTechStacks() {
        return techStackService.getAllTechStacks();
    }

    // 添加技术栈
    @PostMapping("/addTechStack")
    public void addTechStack(@RequestBody TechStack techStack) {
        techStackService.addTechStack(techStack);
    }
}
