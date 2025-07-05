package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.TechStack;
import com.team.backend.mapper.TechStackMapper;
import com.team.backend.service.ITechStackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TechStackServiceImpl extends ServiceImpl<TechStackMapper, TechStack> implements ITechStackService  {

    @Autowired
    private TechStackMapper techStackMapper;

    @Override
    public List<TechStack> getAllTechStacks() {
        return techStackMapper.selectList(null);
    }

    @Override
    public void addTechStack(TechStack techStack) {
        techStackMapper.insert(techStack);
    }
}
