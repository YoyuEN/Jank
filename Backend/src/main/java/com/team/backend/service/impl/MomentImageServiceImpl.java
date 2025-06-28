package com.team.backend.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.MomentImage;
import com.team.backend.mapper.MomentImageMapper;
import com.team.backend.service.IMomentImageService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:19
 * @Description:
 */
@Service
public class MomentImageServiceImpl extends ServiceImpl<MomentImageMapper, MomentImage> implements IMomentImageService {
    @Override
    public List<String> getImageUrlsByMomentId(String momentId) {
        return this.list(new QueryWrapper<MomentImage>().eq("moment_id", momentId)).stream().map(MomentImage::getImageUrl).toList();
    }
}
