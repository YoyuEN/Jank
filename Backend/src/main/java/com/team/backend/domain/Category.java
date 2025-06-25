package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/23
 * @Time: 16:42
 * @Description: 类目信息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    // 类目唯一标识
    @TableId
    private String categoryId;
    // 类目名称
    private String name;
    // 类目描述
    private String description;
    // 父类目ID
    private String parentID;
    // 类目图标
    private String path;
    // 子类目列表
    @TableField(exist = false)
    private List<Category> children;
    // 创建时间
    private String createTime;
    //修改时间
    private String updateTime;
    // 删除状态
    private int deleted;
}
