package com.team.backend.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.team.backend.domain.MomentImage;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:18
 * @Description:
 */
public interface IMomentImageService extends IService<MomentImage>{
    List<String> getImageUrlsByMomentId(String momentId);
    void addMomentImage(String momentId, String imageUrl);
}
