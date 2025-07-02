package com.ruoyi.jank.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 * author: wuyinai
 * date: 2025/6/24
 */
//评论






//CREATE TABLE `comment`  (
//        `comment_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论唯一标识',
//        `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
//        `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论所属用户ID',
//        `post_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论所属文章ID',
//        `reply_to_comment_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复的目标评论ID',
//        `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//        `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
//        `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
//PRIMARY KEY (`comment_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Excel(name = "评论唯一标识")
    @TableField("comment_id")
    private String commentId;
    @Excel(name = "评论内容")
    private String content;
    @Excel(name = "评论所属用户ID")
    @TableField("user_id")
    private String userId;
    @Excel(name = "评论所属文章ID")
    @TableField("post_id")
    private String postId;
    @Excel(name = "创建时间")
    @TableField("created_at")
    private Date createdAt;
    @Excel(name = "更新时间")
    @TableField("updated_at")
    private Date updatedAt;
    private Integer deleted;

}
