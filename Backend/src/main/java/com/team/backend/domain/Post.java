package com.team.backend.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/23
 * @Time: 16:36
 * @Description: 帖子实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    // 帖子唯一标识
    private Integer ID;
    // 帖子标题
    private String Title;
    // 帖子封面图片 URL
    private String Image;
    // 帖子可见性状态
    private boolean Visibility;
    // 帖子 HTML 格式内容
    private String ContentHTML;
    // 帖子所属分类 ID
    private Integer CategoryID;
}
