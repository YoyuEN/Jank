package com.team.backend.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserVO {
    private String userId;
    private String username;
    private String nickname;
    private String avatar;
    private String email;
    private String oldPassword;
    private String newPassword;
    private String confirmPassword;
    private String[] address;
}
