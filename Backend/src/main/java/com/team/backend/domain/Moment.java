package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 10:01
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Moment {
    @TableId
    private String momentId;           // 朋友圈ID
    private String content;            // 文字内容
    private String userId;             // 发布用户ID
    private String username;           // 用户名
    private String category;           // 类目
    @TableField(exist = false)
    private String avatarUrl;          // 用户头像URL
    @TableField(exist = false)
    private List<String> imageUrls;    // 图片链接列表（最多9张）
    private Integer likeCount;         // 点赞数量
    @TableField(exist = false)
    private List<MomentComment> comments;    // 评论列表
    private String createTime;         // 创建时间
    private boolean likedByUser;        // 当前用户是否已点赞
    private Integer deleted;           // 删除状态（0：未删除，1：已删除）
}
