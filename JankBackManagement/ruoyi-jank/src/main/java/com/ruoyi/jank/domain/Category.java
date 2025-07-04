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
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Excel(name = "类目唯一标识")
    private Integer categoryId;
    @Excel(name = "类目名称")
    private String name;
    @Excel(name = "类目描述")
    private String description;
    private String postId;
    private String path;
    @Excel(name = "创建时间")
    private String createTime;
    @Excel(name = "更新时间")
    private String updateTime;
    private Integer deleted;
}
