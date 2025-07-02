package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.PerMessage;
import com.team.backend.domain.vo.PerMessageVO;

import java.util.List;

public interface IPerMessageService extends IService<PerMessage> {
    //查询所有留言信息
    List<PerMessage> getMessageList();
    //添加留言信息
    PerMessage addMessageList(PerMessageVO perMessageVO);
}
