package com.team.backend.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/28
 * @Time: 11:44
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MomentComment {
    // 评论ID
    @TableId
    private String commentId;
    // 对应的朋友圈ID
    private String momentId;
    // 评论用户ID
    private String userId;
    // 评论用户名
    private String nickname;
    // 评论内容
    private String content;
    // 评论时间
    private String createTime;
    // 删除状态（0:未删除, 1:已删除）
//    @TableLogic
    private Integer deleted;
}
