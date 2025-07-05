package com.ruoyi.jank.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.ruoyi.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

import java.io.Serializable;
import java.util.Date;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
//评论


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Excel(name = "评论唯一标识")
    @TableField("comment_id")
    private String commentId;
    @Excel(name = "评论内容")
    private String content;
    @Excel(name = "评论所属用户ID")
    @TableField("user_id")
    private String userId;
    @Excel(name = "评论所属文章ID")
    @TableField("post_id")
    private String postId;
    @Excel(name = "创建时间")
    private String createTime;
    @Excel(name = "更新时间")
    private String updateTime;
    private Integer goodorbad;
    private String  username;
    private String RootParentId;
    private String parentName;
    private String replyToCommentId;
    private String ParentId;
    private String avatar;
    @TableLogic
    private Integer deleted;
}
