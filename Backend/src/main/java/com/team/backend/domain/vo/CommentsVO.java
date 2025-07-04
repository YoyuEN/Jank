package com.team.backend.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:40
 * @Description: 评论展示对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsVO {

    // 评论用户ID
    private String userId;
    // 用户名
    private String username;

    //文章id
    private String postId;

    // 评论用户头像
    private String avatar;

    // 评论内容
    private String content;

    private Integer goodorbad;

}