package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.jank.domain.MomentImage;
import com.ruoyi.jank.mapper.MomentImageMapper;
import com.ruoyi.jank.service.IMomentImageService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

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

    @Override
    public void addMomentImage(String momentId, String imageUrl, int number) {
        MomentImage momentImage = new MomentImage();
        momentImage.setMomentId(momentId);
        momentImage.setImageId(UUID.randomUUID().toString());
        momentImage.setImageUrl(imageUrl);
        momentImage.setSortOrder(number);
        super.save(momentImage);
     }
}
