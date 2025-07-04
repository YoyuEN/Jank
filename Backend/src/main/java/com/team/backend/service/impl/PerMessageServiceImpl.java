package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.PerMessage;
import com.team.backend.domain.vo.PerMessageVO;
import com.team.backend.mapper.PerMessageMapper;
import com.team.backend.service.IPerMessageService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PerMessageServiceImpl extends ServiceImpl<PerMessageMapper, PerMessage> implements IPerMessageService {
    @Override
    public List<PerMessage> getMessageList() {
        LambdaQueryWrapper<PerMessage> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(PerMessage::getDeleted,0);
        return this.list(wrapper);
    }

    @Override
    public PerMessage addMessageList(PerMessageVO perMessageVO) {
        if(perMessageVO.getUserId()==null||perMessageVO.getMessage()==null){
            return null;
        }
        PerMessage perMessage = new PerMessage();
        perMessage.setMessage(perMessageVO.getMessage());
        perMessage.setUserId(perMessageVO.getUserId());
        perMessage.setMessId(UUID.randomUUID().toString());
        super.save(perMessage);
        return perMessage;
    }
}
