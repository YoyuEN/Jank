package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Comment;
import com.team.backend.mapper.CommentMapper;
import com.team.backend.service.ICommentService;
import org.springframework.stereotype.Service;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:37
 * @Description:
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService{
}
