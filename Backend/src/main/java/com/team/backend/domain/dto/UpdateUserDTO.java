package com.team.backend.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: YoyuEN
 * @Date: 2025/7/5
 * @Time: 19:26
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserDTO {
    private String userId;
    private String username;
    private String nickname;
    private MultipartFile avatar;
    private String email;
    private String oldPassword;
    private String newPassword;
    private String confirmPassword;
    private String[] address;

}