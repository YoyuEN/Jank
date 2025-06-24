package com.ruoyi.jank.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;
import java.io.Serializable;
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
    private String commentId;
    private String content;
    private String userId;
    private String postId;
    private String replyToCommentId;
    private String createdAt;
    private String updatedAt;
    private Integer deleted;

}
