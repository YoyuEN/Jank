package com.team.backend.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/7/5
 * @Time: 11:40
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateStackUserVO {
    private List<String> techStackIds;
}
