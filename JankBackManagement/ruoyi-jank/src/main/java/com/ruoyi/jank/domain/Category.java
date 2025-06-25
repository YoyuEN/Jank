package com.ruoyi.jank.domain;

import com.ruoyi.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

import java.io.Serializable;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
//类目管理
//CREATE TABLE `category`  (
//        `category_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类目唯一标识',
//        `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类目名称',
//        `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '类目描述',
//        `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父类目ID',
//        `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类目图标路径',
//        `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//        `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
//        `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
//PRIMARY KEY (`category_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类目表' ROW_FORMAT = Dynamic;
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Excel(name = "类目唯一标识")
    private String categoryId;
    @Excel(name = "类目名称")
    private String name;
    @Excel(name = "类目描述")
    private String description;
    private String parentId;
    private String path;
    @Excel(name = "创建时间")
    private String createdAt;
    @Excel(name = "更新时间")
    private String updatedAt;
    private Integer deleted;
}
