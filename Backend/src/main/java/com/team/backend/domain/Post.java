package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.team.backend.handler.CategoryIdsTypeHandler;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/23
 * @Time: 16:36
 * @Description: 帖子实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post implements Serializable {
    private static final long serialVersionUID = 1L;
    // 帖子唯一标识
    @TableId
    private String postId;
    // 帖子作者用户 ID
    private String userId;
    // 帖子标题
    private String title;
    // 帖子封面图片 URL
    private String image;
    // 帖子可见性状态
    private boolean visibility;
    // 帖子 HTML 格式内容
    @TableField("content_html")
    private String contentHtml;
    // 帖子所属分类 ID
    private String categoryName;
    // 创建时间
    private String createTime;
    //修改时间
    private String updateTime;
    // 删除状态
//    @TableLogic
    private Integer deleted;
}
