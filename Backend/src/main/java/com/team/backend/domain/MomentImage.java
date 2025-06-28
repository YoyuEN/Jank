package com.team.backend.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:09
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MomentImage {
    // 图片ID
    private String imageId;
    // 对应的朋友圈ID
    private String momentId;
    // 图片链接
    private String imageUrl;
    // 图片排序顺序（0~8）
    private Integer sortOrder;
}
