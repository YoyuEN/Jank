package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: YoyuEN
 * @Date: 2025/7/5
 * @Time: 10:47
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TechStack {
    @TableId
    private String techStackId;
    private String name;
}
