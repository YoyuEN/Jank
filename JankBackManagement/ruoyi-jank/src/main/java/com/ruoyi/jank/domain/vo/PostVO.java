package com.ruoyi.jank.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
//帖子
public class PostVO implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId
    private String postId;
    private String title;
    private String image;
    private Integer visibility;
    private String contentHtml;
    @TableField(exist = false)
    private List<String> categoryNames;
    private String username;
    private String createTime;
    private String updateTime;
    @TableLogic
    private Integer deleted;
}
