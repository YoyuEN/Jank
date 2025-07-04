package com.team.backend.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserVO {
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
