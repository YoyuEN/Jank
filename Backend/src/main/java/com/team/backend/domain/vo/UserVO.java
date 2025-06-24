package com.team.backend.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 15:03
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private String email;
    private String password;
}
