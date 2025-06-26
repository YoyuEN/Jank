package com.team.backend.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 15:03
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginUserVO implements Serializable {
    private String username;
    private String password;
}
