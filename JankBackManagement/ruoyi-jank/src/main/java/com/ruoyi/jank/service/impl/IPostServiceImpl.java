package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.jank.domain.Post;
import com.ruoyi.jank.domain.User;
import com.ruoyi.jank.mapper.PostMapper;
import com.ruoyi.jank.mapper.UserMapper;
import com.ruoyi.jank.service.IPostService;
import com.ruoyi.jank.service.IUserService;
import org.springframework.stereotype.Service;
/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class IPostServiceImpl extends ServiceImpl<PostMapper, Post> implements IPostService {
}
