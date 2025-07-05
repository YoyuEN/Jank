package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.TechStack;
import java.util.List;

public interface ITechStackService extends IService<TechStack> {
    List<TechStack> getAllTechStacks();
    void addTechStack(TechStack techStack);
}
