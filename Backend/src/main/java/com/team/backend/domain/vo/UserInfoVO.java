package com.team.backend.domain.vo;

import com.team.backend.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户公开信息VO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoVO {
    /**
     * 用户ID
     */
    private String userId;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 从User对象转换为UserInfoVO对象
     * @param user User对象
     * @return UserInfoVO对象
     */
    public static UserInfoVO fromUser(User user) {
        if (user == null) {
            return null;
        }
        UserInfoVO vo = new UserInfoVO();
        vo.setUserId(user.getUserId());
        vo.setNickname(user.getNickname());
        vo.setAvatar(user.getAvatar());
        return vo;
    }
}
